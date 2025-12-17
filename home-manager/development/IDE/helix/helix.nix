{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.IDE.helix.enable = lib.mkEnableOption "Enables Evil-Helix ";

  config = lib.mkIf config.development.IDE.helix.enable {
    home.packages = with pkgs; [
      google-java-format
    ];

    programs.helix = {
      enable = true;
      package = pkgs.evil-helix;

      settings = {
        theme = "catppuccin_mocha";

        editor = {
          line-number = "relative";
          mouse = false;

          lsp = {
            display-messages = true;
            display-inlay-hints = true;
            auto-signature-help = false;
          };

          cursorline = true;
        };

        keys.normal = {
          # "A-1" = "file_explorer";
          "C-s" = ":w";
          K = "hover"; # Show diagnostic (hover)
          space = {
            # Fuzzy search (Telescope equivalents)
            f = {
              f = ":open ."; # Find files
            };

            # Code actions (LSP)
            c = {
              a = "code_action"; # Code actions
              r = "goto_reference"; # References
              d = "goto_definition"; # Definitions
              i = "goto_implementation"; # Implementations
              D = "goto_type_definition"; # Type definitions
            };

            # UI/Appearance
            o = {
              t = ":theme"; # Change colorscheme
            };
            g = {
              l = {
                b = ":toggle git-diff-line-history"; # Toggle line blame (similar)
              };
            };
          };

          # Save file
        };

        # Additional insert mode keybindings
        keys.insert = {
          "C-s" = ":w";
        };
      };

      languages = {
        language-server.jdtls = {
          command = "${pkgs.jdt-language-server}/bin/jdtls";
          args = [
            "-configuration"
            "${config.xdg.cacheHome}/jdtls/config"
            "-data"
            "${config.xdg.cacheHome}/jdtls/workspace"
          ];
        };

        language = [
          {
            name = "java";
            auto-format = true;
            formatter = {
              command = "${pkgs.google-java-format}/bin/google-java-format";
              args = ["-a"];
            };
            language-servers = ["jdtls"];
            roots = [".git" "pom.xml" "build.gradle" "build.gradle.kts"];
          }
        ];
      };
    };
  };
}
