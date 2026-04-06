inputs: {
  plugins.rustaceanvim = {
    enable = true;
    settings = {
      default_settings = {
        rust-analyzer = {
          procMacro = {
            enable = true;
          };
          cargo = {
            buildScripts = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
