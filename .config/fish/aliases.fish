# Base aliases
alias vi "nvim"
alias vim "nvim"

if type -q bat
    alias cat "bat"
end

if type -q exa
    alias ls "exa"
    alias la "exa -lagh"
    alias ll "exa -lgh"
    alias l "exa -lagh"
else
    alias ls "ls"
    alias la "ls -la"
    alias ll "ls -lh"
    alias l "ls -lah"
end
