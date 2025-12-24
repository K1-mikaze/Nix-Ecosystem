{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./tmux.nix
  ];

  options.console.shell.tools.enable = lib.mkEnableOption "Enable CLI-Tools terminal";

  config = lib.mkIf config.console.shell.tools.enable {
    home.packages = with pkgs; [
      git
      nitch
      zip
      unzip
      unrar
      ripgrep
      fzf
      bat
      ffmpeg
      zoxide
      wl-clipboard
      curl
      gemini-cli
      posting
      tree
      marksman
      prettier
      yaml-language-server
    ];

    home.shellAliases = {
      format = "ffmpeg -i";
      unrar = "unrar x";
      tree = "tree --gitignore -C | less";
      cat = "bat --theme='Catppuccin Mocha' --color=always {}";
      nvimf = "fzf -m --preview='bat --theme=\"Catppuccin Mocha\" --color=always {}' --bind 'enter:become(nvim {+})'";
      cdf = "cd '$(find ~ -type d \( -name '.git' -prune \) -o -type d -print | fzf --preview='ls {}' --bind 'enter:accept')'";
      fm = "xdg-open";
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    programs.btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
        vim_keys = true;
        rounded_corners = true;
      };
    };

    home.file.".config/posting/config.yaml".source = ../../../development/settings/configurations/posting-config.yaml;
  };
}
