Vim�UnDo� e���R����i��L�翉�S�:��a�M�   +       ,                           g@\�    _�                       "    ����                                                                                                                                                                                                                                                                                                                                                             g@W�     �         +      5        javascript = { { 'prettierd', "prettier" } },5��       "                  �                      5�_�                      "    ����                                                                                                                                                                                                                                                                                                                                                             g@W�    �   +               �               +   require("conform").setup({       formatters_by_ft = {               lua = { "stylua" },   5        typescript = { { 'prettierd', "prettier" } },   :        typescriptreact = { { 'prettierd', "prettier" } },   4        javascript = { { 'prettier', "prettier" } },   :        javascriptreact = { { 'prettierd', "prettier" } },   /        json = { { 'prettierd', "prettier" } },   /        html = { { 'prettierd', "prettier" } },   .        css = { { 'prettierd', "prettier" } },            ["*"] = { "codespell" },       },       formatters = {           prettier = {   *            -- command = "./prettier.json"               -- printWidth = 200   2            -- prepend_args = { "--single-quote" }   	        }       },       format_on_save = {   K        -- I recommend these options. See :help conform.format for details.           lsp_fallback = true,           timeout_ms = 500,       },       })       --- require("conform").formatters.prettier = {   ---     prepend_args = { "--print-width 400" }   -- }       9vim.api.nvim_create_user_command("Format", function(args)       local range = nil       if args.count ~= -1 then   [        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]           range = {   &            start = { args.line1, 0 },   5            ["end"] = { args.line2, end_line:len() },   	        }       end   S    require("conform").format({ async = true, lsp_fallback = true, range = range })   end, { range = true })5��            *      +               \      ]      �    +                      ]                     5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                             g@W�     �         +      *            -- command = "./prettier.json"5��                               +       (       5�_�                      &    ����                                                                                                                                                                                                                                                                                                                                                             g@W�    �   +               �               +   require("conform").setup({       formatters_by_ft = {               lua = { "stylua" },   5        typescript = { { 'prettierd', "prettier" } },   :        typescriptreact = { { 'prettierd', "prettier" } },   4        javascript = { { 'prettier', "prettier" } },   :        javascriptreact = { { 'prettierd', "prettier" } },   /        json = { { 'prettierd', "prettier" } },   /        html = { { 'prettierd', "prettier" } },   .        css = { { 'prettierd', "prettier" } },            ["*"] = { "codespell" },       },       formatters = {           prettier = {   '            command = "./prettier.json"               -- printWidth = 200   2            -- prepend_args = { "--single-quote" }   	        }       },       format_on_save = {   K        -- I recommend these options. See :help conform.format for details.           lsp_fallback = true,           timeout_ms = 500,       },       })       --- require("conform").formatters.prettier = {   ---     prepend_args = { "--print-width 400" }   -- }       9vim.api.nvim_create_user_command("Format", function(args)       local range = nil       if args.count ~= -1 then   [        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]           range = {   &            start = { args.line1, 0 },   5            ["end"] = { args.line2, end_line:len() },   	        }       end   S    require("conform").format({ async = true, lsp_fallback = true, range = range })   end, { range = true })5��            *      +               Y      Z      �    +                      Z                     5�_�      	                 "    ����                                                                                                                                                                                                                                                                                                                                                             g@X�     �         +      5        typescript = { { 'prettierd', "prettier" } },5��       "                  s                      5�_�                 	      '    ����                                                                                                                                                                                                                                                                                                                                                             g@X�     �         +      :        typescriptreact = { { 'prettierd', "prettier" } },5��       '                  �                      5�_�   	                       ����                                                                                                                                                                                                                                                                                                                                                             g@[     �         +                  -- printWidth = 2005��                        K                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g@\�    �   +               �               +   require("conform").setup({       formatters_by_ft = {               lua = { "stylua" },   4        typescript = { { 'prettier', "prettier" } },   9        typescriptreact = { { 'prettier', "prettier" } },   4        javascript = { { 'prettier', "prettier" } },   :        javascriptreact = { { 'prettierd', "prettier" } },   /        json = { { 'prettierd', "prettier" } },   /        html = { { 'prettierd', "prettier" } },   .        css = { { 'prettierd', "prettier" } },            ["*"] = { "codespell" },       },       formatters = {           prettier = {   '            command = "./prettier.json"               -- printiidth = 200   2            -- prepend_args = { "--single-quote" }   	        }       },       format_on_save = {   K        -- I recommend these options. See :help conform.format for details.           lsp_fallback = true,           timeout_ms = 500,       },       })       --- require("conform").formatters.prettier = {   ---     prepend_args = { "--print-width 400" }   -- }       9vim.api.nvim_create_user_command("Format", function(args)       local range = nil       if args.count ~= -1 then   [        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]           range = {   &            start = { args.line1, 0 },   5            ["end"] = { args.line2, end_line:len() },   	        }       end   S    require("conform").format({ async = true, lsp_fallback = true, range = range })   end, { range = true })�   +               �               +   require("conform").setup({       formatters_by_ft = {               lua = { "stylua" },   4        typescript = { { 'prettier', "prettier" } },   9        typescriptreact = { { 'prettier', "prettier" } },   4        javascript = { { 'prettier', "prettier" } },   :        javascriptreact = { { 'prettierd', "prettier" } },   /        json = { { 'prettierd', "prettier" } },   /        html = { { 'prettierd', "prettier" } },   .        css = { { 'prettierd', "prettier" } },            ["*"] = { "codespell" },       },       formatters = {           prettier = {   '            command = "./prettier.json"               -- printiidth = 200   2            -- prepend_args = { "--single-quote" }   	        }       },       format_on_save = {   K        -- I recommend these options. See :help conform.format for details.           lsp_fallback = true,           timeout_ms = 500,       },       })       --- require("conform").formatters.prettier = {   ---     prepend_args = { "--print-width 400" }   -- }       9vim.api.nvim_create_user_command("Format", function(args)       local range = nil       if args.count ~= -1 then   [        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]           range = {   &            start = { args.line1, 0 },   5            ["end"] = { args.line2, end_line:len() },   	        }       end   S    require("conform").format({ async = true, lsp_fallback = true, range = range })   end, { range = true })�   +               �               +   require("conform").setup({       formatters_by_ft = {               lua = { "stylua" },   4        typescript = { { 'prettier', "prettier" } },   9        typescriptreact = { { 'prettier', "prettier" } },   4        javascript = { { 'prettier', "prettier" } },   :        javascriptreact = { { 'prettierd', "prettier" } },   /        json = { { 'prettierd', "prettier" } },   /        html = { { 'prettierd', "prettier" } },   .        css = { { 'prettierd', "prettier" } },            ["*"] = { "codespell" },       },       formatters = {           prettier = {   '            command = "./prettier.json"               -- printiidth = 200   2            -- prepend_args = { "--single-quote" }   	        }       },       format_on_save = {   K        -- I recommend these options. See :help conform.format for details.           lsp_fallback = true,           timeout_ms = 500,       },       })       --- require("conform").formatters.prettier = {   ---     prepend_args = { "--print-width 400" }   -- }       9vim.api.nvim_create_user_command("Format", function(args)       local range = nil       if args.count ~= -1 then   [        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]           range = {   &            start = { args.line1, 0 },   5            ["end"] = { args.line2, end_line:len() },   	        }       end   S    require("conform").format({ async = true, lsp_fallback = true, range = range })   end, { range = true })�   +               �               +   require("conform").setup({       formatters_by_ft = {               lua = { "stylua" },   4        typescript = { { 'prettier', "prettier" } },   9        typescriptreact = { { 'prettier', "prettier" } },   4        javascript = { { 'prettier', "prettier" } },   :        javascriptreact = { { 'prettierd', "prettier" } },   /        json = { { 'prettierd', "prettier" } },   /        html = { { 'prettierd', "prettier" } },   .        css = { { 'prettierd', "prettier" } },            ["*"] = { "codespell" },       },       formatters = {           prettier = {   '            command = "./prettier.json"               -- printiidth = 200   2            -- prepend_args = { "--single-quote" }   	        }       },       format_on_save = {   K        -- I recommend these options. See :help conform.format for details.           lsp_fallback = true,           timeout_ms = 500,       },       })       --- require("conform").formatters.prettier = {   ---     prepend_args = { "--print-width 400" }   -- }       9vim.api.nvim_create_user_command("Format", function(args)       local range = nil       if args.count ~= -1 then   [        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]           range = {   &            start = { args.line1, 0 },   5            ["end"] = { args.line2, end_line:len() },   	        }       end   S    require("conform").format({ async = true, lsp_fallback = true, range = range })   end, { range = true })�   +               �               +   require("conform").setup({       formatters_by_ft = {               lua = { "stylua" },   4        typescript = { { 'prettier', "prettier" } },   9        typescriptreact = { { 'prettier', "prettier" } },   4        javascript = { { 'prettier', "prettier" } },   :        javascriptreact = { { 'prettierd', "prettier" } },   /        json = { { 'prettierd', "prettier" } },   /        html = { { 'prettierd', "prettier" } },   .        css = { { 'prettierd', "prettier" } },            ["*"] = { "codespell" },       },       formatters = {           prettier = {   '            command = "./prettier.json"               -- printiidth = 200   2            -- prepend_args = { "--single-quote" }   	        }       },       format_on_save = {   K        -- I recommend these options. See :help conform.format for details.           lsp_fallback = true,           timeout_ms = 500,       },       })       --- require("conform").formatters.prettier = {   ---     prepend_args = { "--print-width 400" }   -- }       9vim.api.nvim_create_user_command("Format", function(args)       local range = nil       if args.count ~= -1 then   [        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]           range = {   &            start = { args.line1, 0 },   5            ["end"] = { args.line2, end_line:len() },   	        }       end   S    require("conform").format({ async = true, lsp_fallback = true, range = range })   end, { range = true })5��            *      +               W      X      �    +                      X                     �            *      +               W      X      �    +                      X                     �            *      +               W      X      �    +                      X                     �            *      +               W      X      �    +                      X                     �            *      +               W      X      �    +                      X                     5�_�   	       
            '    ����                                                                                                                                                                                                                                                                                                                                                             g@X�    �       ,       ,   require("conform").setup({       formatters_by_ft = {               lua = { "stylua" },   4        typescript = { { 'prettier', "prettier" } },   9        typescriptreact = { { 'prettier', "prettier" } },   4        javascript = { { 'prettier', "prettier" } },   :        javascriptreact = { { 'prettierd', "prettier" } },   /        json = { { 'prettierd', "prettier" } },   /        html = { { 'prettierd', "prettier" } },   .        css = { { 'prettierd', "prettier" } },            ["*"] = { "codespell" },       },       formatters = {           prettier = {   '            command = "./prettier.json"               -- printWidth = 200   2            -- prepend_args = { "--single-quote" }   	        }       },       format_on_save = {   K        -- I recommend these options. See :help conform.format for details.           lsp_fallback = true,           timeout_ms = 500,       },       })       --- require("conform").formatters.prettier = {   ---     prepend_args = { "--print-width 400" }   -- }       9vim.api.nvim_create_user_command("Format", function(args)       local range = nil       if args.count ~= -1 then   [        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]           range = {   &            start = { args.line1, 0 },   5            ["end"] = { args.line2, end_line:len() },   	        }       end   S    require("conform").format({ async = true, lsp_fallback = true, range = range })   end, { range = true })    �   +   -        5��            *      +               W      X      �    +                      X                     5�_�   	              
      '    ����                                                                                                                                                                                                                                                                                                                                                             g@X�     �         +      -        typescriptreact = { { 'prettier:width5��       '                 �                     �       (                 �                     �       (                 �                     5�_�                       &    ����                                                                                                                                                                                                                                                                                                                                                             g@W�     �         +      *            command = "./prettier.json:wid5��       &                 7                    �       '                 8                    �       '                 8                    �       +                  <                     �       *                  ;                     5�_�                       "    ����                                                                                                                                                                                                                                                                                                                                                             g@W�     �         +      "        javascript = { { 'prettier5��       "                 �                     �       "                  �                      5�_�                        #    ����                                                                                                                                                                                                                                                                                                                                                             g@W�     �         +      4        javascript = { { 'prettierd, "prettier" } },5��       #                  �                      5��