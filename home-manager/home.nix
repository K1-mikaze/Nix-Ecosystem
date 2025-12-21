{
  config,
  lib,
  ...
}: {
  imports = [
    ./app/appBundle.nix
    ./console/consoleBundle.nix
    ./development/developmentBundle.nix
    ./system/systemBundle.nix
  ];

  development = {
    IDE = {
      jetbrains = {
        intellij.enable = false;
        android-studio.enable = false;
        ideavim.enable =
          lib.mkIf (
            config.development.IDE.jetbrains.intellij.enable
            || config.development.IDE.jetbrains.android-studio.enable
          )
          true;
      };
      vscode.enable = false;
      netbeans.enable = false;
      helix.enable = false;
    };

    language = {
      nix.enable = true;
      rust.enable = false;
      typescript.enable = false;
      dart.enable = false;
      java.enable = false;
      python.enable = false;
      cpp.enable = false;
      csharp.enable = false;
      lua.enable = false;
    };

    database = {
      sqlite.enable = false;
      mysql.enable = true;
      postgresql.enable = true;
      mongodb.enable = true;
      redis.enable = false;
    };

    tool = {
      obsidian.enable = false;
      penpot.enable = true;
      github.enable = false;
      notion.enable = false;
      discord.enable = true;
    };
  };

  app = {
    browser = {
      brave.enable = false;
      firefox.enable = true;
    };

    infomatic = {
      only-office.enable = true;
      mendeley.enable = false;
      video-editing.enable = false;
      spotify.enable = true;
    };
  };

  console = {
    terminal = {
      kitty.enable = false;
      foot.enable = true;
    };

    shell = {
      bash.enable = false;
      zsh.enable = true;
      tools.enable = lib.mkDefault true;
    };
  };

  system.hyprland.enable = false;
  systemd.obsidian-sync.enable = lib.mkIf (config.development.tool.obsidian.enable) true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.username = "k1";
  home.homeDirectory = "/home/k1";

  home.stateVersion = "25.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
}
