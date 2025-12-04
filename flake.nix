{
  description = "A collection of Nix-flake templates for various kinds of projects.";

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
      in
      {
        formatter = pkgs.nixfmt;
        devShells.default = pkgs.mkShell { packages = with pkgs; [ just ]; };
      }
    )
    // {
      templates = {
        rust = {
          path = ./rust;
          description = "Rust template";
        };
        python = {
          path = ./python;
          description = "Python template";
        };
      };
    };
}
