{
  description = "A Nix-flake-based development environment for Python";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { ... }@inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import inputs.nixpkgs {
          inherit system;
        };

        myPython = pkgs.python313.withPackages (
          pp: with pp; [
            # python packages
          ]
        );
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            myPython
          ];
        };

        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
