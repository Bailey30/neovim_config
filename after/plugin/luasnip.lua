local ls = require("luasnip")
local cmp = require("cmp")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

-- keymaps
vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

-- snippets
ls.add_snippets("all", {
    s("ternary", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    }),
    s("clg", {
        t("console.log("), i(1), t(")")
    }),
    -- s({ trig = "try", name = "try/catch", dscr = "try{}catch(){}" }, {
    --     t({ "", "try{" }),
    --     i(1),
    --     t({ "", "}" }),
    --     t({ "", "catch(err:any){" }),
    --     i(2),
    --     t({ "", "}" })
    -- }),
    s({ trig = "try", name = "try/catch", description = "try{} catch(err:any){}}" }, fmt([[
    try {
        <>
    } catch (err:any) {
       console.log(<>, err)
    }
    ]], {
        i(1),
        i(2)
    }, {
        delimiters = "<>"
    }
    )),
    s({ trig = "sds", name = "css module classname" }, {
        t("`${"), i(1), t("}`")
    }),
    s({ trig = "brr", name = "border 1px solid red" }, {
        t("border: 1px solid red;")
    }),
    s({ trig = "jd", name = "JsDoc" }, {
        t("/** * "), i(1), t(" **/")
    })
})

--
-- configure completion plugin
cmp.setup({
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end
    },
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" }

    }
})
