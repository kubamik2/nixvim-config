inputs: {
  plugins.toggleterm = {
    enable = true;
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
