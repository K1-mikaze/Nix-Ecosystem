{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.browser.brave.enable = lib.mkEnableOption "Enable Brave browser";

  config = lib.mkIf config.app.browser.brave.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        {
          id = "oldceeleldhonbafppcapldpdifcinji"; # AI grammar Checker
        }
        {
          id = "jlmpjdjjbgclbocgajdjefcidcncaied"; # Daily Dev
        }
        {
          id = "lnjaiaapbakfhlbjenjkhffcdpoompki"; # Catppucin Web File Explorer Icons
        }
        {
          id = "bkkmolkhemgaeaeggcmfbghljjjoofoh"; # Catppucin Theme
        }
        {
          id = "hfjbmagddngcpeloejdejnfgbamkjaeg"; # Vimium C
        }
      ];
      # commandLineArgs = [
      #   "--disable-features=WebRtcAllowInputVolumeAdjustment"
      # ];
    };
  };
}
