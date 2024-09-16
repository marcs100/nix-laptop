{ config, pkgs, ... }:
{
    #imports = [
    #    inputs.home-manager.nixosModules.default
    #];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.marc = {
        isNormalUser = true;
        description = "marc";
        extraGroups = [ "networkmanager" "wheel" "input" "video" ];
        packages = with pkgs; [
        #  thunderbird
        ];
    };


    #home-manager = {
    #    #also pass inputs to home-manager modules
    #    extraSpecialArgs = { inherit inputs; };
    #    users = {
    #        "marc" = import ./home-manager/home.nix;
    #    };
    #};
}
