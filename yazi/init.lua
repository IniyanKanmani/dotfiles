th.git = th.git or {}
th.git.modified_sign = "M"
th.git.added_sign = "A"
th.git.untracked_sign = "?"
th.git.ignored_sign = "!"
th.git.deleted_sign = "D"
th.git.updated_sign = "M"

require("git"):setup()

require("full-border"):setup({ type = ui.Border.ROUNDED })

require("relative-motions"):setup({ show_numbers = "relative", show_motion = true })

require("duckdb"):setup({
	mode = "standard", -- Default: "summarized"
	cache_size = 1000, -- Default: 500
	row_id = true, -- Default: false
	minmax_column_width = 21, -- Default: 21
	column_fit_factor = 10.0, -- Default: 10.0
})
