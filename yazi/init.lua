require("git"):setup()

THEME.git = THEME.git or {}
THEME.git.modified_sign = "M"
THEME.git.added_sign = "A"
THEME.git.untracked_sign = "?"
THEME.git.ignored_sign = "!"
THEME.git.deleted_sign = "D"
THEME.git.updated_sign = "M"

require("full-border"):setup()

-- require("relative-motions"):setup({ show_numbers = "relative", show_motion = true })
