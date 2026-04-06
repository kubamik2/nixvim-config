inputs: {
  # Useful plugin to show you pending keybinds.
  plugins.which-key = {
    enable = true;
    settings = {
      # delay between pressing a key and opening which-key (milliseconds)
      delay = 1000;
      icons = { mappings = { __raw = "vim.g.have_nerd_font"; }; };

      # Document existing key chains
      spec = [
        { __unkeyed = "<leader>s"; group = "[S]earch"; mode = [ "n" "v" ]; }
        { __unkeyed = "<leader>t"; group = "[T]oggle"; }
        { __unkeyed = "<leader>h"; group = "Git [H]unk"; mode = [ "n" "v" ]; }
        { __unkeyed = "gr"; group = "LSP Actions"; mode = "n"; }
      ];
    };
  };
}
