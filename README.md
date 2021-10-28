## How to setup

### iTerm2
```
See `iterm` folder
```

### Vim
```console
cp -r vim/ ~/.vim
cp vimrc ~/.vimrc
```

###### Install goimports: `go get golang.org/x/tools/cmd/goimports` for gofmt.vim plugin

*`vimrc`* was originally from [shykes](https://github.com/shykes/devbox)

### Fish shell

###### *[Install Fish Shell](https://fishshell.com/)*

```console
cp -r config/ ~/.config
```

### oh-my-fish

###### *Follow steps [here](https://github.com/oh-my-fish/oh-my-fish)*

```console
cp -r oh-my-fish/ ~/.oh-my-fish
```

###### *Fish syntax is not fully compatible with bash, so we need `foreign-env` plugin to reuse ~/.profile*

```console
omf install foreign-env
```

###### *`fish theme`*: run `omf theme default`

###### *`To correct default theme git prompt`*: see https://gist.github.com/orklann/57e4dbdcd52b291a2b58b6a302bbc9fe

### Objc Autocomplete for Vim
###### Use this script to generate .clang_complete file for current folder
https://gist.github.com/orklann/2f5c2989cdf0a84a1f6ff96f9c442c13

## Screenshot

![Fish Default Theme](https://raw.githubusercontent.com/orklann/devbox/master/Fish%20default%20theme.png)
![DNA](https://raw.githubusercontent.com/orklann/devbox/master/dna.png)
![Vim Status Line](https://raw.githubusercontent.com/orklann/devbox/master/Vim%20Satusline.png)
