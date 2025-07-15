{ config
, pkgs
, lib
, ...
}: {
  home = {
    username = "jaysa";
    homeDirectory = "/home/j/ja/jaysa";

    packages = with pkgs; [
      lsd
    ];

    stateVersion = "24.05"; # Please read the comment before changing.
  };

  programs = {
    home-manager.enable = true;

    kitty = {
      enable = true;
      settings = {
      	shell = "zsh";
      };
      shellIntegration.enableZshIntegration = true;
      enableGitIntegration = true;
      themeFile = "gruvbox-dark-hard";
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
      enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ls = "lsd";
        lt = "lsd --tree";
        update = "sudo nixos-rebuild switch";
        edit = "nvim ~/nixos-config/configuration.nix";
      };

      # disable pulling in OCF's systemwide zshrc
      envExtra = ''
        unsetopt GLOBAL_RCS 
      ''; 

    };
  };
}
