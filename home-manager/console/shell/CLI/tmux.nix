{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux.conf;
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      vim-tmux-navigator
      tmux-toggle-popup
    ];
  };
}
