--  +======================\/========\/========\/==========\/\/======\/==========================+
--  ########::'########:'########:'########:::'#######::'########:'########:'########::'##::::'##:
--  ##.... ##: ##.....::... ##..:: ##.... ##:'##.... ##:... ##..:: ##.....:: ##.... ##: ###::'###:
--  ##:::: ##: ##:::::::::: ##:::: ##:::: ##: ##:::: ##:::: ##:::: ##::::::: ##:::: ##: ####'####:
--  ########:: ######:::::: ##:::: ########:: ##:::: ##:::: ##:::: ######::: ########:: ## ### ##:
--  ##.. ##::: ##...::::::: ##:::: ##.. ##::: ##:::: ##:::: ##:::: ##...:::: ##.. ##::: ##. #: ##:
--  ##::. ##:: ##:::::::::: ##:::: ##::. ##:: ##:::: ##:::: ##:::: ##::::::: ##::. ##:: ##:.:: ##:
--  ##:::. ##: ########:::: ##:::: ##:::. ##:. #######::::: ##:::: ########: ##:::. ##: ##:::: ##:
-- ..:::::..::........:::::..:::::..:::::..:::.......::::::..:::::........::..:::::..::..:::::..::
--  +==================\/======\/=======\/========\/\/======\/==LukeFilewalker!==================+

local M = {}

M.palettes = {
	muted = {
		base00 = "#120f09", -- background (mainbg)
		base01 = "#1e1812", -- lighter background (statusline, folds)
		base02 = "#35291d", -- selection background (selection)
		base03 = "#66553f", -- comments/invisible text (comment)
		base04 = "#a28662", -- secondary text (builtin)
		base05 = "#c0a179", -- default text (mainfg)
		base06 = "#d6b891", -- brighter text (type)
		base07 = "#292016", -- brightest text (functionname)
		base08 = "#887254", -- errors/warnings (warning)
		base09 = "#d6b891", -- numbers/constants (constant)
		base0A = "#c0a179", -- keywords/identifiers (keyword)
		base0B = "#927a60", -- strings/success (string)
		base0C = "#a28662", -- specials/operators (variable)
		base0D = "#d6b891", -- functions/classes (functionname)
		base0E = "#a28662", -- types/storage (keyword)
		base0F = "#887254", -- deprecated/other (warning2)
	},

	original = {
		base00 = "#000000", -- background (mainbg)
		base01 = "#1a0f00", -- lighter background (statusline, folds)
		base02 = "#332000", -- selection background (selection)
		base03 = "#664400", -- comments/invisible text (comment)
		base04 = "#996600", -- secondary text (builtin)
		base05 = "#ffb000", -- default text (mainfg)
		base06 = "#ffc040", -- brighter text (type)
		base07 = "#ffd060", -- brightest text (functionname)
		base08 = "#ffb000", -- errors/warnings (warning)
		base09 = "#ffb000", -- numbers/constants (constant)
		base0A = "#ffb000", -- keywords/identifiers (keyword)
		base0B = "#ffb000", -- strings/success (string)
		base0C = "#ffb000", -- specials/operators (variable)
		base0D = "#ffb000", -- functions/classes (functionname)
		base0E = "#ffb000", -- types/storage (keyword)
		base0F = "#ffb000", -- deprecated/other (warning2)
	},

	base = {
		base00 = "#120f09", -- background (mainbg)
		base01 = "#1e1812", -- lighter background (statusline, folds)
		base02 = "#2a2018", -- selection background (selection)
		base03 = "#5a4632", -- comments/invisible text (comment)
		base04 = "#8a704e", -- secondary text (builtin)
		base05 = "#c09048", -- default text (mainfg)
		base06 = "#d8a860", -- brighter text (type)
		base07 = "#ffd060", -- brightest text (functionname)
		base08 = "#ffb000", -- errors/warnings (warning)
		base09 = "#d6a040", -- numbers/constants (constant)
		base0A = "#e0b060", -- keywords/identifiers (keyword)
		base0B = "#c09048", -- strings/success (string)
		base0C = "#a67840", -- specials/operators (variable)
		base0D = "#d8a860", -- functions/classes (functionname)
		base0E = "#e0b060", -- types/storage (keyword)
		base0F = "#8a704e", -- deprecated/other (warning2)
	},
}

local function apply_palette(palette)
	require("mini.base16").setup({
		palette = palette,
		use_cterm = true,
		plugins = {
			default = false,
			["echasnovski/mini.nvim"] = true,
		},
	})
end

M.setup = function(opts)
	opts = opts or {}
	local variant = opts.variant or "base"
	local palette = M.palettes[variant]

	if not palette then
		vim.notify("RetroTerm: unknown variant '" .. variant .. "'", vim.log.levels.ERROR)
		return
	end

	apply_palette(palette)

	-- Set blinking cursor
	if opts["blinking_cursor"] ~= nil or opts.blinking_cursor then
		vim.opt.guicursor = {
			"n-v-c:block-Cursor/lCursor-blinkon100-blinkoff100",
			"i-ci-ve:ver25-Cursor/lCursor-blinkon100-blinkoff100",
			"r-cr:hor20-Cursor/lCursor-blinkon100-blinkoff100",
			"o:hor50-Cursor/lCursor-blinkon100-blinkoff100",
		}
	end

	vim.api.nvim_create_user_command("RetroTermSwitch", function(args)
		local name = args.args
		if not M.palettes[name] then
			vim.notify("RetroTerm: unknown variant '" .. name .. "'", vim.log.levels.ERROR)
			return
		end
		apply_palette(M.palettes[name])
		vim.notify("RetroTerm: switched to '" .. name .. "'", vim.log.levels.INFO)
	end, {
		nargs = 1,
		complete = function()
			return vim.tbl_keys(M.palettes)
		end,
	})
end

return M
