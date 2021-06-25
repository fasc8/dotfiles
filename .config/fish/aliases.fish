# Base aliases
alias l "ls -lah"
alias vi "nvim"
alias vim "nvim"

if type -q bat
    alias cat "bat"
end

if type -q exa
    alias ls "exa"
    alias la "ls -lah"
    alias ll "ls -lh"
end
