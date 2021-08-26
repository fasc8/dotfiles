# Base aliases
alias vi "nvim"
alias vim "nvim"

if type -q bat
    alias cat "bat"
end

if type -q exa
    alias ls "exa"
    alias la "exa -lah"
    alias ll "exa -lh"
    alias l "exa -lah"
else
    alias ls "ls"
    alias la "ls -la"
    alias ll "exa -lh"
    alias l "ls -lah"
end
