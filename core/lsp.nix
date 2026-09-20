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
      clangd = {
        enable = true;
        config = {
          cmd = [
            "clangd"
            { __raw = ''
              "--query-driver=" .. os.getenv("HOME") .. "/.platformio/packages/toolchain-*/bin/*" .. ",/nix/store/*/bin/gcc,/nix/store/*/bin/g++"
            ''; }
          ];
        };
      };

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

      # wgsl
      wgsl_analyzer.enable = true;

      # Arduino
      arduino_language_server = {
        enable = true;
        config = {
          filetypes = [ "arduino" "ino" ];
        };
      };
    };
  };
}
