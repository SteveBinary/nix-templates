{
  description = "A Nix-flake-based pure-nix development environment for Python";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import inputs.nixpkgs { inherit system; };

        myPython = pkgs.python314.withPackages (pp: with pp; [ numpy ]);
      in
      {
        devShells.default = pkgs.mkShell { packages = [ myPython ]; };

        formatter = pkgs.nixfmt;
      }
    );
}
