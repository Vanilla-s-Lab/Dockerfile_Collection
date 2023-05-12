{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; }; in {

      # https://nix.dev/tutorials/nixos/build-and-deploy/building-and-running-docker-images
      syncplay-server = pkgs.dockerTools.buildImage {
        name = "syncplay-server";

        # https://ryantm.github.io/nixpkgs/builders/images/dockertools/
        tag = "v0.0.1";

        config = {

          # https://github.com/NixOS/nixpkgs/blob/nixpkgs-unstable/pkgs/applications/networking/syncplay/default.nix
          Cmd = [ "${pkgs.syncplay-nogui}/bin/syncplay-server" ];
        };
      };

    };
}
