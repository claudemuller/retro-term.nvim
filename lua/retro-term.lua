local M = {}

M.palettes = {
	muted = {
		base00 = "#120f09",
		base01 = "#1e1812",
		base02 = "#35291d",
		base03 = "#66553f",
		base04 = "#a28662",
		base05 = "#c0a179",
		base06 = "#d6b891",
		base07 = "#292016",
		base08 = "#887254",
		base09 = "#d6b891",
		base0A = "#c0a179",
		base0B = "#927a60",
		base0C = "#a28662",
		base0D = "#d6b891",
		base0E = "#a28662",
		base0F = "#887254",
	},
	original = {
		base00 = "#000000",
		base01 = "#1a0f00",
		base02 = "#332000",
		base03 = "#664400",
		base04 = "#996600",
		base05 = "#ffb000",
		base06 = "#ffc040",
		base07 = "#ffd060",
		base08 = "#ffb000",
		base09 = "#ffb000",
		base0A = "#ffb000",
		base0B = "#ffb000",
		base0C = "#ffb000",
		base0D = "#ffb000",
		base0E = "#ffb000",
		base0F = "#ffb000",
	},
	base = {
		base00 = "#120f09",
		base01 = "#1e1812",
		base02 = "#2a2018",
		base03 = "#5a4632",
		base04 = "#8a704e",
		base05 = "#c09048",
		base06 = "#d8a860",
		base07 = "#ffd060",
		base08 = "#ffb000",
		base09 = "#d6a040",
		base0A = "#e0b060",
		base0B = "#c09048",
		base0C = "#a67840",
		base0D = "#d8a860",
		base0E = "#e0b060",
		base0F = "#8a704e",
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
	local variant = opts.variant or "muted"

	if not M.palettes[variant] then
		vim.notify("RetroTerm: unknown variant '" .. variant .. "'", vim.log.levels.ERROR)
		return
	end

	apply_palette(M.palettes[variant])

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
