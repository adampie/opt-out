{ config, pkgs, ... }:
{
  packages = [ pkgs.markdownlint-cli2 ];

  scripts = {
    readme-tables = {
      exec = "bash scripts/readme-tables.sh";
      packages = [ pkgs.jq ];
    };
    # nix flake check skips validateAll, the only check that covers the _-prefixed exclusions.
    validate-tools.exec = "nix eval .#validateAll > /dev/null";
  };

  git-hooks.hooks = {
    nixfmt.enable = true;
    deadnix.enable = true;
    statix.enable = true;
    shellcheck.enable = true;
    shfmt.enable = true;
    yamllint.enable = true;
    zizmor.enable = true;

    markdownlint-cli2 = {
      enable = true;
      entry = "${pkgs.markdownlint-cli2}/bin/markdownlint-cli2 --fix";
      files = "\\.md$";
    };

    validate-tools = {
      enable = true;
      entry = "nix eval .#validateAll";
      files = "^tools/.*\\.nix$";
      pass_filenames = false;
    };

    readme-tables = {
      enable = true;
      entry = "${config.scripts.readme-tables.scriptPackage}/bin/readme-tables";
      files = "^(tools/.*\\.nix|scripts/readme-tables\\.sh|README\\.md)$";
      pass_filenames = false;
      after = [ "validate-tools" ];
    };

    nix-flake-check = {
      enable = true;
      entry = "nix flake check";
      pass_filenames = false;
      always_run = true;
      stages = [ "pre-push" ];
    };
  };

  enterTest = ''
    nix flake check
    validate-tools
  '';
}
