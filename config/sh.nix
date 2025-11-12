{ lib, self, ... }:
{
    programs = {
        starship = {
            enable = true;
            settings = {
                add_newline = true;
                # "$schema" = "https://starship.rs/config-schema.json";
                character = {
                    success_symbol = "[❯](bold green)";
                    error_symbol = "[❯](bold bright green)";
                };
                nix_shell = {
                    symbol = " ";
                    heuristic = false;
                };
                username = {
                    show_always = true;
                    style_user = "green bold";
                    style_root = "bright-red bold";
                };
                os.disabled = false;
                # palette = "catppuccin_${"mocha"}";
            };
        };
    };

    environment.localBinInPath = true;
}
