use std/util "path add"

path add "/opt/homebrew/bin"
path add "~/.cargo/bin"

$env.EDITOR = "hx"
$env.HELIX_RUNTIME = "~/pkg/helix/runtime"
$env.config.buffer_editor = "hx"


mkdir ($nu.data-dir | path join "vendor/autoload")

starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
