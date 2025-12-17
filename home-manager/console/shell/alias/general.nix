{
  lib,
  config,
  ...
}: {
  options.console.shell.alias.general.enable = lib.mkEnableOption "Enable general aliases in the shell";

  config = lib.mkIf config.console.shell.alias.general.enable {
    home.shellAliases = {
      cat = "bat";
      nvimf = "fzf -m --preview='bat --theme=Dracula --color=always {}' --bind 'enter:become(nvim {+})'";
      cdf = "cd '$(find ~ -type d \( -name '.git' -prune \) -o -type d -print | fzf --preview='ls {}' --bind 'enter:accept')'";
      fm = "xdg-open";
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
