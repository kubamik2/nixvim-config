inputs: {
  # Better Around/Inside textobjects
  #
  # Examples:
  #  - va)  - [V]isually select [A]round [)]paren
  #  - yinq - [Y]ank [I]nside [N]ext [Q]uote
  #  - ci'  - [C]hange [I]nside [']quote
  plugins.mini-ai = {
    enable = true;
    settings = { n_lines = 500; };
  };

  # Add/delete/replace surroundings (brackets, quotes, etc.)
  #
  # - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  # - sd'   - [S]urround [D]elete [']quotes
  # - sr)'  - [S]urround [R]eplace [)] [']
  plugins.mini-surround.enable = true;

  # Paren, bracket etc pairs
  plugins.mini-pairs.enable = true;

  # Join and spread lists
  # - gS - toggle split
  plugins.mini-splitjoin.enable = true;

  # Starter screen
  plugins.mini-starter = {
    enable = true;
    settings = {
      items = [
        { __raw = "require('mini.starter').sections.recent_files(10, true)"; }
      ];
    };
  };

}
