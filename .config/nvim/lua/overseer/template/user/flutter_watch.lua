return {
	name = "Flutter: Watch",
	builder = function()
		local pid_file = "/tmp/flutter-runner.pid"

		local script = ([[
			kill -USR1 "$(cat "%s")" >/dev/null 2>&1 || true
      exit 0
    ]]):format(pid_file)

		return {
			cmd = { "sh", "-c", script },
			components = { "restart_on_save", "default" },
		}
	end,
	condition = {
		filetype = { "dart" },
	},
}
