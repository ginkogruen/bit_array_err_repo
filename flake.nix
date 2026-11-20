{
  description = "Reproduction for bit array";
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        {
          pkgs,
          ...

        }:
        {

          devShells.default = pkgs.mkShell {

            packages = with pkgs; [
              # Gleam tooling
              gleam

              # Erlang target
              beam29Packages.erlang
              beam29Packages.rebar3

              # Nix tooling
              nixd
              nixfmt

              # Other tooling
              reuse
            ];
          };
        };
    };
}
