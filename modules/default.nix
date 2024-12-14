{ overlays }:

{
  yoga-touch-keyboard = import ./yoga_touch_keyboard.nix;

  overlayNixpkgsForThisInstance =
    { pkgs, ... }:
    {
      nixpkgs = {
        inherit overlays;
      };
    };
}
