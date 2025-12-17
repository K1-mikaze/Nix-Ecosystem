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
      opencode
      btop
      tree
      marksman
      yaml-language-server
    ];

    home.shellAliases = {
      format = "ffmpeg -i";
      unrar = "unrar x";
      tree = "tree --gitignore -C | less";
    };
  };
}
