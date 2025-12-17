{
  pkgs,
  lib,
  config,
  ...
}: {
  options.tool.virt-manager.enable = lib.mkEnableOption "Enables Virtual manager.";

  config = lib.mkIf config.tool.virt-manager.enable {
    specialisation = {
      VM.configuration = {
        users.users.k1.extraGroups = ["libvirtd"];
        virtualisation.libvirtd.enable = true;
        programs.virt-manager.enable = true;
        virtualisation.spiceUSBRedirection.enable = true;
      };
    };
  };
}
