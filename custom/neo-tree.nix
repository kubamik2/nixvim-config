inputs: {
  plugins.neo-tree = {
    enable = true;
    settings = {
      filesystem = {
        filtered_items = {
          visible = true;
        };
      };
      window.position = "float";
      default_component_configs = {
        file_size.enabled = false;
        git_status = {
          symbols = {
            # Change type
            added     = "";
            deleted   = "";
            modified  = "󰜥";
            renamed   = "󰬳";
            # Status type
            untracked = "";
            ignored   = "";
            unstaged  = "󰄱";
            staged    = "";
            conflict  = "";
          };
        };
      };
    };
  };

  globals = {
    # disable netrw
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  opts = {
    termguicolors = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree<CR>";
      options = { desc = "Explorer"; };
    }
  ];
}
