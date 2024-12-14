{
  config,
  pkgs,
  lib ? pkgs.lib,
  ...
}:

with lib;

let
  cfg = config.services.touch-keyboard-handler;
in
{
  options = {
    services.touch-keyboard-handler = {
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
    environment = {
      systemPackages = [ pkgs.yoga-touch-keyboard ];
      etc = {
        touch_keyboard.source = "${pkgs.yoga-touch-keyboard}/etc/touch_keyboard";
      };
    };

    systemd.services.touch-keyboard-handler = {
      # wantedBy = [ "multi-user.target" ];
      unitConfig = {
        Description = "Touch keyboard handler";
      };
      serviceConfig = {
        ExecStart = "${pkgs.yoga-touch-keyboard}/sbin/touch_keyboard_handler";
        WorkingDirectory = "/etc/touch_keyboard";
        Type = "simple";
      };
    };

    services.udev.packages = [ pkgs.yoga-touch-keyboard ];
  };
}
