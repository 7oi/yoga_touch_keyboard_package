{
  config,
  pkgs,
  lib ? pkgs.lib,
  ...
}:

with lib;

let
  cfg = config.services.yoga-touch-keyboard;
in
{
  options = {
    services.yoga-touch-keyboard = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to enable the touch keyboard
        '';
      };
    };

  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.yoga-touch-keyboard ];

    systemd.services.yoga-touch-keyboard = {
      wantedBy = [ "multi-user.target" ];
      unitConfig = {
        Description = "Touch keyboard handler";
        Type = "simple";
      };
      serviceConfig = {
        ExecStart = "${pkgs.yoga-touch-keyboard}/sbin/yoga_touch_keyboard_handler";
      };
    };

    services.udev.packages = [ pkgs.yoga-touch-keyboard ];
  };
}
