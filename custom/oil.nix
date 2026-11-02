inputs: {
  plugins.oil = {
    enable = true;

    settings = {
      default_file_explorer = true;
      delete_to_trash = true;
      # constrain_cursor = "editable";
      keymaps = {
        "<C-c>" = false;
        "<C-l>" = false;
        "<C-s>" = false;
        "<C-h>" = false;
        "<C-t>" = false;

        "<C-r>" = "actions.refresh";
        "<Esc>" = "actions.close";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<CMD>Oil<CR>";
      options = {
        desc = "Explorer";
      };
    }
  ];
}
