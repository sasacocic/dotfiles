# Installation instructions

1. `git clone https://github.com/sasacocic/dotfiles.git` in your $HOME
2. create simlinks to `$HOME` from dotfiles repo
   - e.g. `ln -sn $HOME/dotfiles/.gitconfg $HOME/.gitconfig`

# TODOs

1. clean up dotfiles for tools I no longer use

# Dependencies / Tools I use (as of Feb 5h. 2023)

At the moment I primarily use `vscode`, `zsh w/oh-my-zsh` (slowly switching to `fish`)

There are things in here that I don't really use anymore like `neovim` and `emacs` - those need to be cleaned up.

- brew (output of `brew list -1` @ Feb. 5th 2023)

```sh
==> Formulae
adns
aspell
bdw-gc
c-ares
ca-certificates
elm
elm-format
fd
fish
fzf
gettext
gmp
gnupg
gnutls
guile
htop
jemalloc
jq
leiningen
libassuan
libev
libevent
libffi
libgcrypt
libgpg-error
libidn2
libksba
libtasn1
libtermkey
libtool
libunistring
libusb
libuv
libvterm
luajit
luajit-openresty
luv
m4
msgpack
ncurses
neovim
nettle
nghttp2
npth
nvm
oniguruma
openjdk
openjdk@11
openssl@1.1
p11-kit
pcre2
pinentry
pkg-config
readline
ripgrep
stripe
supabase
tmux
tree
tree-sitter
unbound
unibilium
utf8proc

==> Casks
alacritty
discord
emacs
font-cascadia-code
font-ibm-plex
insomnia
jetbrains-toolbox
mullvadvpn
obs
slack
telegram
```

# Issues I rand into when setting up this on my work laptop / suggesetions=

**suggestions**

- change 1. of install instructions to `git clone $HOME + https//github...`
- basically all of my dependencies and things I use here aren't listed. I use homebrew, and since I do that I
  should probably list all of the casks I have installed or need???
- I had to install a lot of things on my own and do some work, but I think mostly the dotfiles worked to help speed that up.
