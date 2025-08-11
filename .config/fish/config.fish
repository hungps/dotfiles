if not type -q fisher
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  fisher update
end

if status is-interactive
  set fish_tmux_autostart true
end

if status --is-login
  set -gx PATH $PATH $HOME/.local/bin

  set -gx DOTFILES_PATH $HOME/.dotfiles
  set -gx EDITOR (which nvim)
end

alias vim="nvim"
alias vi="nvim"
alias ls="ls --color"
alias ssh="TERM=xterm-256color $(which ssh)"

