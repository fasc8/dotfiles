if not status --is-interactive

    exit 0

else

    # Disable annoying greeting message
    set fish_greeting ""

    # Set global OS variable so 'uname' only needs to be run once
    set -gx OS (uname)

    # Terminal colors
    set -gx TERM xterm-256color

    # Set language environment
    set -gx LANG en_US.UTF-8
    set -gx LANGUAGE en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8
    set -gx LC_CTYPE en_US.UTF-8

    # Set preferred editors and pagers
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx PAGER less
    set -gx MANPAGER 'less -X'

    # Aliasess
    source $HOME/.config/fish/aliases.fish &> /dev/null

    # Abbreviations
    source $HOME/.config/fish/abbreviations.fish &> /dev/null

    # Environment
    source $HOME/.config/fish/env.fish &> /dev/null

    # Bindings
    source $HOME/.config/fish/binds.fish &> /dev/null

    # Colorscheme
    source $HOME/.config/fish/colorscheme.fish &> /dev/null

    # fzf
    if test -d $HOME/.fzf/shell
        source $HOME/.fzf/shell/key-bindings.fish
        set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
        fzf_key_bindings
    end

    # Start X
    source $HOME/.config/fish/startx.fish &> /dev/null

end
