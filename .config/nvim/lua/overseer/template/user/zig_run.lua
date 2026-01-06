return {
	name = "Zig: Run",
	builder = function()
		return {
			cmd = { "zig", "run", "src/main.zig" },
			components = { "default" },
		}
	end,
	condition = {
		filetype = { "zig" },
	},
}
