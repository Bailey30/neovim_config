Vim�UnDo� ��!w�h ��l�]�%Ko��[(J��,���                                     g@]�    _�                             ����                                                                                                                                                                                                                                                                                                                                                  v   ~    g@N:     �                   o�               �               �   
                -- W�               �               �               �                 E  mode = 'cursor',  -- Line used to calculate context. Choices: 'curs�   	            �                   tri�               �               �                 I  multiline_threshold = 20, -- Maximum number of lines to show for a sing�               �                   line_numbers =�               �                   min_window_height = 0�               �                   max_lines =�               �                 7  enable = true, -- Enable this plugin (Can be enabled/�               �                   �               5��                       7                   Z       �       7                 Z               `       �                        �               `       �                                      `       �                     I   z              P       �       I                 �                     �                      `   �              `       �       e              E   :              P       �       E                 �              p       �    
                  `   �              `       �    
   f                 Z              P       �                         �                     �                        �              C       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v   ~    g@NA    �               ^    enable = true,          -- Enable this plugin (Can be enabled/disabled later via commands)   :    multiwindow = false,    -- Enable multiwindow support.   `    max_lines = 0,          -- How many lines the window should span. Values <= 0 mean no limit.   i    min_window_height = 0,  -- Minimum editor window height to enable context. Values <= 0 mean no limit.�      
         s    trim_scope = 'outer',   -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'   [    mode = 'cursor',        -- Line used to calculate context. Choices: 'cursor', 'topline'�               7    zindex = 20,   -- The Z-index of the context window�                  �                  "require'treesitter-context'.setup{   S  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)   5  multiwindow = false, -- Enable multiwindow support.   U  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.   f  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.     line_numbers = true,   S  multiline_threshold = 20, -- Maximum number of lines to show for a single context   o  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'   S  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'   Z  -- Separator between context and content. Should be a single character string, like '-'.   k  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.     separator = nil,   3  zindex = 20, -- The Z-index of the context window   T  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching   }5��                                 �      :      �                          :                     �                         �                     �                            l       p       �                      A       �             5�_�      	                    ����                                                                                                                                                                                                                                                                                                                                                  v   ~    g@N�    �                  �                  $require 'treesitter-context'.setup {   `    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)   <    multiwindow = false,      -- Enable multiwindow support.   b    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.   k    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.       line_numbers = true,   U    multiline_threshold = 20, -- Maximum number of lines to show for a single context   u    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'   ]    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'   \    -- Separator between context and content. Should be a single character string, like '-'.   m    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.       separator = nil,   9    zindex = 20,     -- The Z-index of the context window   V    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching   }5��                                 G      H      �                          H                     5�_�                 	          ����                                                                                                                                                                                                                                                                                                                                                  v   ~    g@R�    �                  �                  $require 'treesitter-context'.setup {   `    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)   <    multiwindow = false,      -- Enable multiwindow support.   b    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.   k    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.       line_numbers = true,   U    multiline_threshold = 20, -- Maximum number of lines to show for a single context   u    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'   ]    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'   \    -- Separator between context and content. Should be a single character string, like '-'.   m    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.       separator = nil,   9    zindex = 20,     -- The Z-index of the context window   V    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching   }5��                                 G      H      �                          H                     5�_�   	      
                  ����                                                                                                                                                                                                                                                                                                                                                             g@]�     �                 5  require("treesitter-context").go_to_context(vim.v.c�               �                  �               �               5��                          H                     �                      5   H              Z       �       5                 �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g@]�    �                  �                  $require 'treesitter-context'.setup {   `    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)   <    multiwindow = false,      -- Enable multiwindow support.   b    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.   k    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.       line_numbers = true,   U    multiline_threshold = 20, -- Maximum number of lines to show for a single context   u    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'   ]    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'   \    -- Separator between context and content. Should be a single character string, like '-'.   m    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.       separator = nil,   9    zindex = 20,     -- The Z-index of the context window   V    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching   }   $vim.keymap.set("n", "[c", function()   =    require("treesitter-context").go_to_context(vim.v.count1)   end, { silent = true })�                  �                  $require 'treesitter-context'.setup {   `    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)   <    multiwindow = false,      -- Enable multiwindow support.   b    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.   k    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.       line_numbers = true,   U    multiline_threshold = 20, -- Maximum number of lines to show for a single context   u    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'   ]    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'   \    -- Separator between context and content. Should be a single character string, like '-'.   m    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.       separator = nil,   9    zindex = 20,     -- The Z-index of the context window   V    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching   }   $vim.keymap.set("n", "[c", function()   ;  require("treesitter-context").go_to_context(vim.v.count1)   end, { silent = true })5��                                 �      �      �                          �                     �                                 �      �      �                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g@]�     �             5��                          H                     5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             g@]�    �                  �                  $require 'treesitter-context'.setup {   `    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)   <    multiwindow = false,      -- Enable multiwindow support.   b    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.   k    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.       line_numbers = true,   U    multiline_threshold = 20, -- Maximum number of lines to show for a single context   u    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'   ]    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'   \    -- Separator between context and content. Should be a single character string, like '-'.   m    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.       separator = nil,   9    zindex = 20,     -- The Z-index of the context window   V    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching   }       $vim.keymap.set("n", "[c", function()   =    require("treesitter-context").go_to_context(vim.v.count1)   end, { silent = true })�                  �                  $require 'treesitter-context'.setup {   `    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)   <    multiwindow = false,      -- Enable multiwindow support.   b    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.   k    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.       line_numbers = true,   U    multiline_threshold = 20, -- Maximum number of lines to show for a single context   u    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'   ]    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'   \    -- Separator between context and content. Should be a single character string, like '-'.   m    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.       separator = nil,   9    zindex = 20,     -- The Z-index of the context window   V    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching   }       $vim.keymap.set("n", "[c", function()   =    require("treesitter-context").go_to_context(vim.v.count1)   end, { silent = true })5��                                 �      �      �                          �                     �                                 �      �      �                          �                     5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             g@]�     �                 �                     �              �                $vim.keymap.set("n", "[c", function()   5  require("treesitter-context").go_to_context(vim.v.c�              �                ;  require("treesitter-context").go_to_context(vim.v.count1)   end, { silent = true }):window�                end, { silent = true }):windo5��                          H                     �                          H                     �                      5   I              Z       �       5                 �                     �                         �                     �                        �                    �                        �                    �                         �                     5�_�                          ����                                                                                                                                                                                                                                                                                                                                                  v   ~    g@N~     �                   separator = ,5��                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v   ~    g@N~     �                   separator = "",5��                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v   ~    g@N     �                   separator = "-",5��                         �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v   ~    g@N�    �                 $require 'treesitter-context'.setup {   `    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)   <    multiwindow = false,      -- Enable multiwindow support.   b    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.   k    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.       line_numbers = true,   U    multiline_threshold = 20, -- Maximum number of lines to show for a single context   u    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'   ]    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'   \    -- Separator between context and content. Should be a single character string, like '-'.   m    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.       separator = "-",   9    zindex = 20,     -- The Z-index of the context window   V    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching   }    �              5��                                 G      H      �                          H                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v   ~    g@N<     �                
:window:so5��                         �                    �                        �                    �                     	   �             	       5��