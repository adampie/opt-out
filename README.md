# opt-out

A Nix flake that opts you out of telemetry for common tools by setting the appropriate environment variables.

## Usage

Add the flake as an input:

```nix
inputs.opt-out.url = "https://flakehub.com/f/adampie/opt-out/0.1";
```

Then import the module for your platform. Use `default` to opt out of everything, or import individual tools by name.

### Home Manager

```nix
# All tools
imports = [ inputs.opt-out.homeManagerModules.default ];

# Individual tools
imports = [ inputs.opt-out.homeManagerModules.hashicorp ];
```

### nix-darwin

```nix
# All tools
imports = [ inputs.opt-out.darwinModules.default ];

# Individual tools
imports = [ inputs.opt-out.darwinModules.hashicorp ];
```

### NixOS

```nix
# All tools
imports = [ inputs.opt-out.nixosModules.default ];

# Individual tools
imports = [ inputs.opt-out.nixosModules.hashicorp ];
```
