# This configuration used evolve's as a base.
# Credits: https://github.com/e-v-o-l-v-e/nix-config

# list of nvf module options, examples, instruction etc :
# https://notashelf.github.io/nvf/options.html
{
    config,
    # hostname,
    lib,
    pkgs,
    # username,
    inputs,
  ...
}: let
inherit (config.programs.nvf) maxConfig;
    light-theme = "base16-ia-light";
    dark-theme = "tokyonight-moon";
in {

  /*
  imports = [
    inputs.nvf.nixosModules.default
  ];
  */

    config = {
        programs.nvf = {
            enable = true;
            settings.vim = {
            viAlias = false;
            vimAlias = true;
            debugMode = {
                enable = false;
                level = 16;
                logFile = "/tmp/nvim.log";
            };

        spellcheck = {
            enable = false;
            languages = [
                "en"
            ];
        };

        undoFile.enable = true;
        searchCase = "smart";

        options = {
            cursorlineopt = "line";
            shiftwidth = 4;
            scrolloff = 4;
            autoindent = true;
            smartindent = true;
        };

        lsp = {
            formatOnSave = false;
            lspkind.enable = false;
            lightbulb.enable = maxConfig;
            lspsaga.enable = false;
            trouble.enable = maxConfig;
            lspSignature.enable = maxConfig;
            otter-nvim.enable = true;
            nvim-docs-view.enable = false;
        };

        diagnostics.config = {
            underline.enable = true;
            virtual_lines.enable = false;
        };

        debugger = {
            nvim-dap = {
            # enable = maxConfig;
            enable = false;
            ui.enable = true;
            # sources = {
                #   java = "vscode-extensions.vscjava.vscode-java-pack";
            # };
            };
        };

        # This section does not include a comprehensive list of available language modules.
        # To list all available language module options, please visit the nvf manual.
        lsp.enable = true;
        languages = {
            enableFormat = false;
            enableTreesitter = true;
            enableExtraDiagnostics = true;

            # Languages.
            nix = {
                enable = true;
                extraDiagnostics.enable = true;
                treesitter.enable = true;
                format.type = "alejandra";
                lsp = {
                    server = "nixd";
                    package = pkgs.nixd;
                    options = {
                        # nixos.expr = (builtins.getFlake (builtins.toString ./.)).nixosConfigurations.${hostname}.options;
                        # home-manager.expr = "(builtins.getFlake (builtins.toString ./.)).homeConfigurations.${username}@${hostname}.options";
                        # nixos.expr = self.nixosConfigurations.${hostname}.options;
                        # home-manager.expr = self.homeConfigurations."${username}@${hostname}".options;
                        # nixos.expr = "/home/evolve/nix-config";
                        # nixos.expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.${hostname}.options";
                        # home_manager.expr = "(builtins.getFlake (builtins.toString ./.)).homeConfigurations.\"${username}@${hostname}\".options";
                    };
                };
            };

            java.enable = maxConfig;
            csharp.enable = maxConfig;
            python.enable = maxConfig;
            yaml.enable = true;
            dart.enable = false;


            markdown = {
                enable = true;
                extensions.render-markdown-nvim.enable = true;
            };

            lua.enable = maxConfig;
            bash.enable = true;
            clang.enable = true;
            css.enable = maxConfig;
            html.enable = maxConfig;
            sql.enable = true;
            kotlin.enable = false;
            ts.enable = false;
            go.enable = false;
            zig.enable = false;
            typst.enable = false;
            rust = {
                enable = true;
                crates.enable = true;
            };

            # Language modules that are not as common.
            assembly.enable = false;
            astro.enable = false;
            nu.enable = false;
            julia.enable = false;
            vala.enable = false;
            scala.enable = false;
            r.enable = false;
            gleam.enable = false;
            ocaml.enable = false;
            elixir.enable = false;
            haskell.enable = false;
            ruby.enable = false;
            fsharp.enable = false;

            tailwind.enable = false;
            svelte.enable = false;
        };

        visuals = {
            nvim-scrollbar.enable = false;
            nvim-web-devicons.enable = true;
            nvim-cursorline.enable = true;
            cinnamon-nvim.enable = true;
            fidget-nvim.enable = maxConfig;

            highlight-undo.enable = true;
            indent-blankline.enable = true;

            # Fun
            cellular-automaton.enable = false;
        };

        statusline = {
            lualine = {
                enable = true;
                # theme = "iceberg_dark"; # "catppuccin";
                theme = "catppuccin";
            };
        };

        options.termguicolors = true;

        theme = {
            enable = true;
            # name = "tokyonight";
            name = "catppuccin";
            # style = "night";
            style = "mocha";
            transparent = true;
        };

        startPlugins = [
            "base16"
            "catppuccin"
            "dracula"
            "everforest"
            "gruvbox"
            "nord"
            "onedark"
            "oxocarbon"
            "rose-pine"
            "solarized"
            "solarized-osaka"
            "tokyonight"
        ];

        # theme = {
        #   name = "tokyonight";;
        # };
        #   lib.mkForce (
        #   let
        #     light = config.gui.theme == "light";
        #     # light = false;
        #   in {
        #     enable = true;
        #     # name = "gruvbox";
        #     # name = "tokyonight";
        #     name =
        #       if light
        #       then "catppuccin"
        #       else "tokyonight";
        #     style =
        #       if light
        #       then "latte"
        #       else "night";
        #       # # then "latte"
        #       # then "light"
        #       # else "dark";
        #     # name = "gruvbox";
        #     # style = "dark";
        #   }
        # );

        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp = {
          enable = true;
        };

        snippets.luasnip.enable = true;

        filetree = {
            neo-tree = {
                enable = true;
            };
        };

        tabline = {
            nvimBufferline.enable = false;
        };

        treesitter.context.enable =maxConfig;

        binds = {
            whichKey.enable = false;
            cheatsheet.enable = false;
            hardtime-nvim = {
                enable = false;
                setupOpts = {
                    max_count = 5;
                    restriction_mode = "hint_and_block";
                };
            };
        };

        telescope.enable = true;
        telescope.setupOpts.pickers.colorscheme.enable_preview = true;

        git = {
            enable = false;
            gitsigns.enable = true;
            gitsigns.codeActions.enable = false; # throws an annoying debug message
        };

        minimap = {
            minimap-vim.enable = false;
            codewindow.enable = maxConfig; # lighter, faster, and uses lua for configuration
        };

        dashboard = {
            dashboard-nvim.enable = false;
            alpha.enable = maxConfig;
        };

        notify = {
            nvim-notify.enable = maxConfig;
        };

        projects = {
            project-nvim.enable = false;
        };

        mini = {
            surround.enable = false;
            colors.enable = false;
        };

        utility = {
            snacks-nvim.enable = maxConfig;
            nix-develop.enable = maxConfig;
            ccc.enable = false;
            vim-wakatime.enable = false;
            diffview-nvim.enable = true;
            yanky-nvim = {
                enable = false;
                # enable = maxConfig;
                setupOpts.ring.storage = "sqlite";
            };
            icon-picker.enable = maxConfig;
            surround = {
                enable = true;
                useVendoredKeybindings = false;
            };
            leetcode-nvim.enable = false;
            multicursors.enable = true;

            motion = {
                hop.enable = maxConfig;
                precognition.enable = false;
            };
            images = {
                image-nvim.enable = false;
            };
        };

        notes = {
            neorg = {
                enable = false;
                treesitter = {
                    norgPackage = pkgs.vimPlugins.nvim-treesitter.grammarToPlugin pkgs.tree-sitter-grammars.tree-sitter-norg;
                };
            };
            orgmode.enable = false;
            todo-comments.enable = true;
        };

        terminal = {
            toggleterm = {
                enable = true;
                lazygit.enable = true;
            };
        };

        ui = {
            borders.enable = false;
            noice.enable = maxConfig;
            colorizer.enable = false;
            modes-nvim.enable = false; # bad
            illuminate.enable = true;
            breadcrumbs = {
                enable = maxConfig;
                navbuddy.enable = maxConfig;
            };
            smartcolumn = {
                enable = false;
                setupOpts.custom_colorcolumn = {
                    # this is a freeform module, it's `buftype = int;` for configuring column position
                    nix = "110";
                    ruby = "120";
                    java = "130";
                    go = [
                        "90"
                        "130"
                    ];
                };
            };
            fastaction.enable = true;
        };

        assistant = {
            chatgpt.enable = false;
            copilot = {
                enable = false;
                cmp.enable = false;
            };
            codecompanion-nvim.enable = false;
        };

        session = {
            nvim-session-manager = {
                enable = maxConfig;
                setupOpts = {
                    autoload_mode = "CurrentDir";
                    autosave_ignore_dirs = [
                        "/home/antonio/"
                        "/home/antonio/Downloads"
                        "/home/antonio/tmp"
                    ];
                };
            };
        };

        gestures = {
            gesture-nvim.enable = false;
        };

        comments = {
            comment-nvim.enable = true;
        };

        presence = {
            neocord.enable = maxConfig;
        };

        keymaps = [
          # telescope colorscheme
          # { key = "<leader>fc"; action = ":Telescope colorscheme<cr>"; mode = ["n" "x"]; silent = true; desc = "Colorscheme [Telescope]"; }
            { key = "<C-o>"; action = ":Telescope find_files<cr>"; mode = ["n"]; silent = true; desc = "Colorscheme [Telescope]"; }
            { key = "<C-q>"; action = ":w<CR>"; mode = ["n"]; silent = false; }
            { key = "<C-p>"; action = ":wq<CR>"; mode = ["n"]; silent = false; }
            { key = "<C-n>"; action = ":q!<CR>"; mode = ["n"]; silent = false; }
            { key = "<C-n>"; action = ":q!<CR>"; mode = ["n"]; silent = false; }
            { key = "jk"; action = "<esc>"; mode = ["i"]; silent = true; }
            { key = "<space>"; action = "@"; mode = ["n"]; silent = true; }
            { key = "H"; action = "^"; mode = ["n"]; silent = true; }
            { key = "L"; action = "$"; mode = ["n"]; silent = true; }
            { key = "<CR>"; action = "<nop>"; mode = ["n"]; silent = true; }
            { key = "<C-e>"; action = ":Neotree toggle right<CR>"; mode = ["n"]; silent = false; }

            

          # yanky-nvim config
          # { key = "p";     action = "<Plug>(YankyPutAfter)";                    mode = ["n" "x"]; silent = true; }
                    # { key = "P";     action = "<Plug>(YankyPutBefore)";                   mode = ["n" "x"]; silent = true; }
          # { key = "gp";    action = "<Plug>(YankyGPutAfter)";                   mode = ["n" "x"]; silent = true; }
          # { key = "gP";    action = "<Plug>(YankyGPutBefore)";                  mode = ["n" "x"]; silent = true; }
          # { key = "<c-p>"; action = "<Plug>(YankyPreviousEntry)";               mode = "n";       silent = true; }
          # { key = "<c-n>"; action = "<Plug>(YankyNextEntry)";                   mode = "n";       silent = true; }
          # { key = "]p";    action = "<Plug>(YankyPutIndentAfterLinewise)";      mode = "n";       silent = true; }
          # { key = "[p";    action = "<Plug>(YankyPutIndentBeforeLinewise)";     mode = "n";       silent = true; }
          # { key = "]P";    action = "<Plug>(YankyPutIndentAfterLinewise)";      mode = "n";       silent = true; }
          # { key = "[P";    action = "<Plug>(YankyPutIndentBeforeLinewise)";     mode = "n";       silent = true; }
          # { key = ">p";    action = "<Plug>(YankyPutIndentAfterShiftRight)";    mode = "n";       silent = true; }
          # { key = "<p";    action = "<Plug>(YankyPutIndentAfterShiftLeft)";     mode = "n";       silent = true; }
          # { key = ">P";    action = "<Plug>(YankyPutIndentBeforeShiftRight)";   mode = "n";       silent = true; }
          # { key = "<P";    action = "<Plug>(YankyPutIndentBeforeShiftLeft)";    mode = "n";       silent = true; }
          # { key = "=p";    action = "<Plug>(YankyPutAfterFilter)";              mode = "n";       silent = true; }
          # { key = "=P";    action = "<Plug>(YankyPutBeforeFilter)";             mode = "n";       silent = true; }
        ];
      };
    };

    /*
    programs.fish.functions = {
      "nvim" = {
        argumentNames = [ "argv" ];
        body = ''
        if test $THEME = "light"
          command nvim -c "colorscheme ${light-theme}" $argv
        else 
          command nvim -c "colorscheme ${dark-theme}" $argv
        end
        '';
      };
    };
  */
  };

    options = {
        programs.nvf.maxConfig = lib.mkEnableOption "Enable heavier nvf config"; # // { default = true; };
    };
}
