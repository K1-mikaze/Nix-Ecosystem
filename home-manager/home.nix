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
        ideavim.enable = lib.mkIf (
           config.development.IDE.jetbrains.intellij.enable || 
           config.development.IDE.jetbrains.android-studio.enable
        ) true;
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

    tool = {
      obsidian.enable = false;
      penpot.enable = true;
      github.enable = false;
      notion.enable = false;

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
      alias = {
        general.enable = true;
      };
    };
  };


  system.hyprland.enable = false;
  systemd.obsidian-sync.enable = true;


  nixpkgs.config = {
    allowUnfree = true;
  };

  home.username = "k1";
  home.homeDirectory = "/home/k1";

  home.stateVersion = "25.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
}
