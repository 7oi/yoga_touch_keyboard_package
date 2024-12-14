{ overlays }:

{
  touch-keyboard-handler = import ./yoga_touch_keyboard_service.nix;

  overlayNixpkgsForThisInstance =
    { pkgs, ... }:
    {
      nixpkgs = {
        inherit overlays;
      };
    };
}
