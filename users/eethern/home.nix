{ config, pkgs, dotfiles, ... }:

{
    home.packages = with pkgs; [
        neovim
        emacs-pgtk
        pyright

        # lua
        fennel 
        lua
        # luajit

        sqlite

        # dev
        cmake
        gnumake 
        gcc
        autoconf
        automake

        # pdf
        pandoc
        sioyek

        # apps
        qutebrowser
        firefox
        grim
        dunst
        spotify
        discord
        (flameshot.override { enableWlrSupport = true; })
        bitwarden-cli
        bitwarden-desktop

        # term
        alacritty
        bash
        fd
        zsh
        fzf
        htop
        jq
        killall
        libnotify
        pulsemixer
        playerctl
        ranger
        ripgrep
        starship
        zoxide
        pass-wayland

    ];

    home.sessionVariables = {
        EDITOR = "vim";
    };

    xdg.configFile = {
        zsh.source = "${dotfiles}/zsh/.config/zsh";
        starship.source = "${dotfiles}/zsh/.config/starship";
    };

    # Hack to make zsh use .config
    home.file.".zshenv".text = ''
        export ZDOTDIR="${config.xdg.configHome}/zsh"
    '';

    programs.git = {
        enable = true;
        userName  = "Christoffer Arvidsson";
        userEmail = "christoffer@arvidson.nu";
    };

    systemd.user.services.dropbox = {
        Unit = {
            Description = "Dropbox service";
        };
        Install = {
            WantedBy = [ "default.target" ];
        };
        Service = {
            ExecStart = "${pkgs.dropbox}/bin/dropbox";
            Restart = "on-failure";
        };
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "25.05";
    programs.home-manager.enable = true;

}
