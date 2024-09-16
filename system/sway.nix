{ config, pkgs, lib, ... }:
{
    #login manager - only use of not usinf with another desktop!
    #services.xserver.displayManager.gdm.wayland.enable = true;
    
    #neeed for Mount, trash. etc on Thunar
    #services.gvfs.enable = true;

    #Thumbnail supoport for images on Thunar
    #services.tumbler.enable = true;

    #programs.thunar.enable = true;

    #needed if xfce is not used as desktop, Saves and program preferences
    programs.xfconf.enable = true;

    #Thunar plugins
    #programs.thunar.plugins = with pkgs.xfce; [
    #    thunar-volman
    #    thunar-archive-plugin
    #];

    # enable Sway window manager
    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
    };

    #programs.waybar = {
    #    enable = true;
    #};

    environment.systemPackages = with pkgs; [
        #grim # screenshot functionality
        #slurp # screenshot functionality
        alacritty
        wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
        mako # notification system developed by swaywm maintainer
        rofi
        waybar
        swaybg
        swaylock
        swaysettings
        swayidle
        swaynotificationcenter
        brightnessctl
        cosmic-files
    ];
    # Enable the gnome-keyring secrets vault.
    # Will be exposed through DBus to programs willing to store secrets.
    services.gnome.gnome-keyring.enable = true;

}
