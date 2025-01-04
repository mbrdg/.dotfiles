# Dotfiles

My personal collection of my configuration files for the different programs that
I use. In this repo, there are configs for the following programs:

+ [`ghostty`](./ghostty/config)
+ [`git`](./git/config)
+ [`nvim`](./nvim/init.lua)
+ [`tmux`](./tmux/tmux.conf)
+ [`zsh`](./zsh/)

## Usage

Files are managed through the script [`mklinks.sh`](./mklinks.sh). It
automatically populates the links into the `.config` folder.

```sh
sh mklinks.sh
```

And that's all! :shipit:

## Acknowlegments

These configs are inspired by the following:

+ [nvim-kickstart](https://github.com/nvim-lua/kickstart.nvim)
+ [geohot's tmux config](https://github.com/geohot/configuration/blob/master/.tmux.conf)

---
[mbrgd](mailto:mig.rodrigues@gmail.com)
