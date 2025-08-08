{ config, pkgs, ... }:

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

        # build c
        cmake
        gnumake 
        gcc
        autoconf
        automake

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

    programs.git = {
        enable = true;
        userName  = "Christoffer Arvidsson";
        userEmail = "christoffer@arvidson.nu";
    };

    programs.zsh = {
        enable = true;
        # enableCompletions = true;
        # autosuggestions.enable = true;
        # syntaxHighlighting.enable = true;

        shellAliases = {
            update = "sudo nixos-rebuild switch";
        };
        history.size = 10000;
    };

    programs.tmux = {
        enable = true;
        plugins = with pkgs; [
            tmuxPlugins.sensible
            tmuxPlugins.continuum
            tmuxPlugins.prefix-highlight
            tmuxPlugins.yank
            tmuxPlugins.rose-pine
        ];
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
