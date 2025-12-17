{
  pkgs,
  lib,
  config,
  ...
}: {
  options.console.shell.zsh.enable = lib.mkEnableOption "Enables zsh configuration";

  config = lib.mkIf config.console.shell.zsh.enable {
    home.packages = with pkgs; [
      oh-my-zsh
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = ["git"];
        theme = "eastwood";
      };
      initContent = ''
        nitch
        eval "$(zoxide init zsh --cmd cd)"
        bindkey -v
      '';
    };
  };
}
