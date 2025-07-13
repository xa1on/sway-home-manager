{
  config,
  pkgs,
  lib,
  ...
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
    bash.enable = true;
  
    neovim = {
      enable = true;
      defaultEditor = true;
      configure = {
        customRC = ''
          set background=dark
          colorscheme gruvbox
          set number
        '';
        packages.myVimPackage = with pkgs.vimPlugins; {
          start = [ 
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
        };
      };
      viAlias = true;
      vimAlias = true;
    };

    };
  };
}
