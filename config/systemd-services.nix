{ config, pkgs, inputs, ... }:
{
    services.dbus.packages = [ pkgs.tlp-pd ];

    systemd.services.tlp-pd = {
        description = "TLP profiles daemon API service";
        after = [ "multi-user.target" "display-manager.target" ];
        wantedBy = [ "graphical.target" ];
        serviceConfig = {
            Type = "dbus";
            BusName = "org.freedesktop.UPower.PowerProfiles";
            ExecStart = "${pkgs.tlp-pd}/bin/tlp-pd";
            Restart = "on-failure";
            LockPersonality = true;
            KeyringMode = "private";
            MemoryDenyWriteExecute = true;
            NoNewPrivileges = true;
            ProtectClock = true;
            ProtectControlGroups = true;
            ProtectHome = true;
            ProtectHostname = true;
            ProtectKernelLogs = true;
            ProtectSystem = "full";
            RestrictNamespaces = true;
            RestrictRealtime = true;
            RestrictSUIDSGID = true;
        };
    };
}
