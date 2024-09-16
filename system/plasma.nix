{ config, pkgs, ... }:
{
    
    # Enable the plasma Desktop Environment.
    services = {
        desktopManager.plasma6 = {
            enable = true;
            #enableQt5Integration = true; #disable for qt6 full version
            };
        displayManager = {
            defaultSession = "plasma";
            sddm = {
                enable = true;
                wayland.enable = true;
            };
        };
    };
    
    programs.kdeconnect = {
        enable = true;
    };
    
    #environment.excludePackages = with pkgs; [
    #  # for packages that are pkgs.*   
    #];
    
   environment.systemPackages = with pkgs; [
      kdePackages.elisa
      kdePackages.breeze
      kdePackages.kate
      kdePackages.dolphin
      kdePackages.filelight
      kdePackages.konsole
      kdePackages.discover
      kdePackages.yakuake
	
  ];
  
}
