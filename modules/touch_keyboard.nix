{
  config,
  pkgs,
  lib ? pkgs.lib,
  ...
}:

with lib;

let
  cfg = config.services.yoga_touch_keyboard;
in
{
  services.yoga_touch_keyboard = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Whether to enable the touch keyboard
      '';
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.yoga_touch_keyboard ];

    systemd.services.yoga_touch_keyboard = {
      wantedBy = [ "multi-user.target" ];
      unitConfig = {
        Description = "Touch keyboard handler";
        Type = "simple";
      };
      serviceConfig = {
        ExecStart = "${pkgs.yoga_touch_keyboard}/sbin/yoga_touch_keyboard_handler";
      };
    };

    services.udev.packages = [ pkgs.yoga_touch_keyboard ];
  };
}
