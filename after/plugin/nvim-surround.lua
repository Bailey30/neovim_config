--surr*ound_words             ysiw)           (surround_words)
--*make strings               ys$"            "make strings"
--[delete ar*ound me!]        ds]             delete around me!
--remove <b>HTML t*ags</b>    dst             remove HTML tags
--'change quot*es'            cs'"            "change quotes"
--<b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--delete(functi*on calls)     dsf             function calls
--char c = *x;                ysl'            char c = 'x';
-- hel*lo world                yss"            "hello world"
--some content                ySStp           <p>
--                                            some content
--                                            </p>
--some con*tent             ysiwta          some <a>content</a>}
--
--
--
--
--cst<div> - changes html tag to div
--dst - deletes tag
require("nvim-surround").setup({
	"-- Configuration here, or leave empty to use defaults",
})
