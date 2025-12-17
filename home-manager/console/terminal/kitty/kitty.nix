{
  pkgs,
  lib,
  config,
  ...
}: {
  options.console.terminal.kitty.enable = lib.mkEnableOption "Enables Kitty and its configuration";

  config = lib.mkIf config.console.terminal.kitty.enable {
    home.packages = with pkgs; [
      kitty
    ];

    home.shellAliases = {
      icat = "kitten icat";
    };
    programs.kitty = {
      enable = true;
      font.name = "Hack Nerd Font";
      font.size = 16;

      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        confirm_os_window_close = 0;
        background_opacity = 0.9;
      };

      themeFile = "Catppuccin-Mocha";

      extraConfig = ''
        map ctrl+t new_tab

        map ctrl+1 goto_tab 1
        map ctrl+2 goto_tab 2
        map ctrl+3 goto_tab 3
        map ctrl+4 goto_tab 4
        map ctrl+5 goto_tab 5
        map ctrl+6 goto_tab 6
        map ctrl+7 goto_tab 7
        map ctrl+8 goto_tab 8
        map ctrl+9 goto_tab 9

        map alt+t new_window_with_cwd
        map alt+w close_window

        map alt+h neighboring_window left
        map alt+l neighboring_window right
        map alt+k neighboring_window up
        map alt+j neighboring_window down

        map alt+right resize_window narrower
        map alt+left resize_window wider
        map alt+up resize_window taller
        map alt+down resize_window shorter

        map ctrl+shift+c copy_to_clipboard
        map ctrl+shift+v paste_from_clipboard

        tab_bar_edge top
        tab_bar_align left
        tab_bar_style powerline
        active_tab_title_template '󱄅'
        tab_bar_margin_height 3.0 0.0
        inactive_tab_font_style bold
        tab_title_max_length 6
        tab_bar_min_tabs 2
        cursor_blink_interval -1
        mouse_hide_wait 3.0
        window_margin_width 0
        single_window_margin_width 1
        active_border_color #FFF
        inactive_border_color #010
        window_border_width 1pt
        enabled_layouts Tall, *
        hide_window_decorations yes
        window_padding_width 0
        dynamic_background_opacity yes
      '';
    };
  };
}
