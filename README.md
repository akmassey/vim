# Aaron Massey's vim configuration

I've stolen so many things from so many people, it's time to make my files
available to others.  This repo contains all the files needed to manage my vim
configuration.  Some files are ignored in my .gitignore file, but present on
my file system:

    .
    ├── .gitignore
    ├── .vim
    │   ├── .netrwhist
    │   ├── UltiSnips
    │   |   └── [...]
    │   ├── bundle
    │   |   └── [...]
    │   └── spell
    │       └── [...]
    ├── .vim-backup
    ├── .vim-swapfiles
    └── .vimrc

I'm [managing these files using stow][1].  If you wanted to do the same, don't
forget to ignore the readme when you deploy it:

    stow --ignore "README.md|LICENSE.md" vim

Please also note that I'm using [Vundle][2] to manage my plugins.  If you're
just cloning this repository, then you should install those plugins with
something like this:

    vim +PluginInstall +qall

If you're new to vim, I strongly recommend [Drew Neil's Practical Vim][3] and
his screencasts over on [vimcasts.org][4].


[1]: http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
[2]: https://github.com/gmarik/Vundle.vim
[3]: https://pragprog.com/book/dnvim/practical-vim
[4]: http://vimcasts.org
