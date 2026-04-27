{ config, pkgs, inputs, ... }:
    systemd.services.power-profile-daemon = {
    script = ''
        tlp-pd
    '';

    type = "oneshot";

    # "Enable" the service
    wantedBy = [ "multi-user.target" ];
  };
}
