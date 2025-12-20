{
  lib,
  config,
  ...
}: {
  options.tool.virtManager.enable = lib.mkEnableOption "Enables Virtual manager.";

  config = lib.mkIf config.tool.virtManager.enable {
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
