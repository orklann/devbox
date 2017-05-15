# How to setup

## iTerm2
```
See `iterm` folder
```

## Vim
```
mkdir ~/.vim
cp -r vim/ ~/.vim/
cp vimrc ~/.vimrc
```

**`vimrc`** was originally from [shykes](https://github.com/shykes/devbox),

## Fish shell

[Fish Shell](https://fishshell.com/)

Fish syntax is not fully compatibale with bash, so we need `foreign-env` plugin to reuse ~/.profile

```
omf install foreign-env
```

## oh-my-fish

Follow steps [here](https://github.com/oh-my-fish/oh-my-fish)

**`fish theme`**: run `omf theme default`

## Screenshot

![Fish Default Theme](https://raw.githubusercontent.com/aaron-elkins/devbox/master/Fish%20default%20theme.png)
