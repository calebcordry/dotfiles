# terminfo

Getting italics and truecolor support in iterm2 seems overly
compilcated.
video helps a bit https://www.youtube.com/watch?v=n1cKtZfwOgQ

# truecolor
Truecolor is now natively supported in vim8+
[true color support](https://gist.github.com/XVilka/8346728)
Unfortunately the native mac vim does not have the
`termguicolors` option enabled. Don't forget to `brew install vim`

## Install
This command compiles and overwrites the default files:
```sh
tic -x xterm-256color-italic.terminfo
tic -x tmux-256color.terminfo
```

## Test commands
```sh
echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso`
```

```sh
echo -e "\e[1mbold\e[0m"
echo -e "\e[3mitalic\e[0m"
echo -e "\e[3m\e[1mbold italic\e[0m"
echo -e "\e[4munderline\e[0m"
echo -e "\e[9mstrikethrough\e[0m"
echo -e "\e[31mHello World\e[0m"
echo -e "\x1B[31mHello World\e[0m"
```
