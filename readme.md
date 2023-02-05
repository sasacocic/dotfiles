# Installation instructions

1. `git clone https://github.com/sasacocic/dotfiles.git` in your $HOME
2. create simlinks to `$HOME` from dotfiles repo
   - e.g. `ln -sn $HOME/dotfiles/.gitconfg $HOME/.gitconfig`

# Dependencies

- zsh with oh-my-zsh
- nvim
  - [coc](https://github.com/neoclide/coc.nvim)

# Issues I rand into when setting up this on my work laptop / suggesetions=

**suggestions**

- change 1. of install instructions to `git clone $HOME + https//github...`
- basically all of my dependencies and things I use here aren't listed. I use homebrew, and since I do that I
  should probably list all of the casks I have installed or need???
- I had to install a lot of things on my own and do some work, but I think mostly the dotfiles worked to help speed that up.
