inputs: {
  plugins.nvim-tree = {
    enable = true;
    settings = {
      filters = {
        git_ignored = false;
      };
      diagnostics = {
        enable = true;
        show_on_dirs = true;
      };
    };
  };

  opts = {
    termguicolors = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = { __raw = "require('nvim-tree.api').tree.toggle"; };
      options = { desc = "Explorer"; };
    }
  ];
}
