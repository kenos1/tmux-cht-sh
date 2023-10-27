# Tmux cht.sh

Access cheatsheets easily in a popup in tmux!

![FZF Selection](./assets/selection.png)
![Viewing](./assets/pager.png)

## Requirements

- `curl`
- `tmux`
- `fzf`
- `bash`

## Installation

### Install using TPM

Put this in your configuration file,

```sh
set -g @plugin 'kenos1/tmux-cht-sh'
```

### Install manually using git

1. Clone the repository

```sh
git clone https://github.com/kenos1/tmux-cht-sh ~/clone/path
```

2. Put this line in your config

```sh
run-shell ~/clone/path/tmux-cht-sh.tmux
```

3. Restart `tmux`

## Usage

To invoke the cheatsheet use the keybind <kbd>prefix</kbd>–<kbd>S</kbd>

## Configuration

```shell

# cht-sh default options
set -g @cht-sh-win-height '80%'
set -g @cht-sh-win-width '80%'
set -g @cht-sh-key 'S'
```


- `@cht-sh-key`  
Description: Trigger key for the cht searching with `prefix-`  
Default: `S`  
Values: A char 

- `@cht-sh-win-width`  
Description: A operation window width  
Default: `80%`  
Values: A number or percent string 

- `@cht-sh-win-height`  
Description: A operation window height  
Default: `80%`  
Values: A number or percent string 


Change the pager by changing your `PAGER` environment variable. This means adding this to your shell config:

```sh
# Bash/ZSH example using less
export PAGER="less"
```
