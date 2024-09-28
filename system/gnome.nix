{ config, pkgs, ... }:
{
	# Enable the GNOME Desktop Environment.
    services = {
        xserver = {
            enable = true;
            displayManager = {
                gdm = {
                    enable = true;
                };
            };
            desktopManager.gnome.enable=true;
        };
    };
 

	environment.gnome.excludePackages = with pkgs; [
	  # for packages that are pkgs.*
	  gnome-tour
	  gnome-music
	  epiphany
	  simple-scan
	];

	environment.systemPackages = with pkgs; [
	  gnome-software
	  gnome-extension-manager
	  gnome-tweaks
    gnome-boxes
	  adwaita-icon-theme
	  gnome-bluetooth
      
      # extensions ----------
	  gnomeExtensions.tray-icons-reloaded
	  gnomeExtensions.dash-to-dock
	  gnomeExtensions.no-overview
	  gnomeExtensions.resource-monitor
	  gnomeExtensions.ddterm
	  #----------------------

	];
}
