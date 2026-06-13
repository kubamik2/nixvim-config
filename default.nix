inputs: {
  imports = [
    ./custom/default.nix
    ./core/default.nix
  ];

  globals = {
    # Set <space> as the leader key
    # See `:help mapleader`
    #  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
    mapleader = " ";
    maplocalleader = " ";

    # Set to true if you have a Nerd Font installed and selected in the terminal
    have_nerd_font = true;

    # colorscheme style
    edge_style = "aura";
  };

  # [[ Setting options ]]
  # See `:help vim.o`
  # NOTE: You can change these options as you wish!
  #  For more options, you can see `:help option-list`
  opts = {
    # Make line numbers default
    number = true;
    # You can also add relative line numbers, to help with jumping.
    #  Experiment for yourself to see if you like it!
    relativenumber = true;

    # Enable mouse mode, can be useful for resizing splits for example!
    mouse = "a";

    # Don't show the mode, since it's already in the status line
    showmode = false;

    # Enable break indent
    breakindent = true;

    # Enable undo/redo changes even after closing and reopening a file
    undofile = true;

    # Case-insensitive searching UNLESS \C or one or more capital letters in the search term
    ignorecase = true;
    smartcase = true;

    # Keep signcolumn on by default
    signcolumn = "yes";

    # Decrease update time
    updatetime = 250;

    # Decrease mapped sequence wait time
    timeoutlen = 300;

    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;

    # Sets how neovim will display certain whitespace characters in the editor.
    #  See `:help 'list'`
    #  and `:help 'listchars'`
    #
    #  Notice listchars is set using `vim.opt` instead of `vim.o`.
    #  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
    #   See `:help lua-options`
    #   and `:help lua-guide-options`
    list = true;
    listchars = { tab = "» "; trail = "·"; nbsp = "␣"; };

    # Preview substitutions live, as you type!
    inccommand = "split";

    # Show which line your cursor is on
    cursorline = true;

    # Minimal number of screen lines to keep above and below the cursor.
    scrolloff = 10;

    # if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
    # instead raise a dialog asking if you wish to save the current file(s)
    # See `:help 'confirm'`
    confirm = true;

    # disable line wrap
    wrap = false;

    # rounded window border
    winborder = "rounded";

    # indenting
    shiftwidth = 4;
    tabstop = 4;
    expandtab = true;
  };

  # Sync clipboard between OS and Neovim.
  #  Schedule the setting after `UiEnter` because it can increase startup-time.
  #  Remove this option if you want your OS clipboard to remain independent.
  #  See `:help 'clipboard'`
  clipboard.register = "unnamedplus";

  # [[ Basic Keymaps ]]
  #  See `:help vim.keymap.set()`
  keymaps = [
    # Clear highlights on search when pressing <Esc> in normal mode
    #  See `:help hlsearch`
    { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<cr>"; }

    # Diagnostic Keymap
    { mode = "n"; key = "<leader>q"; action = { __raw = "vim.diagnostic.setloclist"; }; options = { desc = "Open diagnostic [Q]uickfix list"; }; }

    # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
    # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
    # is not what someone will guess without a bit more experience.
    #
    # NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
    # or just use <C-\><C-n> to exit terminal mode
    { mode = "t"; key = "<Esc><Esc>"; action = "<C-\\><C-n>"; options = { desc = "Exit terminal mode"; }; }
    
    # Keybinds to make split navigation easier.
    #  Use CTRL+<hjkl> to switch between windows
    #
    #  See `:help wincmd` for a list of all window commands
    { mode = "n"; key = "<C-h>"; action = "<C-w><C-h>"; options = { desc = "Move focus to the left window"; }; }
    { mode = "n"; key = "<C-l>"; action = "<C-w><C-l>"; options = { desc = "Move focus to the right window"; }; }
    { mode = "n"; key = "<C-j>"; action = "<C-w><C-j>"; options = { desc = "Move focus to the lower window"; }; }
    { mode = "n"; key = "<C-k>"; action = "<C-w><C-k>"; options = { desc = "Move focus to the upper window"; }; }

    # Save file
    { mode = "n"; key = "<C-s>"; action = ":w<CR>"; options = { desc = "Save"; }; }

    # Toggle comment
    { mode = "n"; key = "<C-_>"; action = "gcc"; options = { silent = true; desc = "Toggle comment"; remap = true; }; }
    { mode = "v"; key = "<C-_>"; action = "gc"; options = { silent = true; desc = "Toggle comment"; remap = true; }; }
    { mode = "n"; key = "<C-/>"; action = "gcc"; options = { silent = true; desc = "Toggle comment"; remap = true; }; }
    { mode = "v"; key = "<C-/>"; action = "gc"; options = { silent = true; desc = "Toggle comment"; remap = true; }; }

    # Show diagnostics under the cursor
    { mode = "n"; key = "gl"; action = { __raw = "vim.diagnostic.open_float"; }; options = { desc = "Show diagnostics under the cursor"; }; }

    # Format buffer
    { mode = "n"; key = "<leader>f"; action = { __raw = "vim.lsp.buf.format"; }; options = { desc = "[F]ormat buffer"; }; }
  ];

  # Diagnostic Config
  # See :help vim.diagnostic.Opts
  diagnostic.settings = {
    update_in_insert = false;
    severity_sort = true;
    float = { border = "rounded"; source = "if_many"; };
    underline = { severity = { min = { __raw = "vim.diagnostic.severity.WARN"; }; }; };
  
    # Can switch between these as you prefer
    virtual_text = true; # Text shows up at the end of the line
    virtual_lines = false; # Text shows up underneath the line, with virtual lines
  
    # Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = { float = true; };
  };

  # [[ Autocommands ]]
  #  See `:help lua-guide-autocommands`

  autoGroups = {
    kickstart-highlight-yank = { clear = true; };
  };

  autoCmd = [
    # Highlight when yanking (copying) text
    #  Try it with `yap` in normal mode
    #  See `:help vim.hl.on_yank()`
    {
      event = [ "TextYankPost" ];
      group = "kickstart-highlight-yank";
      callback = { __raw = "function() vim.hl.on_yank() end"; };
    }
  ];

  colorschemes.gruvbox-material = {
    enable = true;
    settings = {
      float_style = "blend";
    };
  };

  # Better icons
  plugins.web-devicons.enable = true;
}
