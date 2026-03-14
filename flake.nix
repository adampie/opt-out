{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ ];

      flake =
        let
          inherit (inputs.flake-parts.inputs.nixpkgs-lib) lib;
          toolFiles = ((inputs.import-tree.addPath ./tools).withLib lib).files;

          validateTool =
            file: t:
            let
              fileName = builtins.baseNameOf (builtins.toString file);
              has = attr: builtins.hasAttr attr t;
              hasMeta = attr: builtins.hasAttr attr (t.meta or { });
              isString = v: builtins.isString v;
              isBool = v: builtins.isBool v;
              isAttrs = v: builtins.isAttrs v;
            in
            assert lib.assertMsg (
              has "name" && isString t.name
            ) "${fileName}: missing or invalid 'name' (string)";
            assert lib.assertMsg (
              has "meta" && isAttrs t.meta
            ) "${fileName}: missing or invalid 'meta' (attrset)";
            assert lib.assertMsg (
              hasMeta "description" && isString t.meta.description
            ) "${fileName}: missing or invalid 'meta.description' (string)";
            assert lib.assertMsg (
              hasMeta "homepage" && isString t.meta.homepage
            ) "${fileName}: missing or invalid 'meta.homepage' (string)";
            assert lib.assertMsg (
              hasMeta "documentation" && isString t.meta.documentation
            ) "${fileName}: missing or invalid 'meta.documentation' (string)";
            assert lib.assertMsg (
              hasMeta "lastChecked" && isString t.meta.lastChecked
            ) "${fileName}: missing or invalid 'meta.lastChecked' (string)";
            assert lib.assertMsg (
              hasMeta "lastChecked" -> builtins.match "[0-9]{4}-[0-9]{2}-[0-9]{2}" t.meta.lastChecked != null
            ) "${fileName}: 'meta.lastChecked' must be YYYY-MM-DD format";
            assert lib.assertMsg (
              hasMeta "hasTelemetry" && isBool t.meta.hasTelemetry
            ) "${fileName}: missing or invalid 'meta.hasTelemetry' (bool)";
            assert lib.assertMsg (
              has "variables" && isAttrs t.variables
            ) "${fileName}: missing or invalid 'variables' (attrset)";
            assert lib.assertMsg (
              has "variables" -> builtins.all isString (builtins.attrValues t.variables)
            ) "${fileName}: all values in 'variables' must be strings";
            assert lib.assertMsg (
              has "commands" && isAttrs t.commands
            ) "${fileName}: missing or invalid 'commands' (attrset)";
            assert lib.assertMsg (
              has "config" && isAttrs t.config
            ) "${fileName}: missing or invalid 'config' (attrset)";
            t;

          toolDefs = lib.zipListsWith validateTool toolFiles (map import toolFiles);

          allToolFiles =
            let
              entries = builtins.readDir ./tools;
              nixFiles = lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name) entries;
            in
            map (name: ./tools + "/${name}") (builtins.attrNames nixFiles);

          allToolDefs = lib.zipListsWith validateTool allToolFiles (map import allToolFiles);

          validateAll = builtins.deepSeq (map (t: t.name) allToolDefs) true;

          tools = builtins.listToAttrs (
            map (t: {
              inherit (t) name;
              value = t.variables;
            }) toolDefs
          );

          variables = builtins.foldl' (acc: t: acc // t.variables) { } toolDefs;
        in
        {
          inherit variables tools validateAll;

          homeManagerModules =
            builtins.listToAttrs (
              map (t: {
                inherit (t) name;
                value = {
                  home.sessionVariables = t.variables;
                };
              }) toolDefs
            )
            // {
              default = {
                home.sessionVariables = variables;
              };
            };

          darwinModules =
            builtins.listToAttrs (
              map (t: {
                inherit (t) name;
                value = {
                  environment.variables = t.variables;
                };
              }) toolDefs
            )
            // {
              default = {
                environment.variables = variables;
              };
            };

          nixosModules =
            builtins.listToAttrs (
              map (t: {
                inherit (t) name;
                value = {
                  environment.sessionVariables = t.variables;
                };
              }) toolDefs
            )
            // {
              default = {
                environment.sessionVariables = variables;
              };
            };
        };
    };
}
