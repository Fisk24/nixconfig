{ config, pkgs, ... }:

{
  imports = [
    ../../modules/programs/git.nix
  ];
  home.username = "fisk";
  home.homeDirectory = "/home/fisk";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    ## Gnome Extentions
    pkgs.gnomeExtensions.user-themes
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.dash-to-panel
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.coverflow-alt-tab
    pkgs.gnomeExtensions.vitals
    pkgs.gnomeExtensions.wallpaper-slideshow
    pkgs.gnomeExtensions.quick-settings-audio-panel
    pkgs.gnomeExtensions.quick-settings-audio-devices-hider
    pkgs.gnomeExtensions.quick-settings-audio-devices-renamer
    pkgs.gnomeExtensions.caffeine
    ## GTK Theme
    pkgs.orchis-theme
    pkgs.tela-circle-icon-theme
    pkgs.oreo-cursors-plus
    pkgs.marble-shell-theme


    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
      '')
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

  dconf.settings = {
    ## Vanilla Gnome Settings
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
    };
    
    # Theme Settings
    "org/gnome/shell/extensions/user-theme" = {
      # GTK Theme https://www.opendesktop.org/s/Gnome/p/1253385/
      name = "Marble-blue-dark";
    };

    "org/gnome/desktop/interface" = {
      ## Theme stuff
      color-scheme = "prefer-dark";
      cursor-theme = "oreo_blue_cursors";
      icon-theme = "Tela-circle-dark";
      gtk-theme = "Orchis-Dark-Compact";

      ## Clock
      clock-show-weekday = true;
      clock-show-date = true;
    };

    ## Gnome Extentions
    "org/gnome/shell" = {
      disable-user-extensions = false;

      #List of enabled Extentions
      # Want to enable a new one?
      # Use: gnome-extensions list
      enabled-extensions = [
        "CoverflowAltTab@palatis.blogspot.com"
        "Vitals@CoreCoding.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "azwallpaper@azwallpaper.gitlab.com"
        "blur-my-shell@aunetx"
        "caffeine@patapon.info"
        "dash-to-panel@jderose9.github.com"
        "quicksettings-audio-devices-hider@marcinjahn.com"
        "quicksettings-audio-devices-renamer@marcinjahn.com"
        "quick-settings-audio-panel@rayzeq.github.io"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    ## Gnome Extension Settings
    # -------------------------
    # Wallpaper Slideshow
    # If you want to manually manager a wallpaper folder for it to use:
    #"/org/gnome/shell/extensions/azwallpaper" = {
    #  slideshow-directory = "/home/fisk/Pictures/wallpapers";
    #};
    # Or we can let it download bing wallpapers autom4atically 
    # And let it use those to make the slideshow
    "org/gnome/shell/extensions/azwallpaper" = {
      bing-wallpaper-download = "true";
      bing-download-directory = "/home/fisk/Pictures/Bing Wallpapers";
      slideshow-directory = "/home/fisk/Pictures/Bing Wallpapers";
      # Set the amount of time each slide should be active: (hour, minute, second)
      slideshow-slide-duration = "(0, 5, 0)";
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      trans-use-custom-opacity = true;
      trans-panel-opacity = 0.40000000000000002;
    };

    "org/gnome/shell/extensions/coverflowalttab" = {
      switcher-looping-method = "Carousel";
    };

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
  #  /etc/profiles/per-user/fisk/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    SUPERCOOLTESTENV = "this is a super cool test of home manager environment variables";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
