{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "marc";
  home.homeDirectory = "/home/marc";

  home.sessionPath = [
      "/home/marc/.local/bin"
  ];
  

  programs = {

    bash = {
      enable = true;
      shellAliases = {
        edit-conf = "hx ~/nix/*.nix ~/nix/system/*.nix ~/nix/home-manager/*.nix";
        nix-rebuild = "sudo nixos-rebuild switch --flake ~/nix";
        nix-rebuild-boot = "sudo nixos-rebuild boot --flake ~/nix";
        nix-rebuild-dry = "sudo nixos-rebuild dry-build --flake ~/nix";
        nix-clean = "sudo nix-env --delete-generations +5 --profile /nix/var/nix/profiles/system && nix-collect-garbage && sudo nixos-rebuild boot --flake ~/nix";
        devshell = "nix develop ~/nix/dev";
        nix-gens = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";    
        qpkg = "qpkg.sh";
      };
    };

    git = {
      enable = true;
      userName = "marcs100";
      userEmail = "marcs100@gmail.com";

    };

    vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
          vim-airline
          nerdtree
      ];
      
      extraConfig = ''
        set smartindent
        set autoindent
        set mouse=a
        set tabstop=4
        set expandtab
    		set shiftwidth=4 smarttab        
        set ignorecase
        set smartcase
        set number
        set nowrap
        map <F2> :NERDTreeToggle<CR>
        map <F3> :NERDTreeFind<CR>
      '';
    };
  };




  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    #(pkgs.callPackage scribe-cli {})
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/marc/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
