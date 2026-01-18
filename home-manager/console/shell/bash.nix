{
  pkgs,
  lib,
  config,
  ...
}: {
  options.console.shell.bash.enable = lib.mkEnableOption "Enables Bash configurations";

  config = lib.mkIf config.console.shell.bash.enable {
    home = {
      packages = with pkgs; [
        bash-completion
      ];

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
      };
    };
    programs.bash = {
      enable = true;
      bashrcExtra = ''
        eval "$(zoxide init --cmd cd bash)"
        bind 'set show-all-if-ambiguous on'
        set -o vi
        eval "$(fzf --bash)"
        bind 'TAB:menu-complete'
        bind "set completion-ignore-case on"
        PS1='\[\033[1;33m\] [\[\033[1;34m\][\u-\h\[\033[1;34m\]]\[\033[1;32m\][\w]\[\033[1;31m\]$(__git_ps1 "[%s]")\[\033[1;33m\]] \[\033[0m\]\033[1;34m\]$ \033[1;37m\]'
        if [ -f /usr/share/git/completion/git-prompt.sh ]; then
          source /usr/share/git/completion/git-prompt.sh
        elif [ -f ~/.git-prompt.sh ]; then
          source ~/.git-prompt.sh
        fi
      '';
    };
    home.file = {
      ".git-prompt.sh".source = ../utils/.git-prompt.sh;
    };
  };
}
