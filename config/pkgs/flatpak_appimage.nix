{ lib, self, ... }:
{
    services.flatpak = {
        enable = true;
        packages = [
            { appId = "net.waterfox.waterfox"; origin = "flathub"; }
            { appId = "com.stremio.Stremio"; origin = "flathub"; }
            { appId = "md.obsidian.Obsidian"; origin = "flathub"; }
        ];
    };

    programs.appimage = {
        enable = true;
        binfmt = true;
    };
}
