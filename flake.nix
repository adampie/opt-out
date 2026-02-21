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
          toolDefs = map import toolFiles;

          tools = builtins.listToAttrs (
            map (t: {
              inherit (t) name;
              value = t.variables;
            }) toolDefs
          );

          variables = builtins.foldl' (acc: t: acc // t.variables) { } toolDefs;
        in
        {
          inherit variables tools;

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
