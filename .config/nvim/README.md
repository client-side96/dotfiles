# Voyager - My personal Neovim Configuration

## Mission Statement

Over the years I tried a lot of different code editors and IDE's both in
terminal, but also native GUI applications. Here a short list of the
ones I sticked to the most:

- Visual Studio Code
- Helix
- Neovim
- Zed

While using them I identified functionalities, keybindings and features
I used across those editors in the same way. My goal is to streamline
these functionalities into highly customized, but minimal experience
that embraces UNIX philosophy. Every feature MUST use the best toolset
for the job.


## Why Neovim?

Neovim states in their Github Readme that is strives to be a project
that "Maximize[s] extensibility". In order to create a "highly customized
experience" that at the same time is minimal it seems the most sane choice
to me at this point in time. Other editors like Visual Studio Code are
also highly customizable, but lack performance due to technical nature.


## Roadmap

- [ ] Command Runner
> Run commands like e.g `npm run dev` or `flutter run` from inside Neovim
> Also view and copy log output from these commands

- [ ] Debugger
> Set breakpoints, inspect and watch variable contents

- [ ] Highlight comment keywords
> Highlight the background of comment keywords like NOTE, TODO, FIXME


## Features

### File Finder

- Keybinding: `Space F`
- Dependencies:
    - `ripgrep`: Search for patterns and return a list of files
    - `fzf`: Filter list of files returned by `rg` with a pattern the user enters
- Methodology: Uses native neovim `:find` command and `wildmenu` to search for files
