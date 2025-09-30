{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lic";
  home.homeDirectory = "/home/l/li/lic";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
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
  #  /etc/profiles/per-user/lic/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.

  gtk.font.size = 32;

  programs = {
    fuzzel = {
      enable = true;
      settings.main.anchor = "bottom-left";
    };
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          position = "bottom";
	  modules-left = [ "custom/launcher" "wlr/taskbar" ];
	  modules-right = [ "tray" ];
	  "wlr/taskbar" = {
	    "format" = "{icon}";
	    "icon-size" = 48;
	    "tootltip-format" = "{title}";
	    "on-click" = "activate";
	    "app_ids-mapping" = {
	      "firefox" = "firefox";
	    };
	  };
	  "custom/launcher" = {
	    "format" = "menu";
	    "icon-size" = 48;
	    "tootltip-format" = "{title}";
	    "on-click" = "fuzzel";
	  };
        };
      };
    };
    git = {
      enable = true;
      userName = "xa1on";
      userEmail = "xalon.dzn@gmail.com";
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      extraConfig = ''
        set background=dark
	colorscheme gruvbox
	set number
      '';
      plugins = with pkgs.vimPlugins; [
        gruvbox
        neo-tree-nvim
        nvim-web-devicons #neotree optional
        nvim-window-picker #neotree optional
        plenary-nvim #neotree dependency
        nui-nvim #neotree dependency
        nvim-treesitter
        nvim-treesitter-parsers.yaml
        nvim-treesitter-parsers.rust
        nvim-treesitter-parsers.python
        nvim-treesitter-parsers.puppet
        nvim-treesitter-parsers.nix
        nvim-treesitter-parsers.javascript
        nvim-treesitter-parsers.java
        nvim-treesitter-parsers.c
        nvim-treesitter-parsers.markdown
        nvim-treesitter-parsers.markdown_inline
        nvim-treesitter-parsers.markdown_inline
        nvim-treesitter-parsers.html
        nvim-treesitter-parsers.css
      ];
      viAlias = true;
      vimAlias = true;
    };
    starship = {
      enable = true;
    };
    kitty = {
      enable = true;
      enableGitIntegration = true;
      themeFile = "gruvbox-dark-hard";
      font = {
        name = "hack";
        #size = 20.0;
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;

    # needed to set wallpaper from absolute filepath
    checkConfig = false;

    config = rec {
      output = {
        HDMI-A-2 = {
	  scale = "1.6";
	  bg = "/home/l/li/lic/remote/home-manager/wallpaper_city.jpg fill";
	};
      };
      modifier = "Mod4";
      terminal = "konsole";
      keybindings = {
       "${modifier}+Return" = "exec ${pkgs.kdePackages.konsole}/bin/konsole";
       "${modifier}+c" = "kill";
       "${modifier}+g" = "exec ${pkgs.firefox}/bin/firefox";
      };
      fonts = {
        size = 16.0;
      };
      bars = [{ command = "waybar";}];
      # floating.criteria = [ { "app_id"=".*"; } ];
      focus.followMouse = false;
    };

    extraConfig = ''
      title_align center
    '';

  };

}
