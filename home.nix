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
    
    #  initContent = ''
    #    autoload -Uz vcs_info
    #    zstyle ':vcs_info:*' enable git svn
    #    zstyle ':vcs_info:git*' formats "- (%b)"
    #    precmd() {
    #      vcs_info
    #    }
    #    setopt prompt_subst
    #    prompt='%F{yellow}%n@%m%f %F{red}%~%f %F{yellow}>%f ' 
    #  '';
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    #--kitten themes --reload-in=all 'Gruvbox Dark'

    };
}
