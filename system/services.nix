{ config, pkgs, ... }:
{    
    # Enable the X11 windowing system. Can I safley remove this????
    services.xserver.enable = true;
    
    # Flatpak
    services.flatpak.enable = true;
    
    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "gb";
        variant = "";
    };
    
    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };
}
