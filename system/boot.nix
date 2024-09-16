  { config, pkgs, ... }:
{
    #kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    #boot.enableContainers = true;

    zramSwap.enable = true;
}
