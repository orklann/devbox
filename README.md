## How to setup

##### iTerm2
```
See `iterm` folder
```

##### Vim
```SHELL
cp -r vim/ ~/.vim
cp vimrc ~/.vimrc
```

*`vimrc`* was originally from [shykes](https://github.com/shykes/devbox)

##### Fish shell

###### *[Install Fish Shell](https://fishshell.com/)*

```SHELL
cp -r config/ ~/.config
```

##### oh-my-fish

###### *Follow steps [here](https://github.com/oh-my-fish/oh-my-fish)*

```SHELL
cp -r oh-my-fish/ ~/.oh-my-fish
```

###### *Fish syntax is not fully compatible with bash, so we need `foreign-env` plugin to reuse ~/.profile*

```SHELL
omf install foreign-env
```

###### *`fish theme`*: run `omf theme default`

## Screenshot

![Fish Default Theme](https://raw.githubusercontent.com/aaron-elkins/devbox/master/Fish%20default%20theme.png)
![DNA](https://raw.githubusercontent.com/aaron-elkins/devbox/master/dna.png)
