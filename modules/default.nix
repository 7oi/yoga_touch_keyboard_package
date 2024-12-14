{ overlays }:

{
  touch-keyboard-handler = import ./yoga_touch_keyboard.nix;

  overlayNixpkgsForThisInstance =
    { pkgs, ... }:
    {
      nixpkgs = {
        inherit overlays;
      };
    };
}
