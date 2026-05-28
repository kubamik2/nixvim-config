{ pkgs, ... }@inputs: {
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = false;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      c
      diff
      html
      lua
      luadoc
      markdown
      markdown_inline
      query
      vim
      vimdoc
      rust
      nix
      python
      cpp
      javascript
      typescript
      json
      toml
      elixir
    ];
  };
}
