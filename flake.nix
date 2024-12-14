# this was taken from hydra
{
  description = "Flake for the touch keyboard for the Lenovo Yoga book";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forEachSystem = nixpkgs.lib.genAttrs systems;

      overlayList = [ self.overlays.default ];

      pkgsBySystem = forEachSystem (
        system:
        import nixpkgs {
          inherit system;
          overlays = overlayList;
        }
      );

    in
    {

      # A Nixpkgs overlay that provides a 'yoga_touch_keyboard' package.
      overlays.default = final: prev: {
        yoga_touch_keyboard = final.callPackage ./pkgs/yoga_touch_keyboard { };
      };

      packages = forEachSystem (system: {
        yoga_touch_keyboard = pkgsBySystem.${system}.yoga_touch_keyboard;
        default = pkgsBySystem.${system}.yoga_touch_keyboard;
      });

      nixosModules = import ./modules { overlays = overlayList; };
    };
}
