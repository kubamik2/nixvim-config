inputs: {
  lsp = {
    servers = {
      # nix
      nil_ls = {
        enable = true;
        config = {
          filetypes = [ "nix" ];
          root_markers = [ ".git" "flake.nix" ];
        };
      };

      # c, c++
      clangd.enable = true;

      # lua
      lua_ls.enable = true;

      # make, cmake
      neocmake.enable = true;

      # lua formatter
      stylua.enable = true;
      
      # python
      pyright.enable = true;

      # erlang
      elp.enable = true;

      # elixir
      elixirls.enable = true;

      # go
      gopls.enable = true;
    };
  };
}
