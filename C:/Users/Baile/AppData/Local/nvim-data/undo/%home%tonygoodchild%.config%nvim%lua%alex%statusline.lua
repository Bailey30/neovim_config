Vim�UnDo� R+b���L-��T��2U�]cS�3�x�+:�   p   5    vim.fn.shellescape(file_path) .. ' 2> /dev/null')   5                           g@��    _�                     &        ����                                                                                                                                                                                                                                                                                                                            =          &           v        g@��     �   I   O   k       �   J   K   k    �   F   K   h       �   G   H   h    �   C   H   e          l�   D   E   e    �   >   E   `                  status = statu�   ?   @   `    �   <   @   ^      $        local status_char = file_sta�   =   >   ^    �   :   >   \      Z    local file_status = vim.fn.systemlist('git status --porcelain -- ' .. vim.fn.shellesca�   ;   <   \    �   9   <   [      &    -- Check the status of the current�   :   ;   [    �   5   ;   W      	        s�   6   7   W    �   3   7   U      T    local is_tracked = vim.fn.systemlist('git ls-files --error-unmatch ' .. vim.fn.s�   4   5   U    �   2   5   T          -- Check if the file is tra�   3   4   T    �   -   4   O            �   .   /   O    �   +   /   M      0    local file_path = vim.fn.expand('%:.') -- Ge�   ,   -   M    �   %   -   G       �   &   '   G    �   &   '   G    �   %   '   ^      local function git_status()   0    local git_dir = vim.fn.finddir('.git', '.;')       if git_dir == '' then   )        return '' -- Not a Git repository       end           local status = ''   K    local uncommitted_changes = vim.fn.systemlist('git status --porcelain')   $    if #uncommitted_changes > 0 then           status = status .. '*'       end       g    local upstream = vim.fn.system('git rev-parse --abbrev-ref --symbolic-full-name @{u} 2> /dev/null')       if upstream == '' then           return status       end       N    local unpushed_commits = vim.fn.systemlist('git log --oneline @{u}..HEAD')   !    if #unpushed_commits > 0 then            status = status .. '↑'       end           return status   end5��    %                     B      �              �    %                   
   B              
       �    %   
              0   L              �       �    +   0                               P       �    -                    \              p       �    2                 T   �              `       �    3   T              	   ,              P       �    5   	              &   |              p       �    9   &              Z   �              `       �    :   Z              $   L              P       �    <   $                 �              p       �    >                                  `       �    C                    l              �       �    F                     ,	              �       �    I                     �	              *       5�_�                     E       ����                                                                                                                                                                                                                                                                                                                            &          &           v        g@��    �   4   6   p      5    vim.fn.shellescape(file_path) .. ' 2> /dev/null')�   p               �               o   local function branch_name()   Z    -- local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")   D    local fugitiveBranch = vim.api.nvim_eval('FugitiveStatusline()')   :    local branch = fugitiveBranch:match("%[Git%((.-)%)%]")   #    if branch and branch ~= "" then           return " on " .. branch       else           return ""       end   end       local function file_name()   %    local root_path = vim.fn.getcwd()   .    local root_dir = root_path:match("[^/]+$")   *    local home_path = vim.fn.expand("%:~")   /    local overlap, _ = home_path:find(root_dir)       if home_path == "" then   2        return root_path:gsub("/Users/[^/]+", "~")       elseif overlap then   %        return home_path:sub(overlap)       else           return home_path       end   end       local function progress()   !    if vim.fn.line(".") == 1 then           return "top"   4    elseif vim.fn.line(".") == vim.fn.line("$") then           return "bot"       else   ;        local p = vim.fn.line(".") / vim.fn.line("$") * 100   9        p = p % 1 >= .5 and math.ceil(p) or math.floor(p)   /        return string.format("%02d", p) .. "%%"       end   end       local function git_status()   0    local git_dir = vim.fn.finddir('.git', '.;')       if git_dir == '' then   )        return '' -- Not a Git repository       end       ]    local file_path = vim.fn.expand('%:.') -- Get the file path relative to current directory       if file_path == '' then   6        return '' -- No file path (e.g., empty buffer)       end           local status = ''       *    -- Check if the file is tracked by Git   }    local is_tracked = vim.fn.systemlist('git ls-files --error-unmatch ' .. vim.fn.shellescape(file_path) .. ' 2> /dev/null')       if #is_tracked == 0 then           status = status .. '?'   *        return status -- File is untracked       end       +    -- Check the status of the current file   h    local file_status = vim.fn.systemlist('git status --porcelain -- ' .. vim.fn.shellescape(file_path))       if #file_status > 0 then   4        local status_char = file_status[1]:sub(1, 2)   D        if status_char:match('%sM') or status_char:match('M%s') then   "            status = status .. '*'           end       end       <    -- Check for unpushed commits involving the current file   g    local upstream = vim.fn.system('git rev-parse --abbrev-ref --symbolic-full-name @{u} 2> /dev/null')       if upstream ~= '' then   @        -- Check if the current file is part of unpushed commits   w        local unpushed_commits = vim.fn.systemlist('git log --oneline @{u}..HEAD -- ' .. vim.fn.shellescape(file_path))   %        if #unpushed_commits > 0 then   $            status = status .. '↑'           end       end           return status   end       Hvim.api.nvim_create_autocmd({ "FileType", "BufEnter", "FocusGained" }, {       callback = function()   )        vim.b.branch_name = branch_name()   %        vim.b.file_name = file_name()   '        vim.b.git_status = git_status()       end   })       function Status_Line()   :    if not pcall(require, "lsp_signature") then return end   =    local lsp_sig = require("lsp_signature").status_line(100)   *    -- Ensure vim.b.git_status is a string   -    local git_status = vim.b.git_status or ''           return " "           .. "%<"           .. vim.b.file_name           .. vim.b.branch_name           .. vim.b.git_status           .. " "           .. "%h"           .. "%m"           -- .. lsp_sig.label           -- .. lsp_sig.hint           .. "%="           .. "%y"           .. " "           .. progress()           .. " "   end       /vim.opt.statusline = "%{%v:lua.Status_Line()%}"5��            n   /   p               L      j      �    p                      j                     �    4                     A                     5��