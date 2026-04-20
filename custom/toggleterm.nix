inputs: {
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts = {
        border = "curved";
      };
    };
  };

  keymaps = [
    {
      mode = ["t" "n"];
      key = "<C-\\>";
      action = "<cmd>ToggleTerm<CR>";
      options = { desc = "Toggle terminal"; };
    }
  ];
}
