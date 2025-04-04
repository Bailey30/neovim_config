local Cursor = {}

Cursor.config = {}

Cursor.state = {
	guicursor = nil,
	position = {
		row = nil,
		col = nil,
	},
}

function Cursor:setup(config)
	self.config = vim.tbl_deep_extend("keep", config or {}, self.config)
	self.config.namespace = vim.api.nvim_create_namespace("preserve_cursor_position")
end

function Cursor:hide(state)
	self:preserve_position(state)

	-- Save current cursor setting
	if vim.o.guicursor then
		self.state.guicursor = vim.o.guicursor
	end
	-- Set cursor invisible
	vim.o.guicursor = "a:CursorHidden"
end

function Cursor:preserve_position(state)
	local pos = vim.fn.getpos(".")
	local row = pos[2]
	local col = pos[3]

	self.state.position = {
		row = row,
		col = col,
	}

	self.state.working_buf = state.working_buf

	-- vim.notify(vim.inspect(self.config))
	-- vim.notify(vim.inspect(self.state))

	vim.api.nvim_buf_set_extmark(state.working_buf, self.config.namespace, row - 1, col - 1, {
		virt_text = { { " ", self.config.highlights.preserve_position } },
		virt_text_pos = "overlay",
		hl_mode = "blend",
	})
end

function Cursor:clear()
	self.state.position = {
		row = nil,
		col = nil,
	}

	vim.api.nvim_buf_clear_namespace(self.state.working_buf, self.config.namespace, 0, -1)
end

function Cursor:restore()
	self:clear()
	if self.state.guicursor == "" then
		print("guicursor was ''")
		vim.o.guicursor = "a:"
		self.state.guicursor = nil -- Prevent second block from executing
		vim.cmd("redraw")
		return
	end

	-- Restore original cursor setting
	if self.state.guicursor then
		vim.o.guicursor = self.state.guicursor
		self.state.guicursor = nil
	end
end

return Cursor
