{ lib, self, ... }:
{
    services.flatpak = {
        enable = true;
        overrides.global.Context.filesystems = [
            "/etc/localtime:ro"
            "/etc/zoneinfo:ro"
            "/etc/static/zoneinfo:ro"
        ];
        packages = [
            { appId = "net.waterfox.waterfox"; origin = "flathub"; }
            { appId = "com.stremio.Stremio"; origin = "flathub"; }
            { appId = "md.obsidian.Obsidian"; origin = "flathub"; }
            { appId = "com.spotify.Client"; origin = "flathub"; }
        ];
    };

    programs.appimage = {
        enable = true;
        binfmt = true;
    };
}
