inputs: {
  plugins.conform-nvim = {
    enable = true;
    autoInstall = {
      enable = true;
      enableWarnings = true;
    };
    settings = {
      formatters_by_ft = {
        rust = [ "rustfmt" ];
      };
      notify_no_formatters = true;
    };
  };

  keymaps = [
    # Format buffer
    {
      mode = "n";
      key = "<leader>f";
      action = {
        __raw = "function() require('conform').format({ lsp_format = 'fallback' }) end";
      };
      options = {
        desc = "[F]ormat buffer";
      };
    }
  ];
}
