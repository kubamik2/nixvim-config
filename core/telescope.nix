inputs: {
  # Fuzzy Finder (files, lsp, etc)
  plugins.telescope = {
    enable = true;
    extensions = {
      ui-select.enable = true;
      fzf-native.enable = true;
    };
    settings = {
      defaults = {
        mappings = {
          i = { "<C-d>" = "delete_buffer"; };
        };
      };
      pickers = {
        buffers = {
          show_all_buffers = true;
          sort_mru = true;
        };
      };
      extensions = {
        "ui-select" = {__raw = "{ require('telescope.themes').get_dropdown() }"; };
      };
    };
  };

  autoGroups = {
    telescope-lsp-attach = { clear = true; };
  };

  autoCmd = [
    # This runs on LSP attach per buffer (see main LSP attach function in 'neovim/nvim-lspconfig' config for more info,
    # it is better explained there). This allows easily switching between pickers if you prefer using something else!
    {
      event = [ "LspAttach" ];
      group = "telescope-lsp-attach";
      callback = { __raw = ''
        function(event)
          local builtin = require('telescope.builtin')
          local buf = event.buf

          -- Find references for the word under your cursor.
          vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })

          -- Jump to the implementation of the word under your cursor.
          -- Useful when your language has ways of declaring types without an actual implementation.
          vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })

          -- Jump to the definition of the word under your cursor.
          -- This is where a variable was first declared, or where a function is defined, etc.
          -- To jump back, press <C-t>.
          vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })

          -- Fuzzy find all the symbols in your current document.
          -- Symbols are things like variables, functions, types, etc.
          vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })

          -- Fuzzy find all the symbols in your current workspace.
          -- Similar to document symbols, except searches over your entire project.
          vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })

          -- Jump to the type of the word under your cursor.
          -- Useful when you're not sure what type a variable is and you want to see
          -- the definition of its *type*, not where it was *defined*.
          vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client.server_capabilities.inlayHintProvider then vim.lsp.inlay_hint.enable(true, { bufnr = event.buf }) end
        end
      ''; };
    }
  ];

  keymaps = [
    { mode = "n"; key = "<leader>sh"; action = { __raw = "require('telescope.builtin').help_tags"; }; options = { desc = "[S]earch [H]elp"; }; }
    { mode = "n"; key = "<leader>sk"; action = { __raw = "require('telescope.builtin').keymaps"; }; options = { desc = "[S]earch [K]eymaps"; }; }
    { mode = "n"; key = "<leader>sf"; action = { __raw = "require('telescope.builtin').find_files"; }; options = { desc = "[S]earch [F]iles"; }; }
    { mode = "n"; key = "<leader>ss"; action = { __raw = "require('telescope.builtin').builtin"; }; options = { desc = "[S]earch [S]elect Telescope"; }; }
    { mode = [ "n" "v" ]; key = "<leader>sw"; action = { __raw = "require('telescope.builtin').grep_string"; }; options = { desc = "[S]earch current [W]ord"; }; }
    { mode = "n"; key = "<leader>sg"; action = { __raw = "require('telescope.builtin').live_grep"; }; options = { desc = "[S]earch by [G]rep"; }; }
    { mode = "n"; key = "<leader>sd"; action = { __raw = "require('telescope.builtin').diagnostics"; }; options = { desc = "[S]earch [D]iagnostics"; }; }
    { mode = "n"; key = "<leader>sr"; action = { __raw = "require('telescope.builtin').resume"; }; options = { desc = "[S]earch [R]esume"; }; }
    { mode = "n"; key = "<leader>s."; action = { __raw = "require('telescope.builtin').oldfiles"; }; options = { desc = "[S]earch Recent Files (\".\" for repeat)"; }; }
    { mode = "n"; key = "<leader>sc"; action = { __raw = "require('telescope.builtin').commands"; }; options = { desc = "[S]earch [C]ommands"; }; }
    { mode = "n"; key = "<leader><leader>"; action = { __raw = "require('telescope.builtin').buffers"; }; options = { desc = "[ ] Find existing buffers"; }; }

    # Override default behavior and theme when searching
    {
      mode = "n";
      key = "<leader>/";
      action = { __raw = ''
        function()
          -- You can pass additional configuration to Telescope to change the theme, layout, etc.
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end
      ''; };
      options = { desc = "[/] Fuzzily search in current buffer"; };
    }

    # It's also possible to pass additional configuration options.
    #  See `:help telescope.builtin.live_grep()` for information about particular keys
    {
      mode = "n";
      key = "<leader>s/";
      action = { __raw = ''
        function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          }
        end
      ''; };
      options = { desc = "[S]earch [/] in Open Files"; };
    }

    # Shortcut for searching your Neovim configuration files
    {
      mode = "n";
      key = "<leader>sn";
      action = { __raw = ''function() require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' } end''; };
      options = { desc = "[S]earch [N]eovim files"; };
    }
  ];
}
