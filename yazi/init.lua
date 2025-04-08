require("git"):setup()

th.git = th.git or {}
th.git.modified_sign = "M"
th.git.added_sign = "A"
th.git.untracked_sign = "?"
th.git.ignored_sign = "!"
th.git.deleted_sign = "D"
th.git.updated_sign = "M"

require("full-border"):setup()

require("relative-motions"):setup({ show_numbers = "relative", show_motion = true })
