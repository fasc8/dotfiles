# Neovim
#abbr --add e 'nvim'
#abbr --add vconf 'nvim ~/.config/nvim/init.vim'
#abbr --add vplug 'cd ~/.config/nvim/plugins'
#abbr --add vit 'nvim ~/.taskpaper/current.taskpaper'

# fish
#abbr --add fconf 'nvim ~/.config/fish/config.fish'
#abbr --add aconf 'nvim ~/.config/fish/abbreviations.fish; and for a in (abbr -l); abbr -e $a; end; and source ~/.config/fish/abbreviations.fish'

# General Shortcuts
abbr --add dl 'cd ~/Downloads'
abbr --add dt 'cd ~/Desktop'
abbr --add g 'git'
abbr --add d 'docker'
abbr --add x 'exit'
abbr --add y 'yadm'

# Git shortcuts
abbr --add ga 'git add'
abbr --add gaa 'git add .'
abbr --add gb 'git branch'
abbr --add gba 'git branch -a'
abbr --add gbd 'git branch -D'
abbr --add gbl 'git branch | grep "*" | sed "s/* //"'
abbr --add gc 'git commit'
abbr --add gca 'git commit -a'
abbr --add gcm 'git commit --amend'
abbr --add gcd 'cd (git rev-parse --show-toplevel)'
abbr --add gco 'git checkout'
abbr --add gcob 'git checkout -b'
abbr --add gcod 'git checkout development'
abbr --add gcom 'git checkout master'
abbr --add gcp 'git cherry-pick'
abbr --add gcs 'git commit -sS'
abbr --add gd 'git diff'
abbr --add gfp 'git fetch --prune'
abbr --add gfap 'git fetch --all --prune'
abbr --add gi 'git ignore'
abbr --add gl "git log --pretty='format:%C(Yellow)%h%Creset %C(Blue)%ar%Creset %an - %s' --graph"
abbr --add gm 'git merge --no-ff'
abbr --add gpoh 'git push origin HEAD'
abbr --add gpull 'git pull'
abbr --add gpush 'git push'
abbr --add grh 'git reset --hard'
abbr --add gst 'git status'
abbr --add gt 'git tag'
abbr --add gts 'git tag -s'
abbr --add gru 'git remote update'

# yadm shortcuts
abbr --add ya 'yadm add'
abbr --add yau 'yadm add -u'
abbr --add yc 'yadm commit'
abbr --add yd 'yadm diff'
abbr --add yst 'yadm status'

# Get week number
abbr --add week 'date +%V'

# IP addresses
abbr --add extip 'dig +short myip.opendns.com @resolver1.opendns.com'
abbr --add locip 'ipconfig getifaddr en0'

# View HTTP traffic
abbr --add sniff "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

# List file sizes in human-readable format
abbr --add sizes 'du -sh * | sort -n'

# URL-encode strings
abbr --add urlencode 'python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
abbr --add map 'xargs -n1'

abbr --add c 'clear'
abbr --add bc 'bc -l'
abbr --add sha1 'openssl sha1'
abbr --add mkdir 'mkdir -pv'
abbr --add j 'jobs -l'

# Get web server headers
abbr --add header 'curl -I'

