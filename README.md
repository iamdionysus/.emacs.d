## Install
### recent emacs on ubuntu

``` bash
sudo add-apt-repository ppa:cassou/emacs
sudo apt-get update
sudo apt-get install emacs24 emacs24-el emacs24-common-non-dfsg
```

### install emacs packages
M-x list-packages and search packages names (C-s), check=(i), and execute to install(x)

### Emacs packages used
* color-theme-solarized
* smex : better M-x
* multi-term: better shell, not for windows
* auto-complete
* smartparens
* helm: helm-mini is useful to navigate buffers and Recentf is nice
* projectile : project based file navigation with fuzzy search
* projectile-rails
* flycheck
* flx-ido
* helm-projectile
* projectile-rails
* inf-ruby: ruby REPL
* robe: ruby IDE like features such as "go to definition", "open documentation"

## Issues and solution
### rvm complains my zsh version
needs to upgrade zsh. Under ubuntu apt-get install zsh is not happy version for rvm. I followed [this](http://michaelheap.com/installing-zsh-5-0-on-centos-5-7/) instruction
#### compile zsh
``` bash
wget http://sourceforge.net/projects/zsh/files/zsh/5.0.5/zsh-5.0.5.tar.bz2/download
tar xvjf download
cd zsh-5.0.5
./configure && make && sudo make install
```
#### change login shell
``` bash
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
```

### shift + up in emacs
#### error message
`<select>` is undefined

#### situation
* `(windmove-default-keybindings)` added to init.el in order to use Shift+arrow_keys to move cursor around split panes
* running emacs -nw from gnome terminal
* hit `S-<up>` -> error

#### solution
In xterm set up, `S-<up`> is overriden to something else. `S-<up>` is not working as intended if I run emacs -nw from gnome terminal. Insert this to init.el
``` lisp
(if (equal "xterm" (tty-type))
      (define-key input-decode-map "\e[1;2A" [S-up]))
```
See [this](http://lists.gnu.org/archive/html/help-gnu-emacs/2011-05/msg00211.html)

### pry is not really working with inf-ruby
#### issue
Top of the google search result of "making pry work with inf-ruby" is not really making pry work with inf-ruby. The solution suggests some tweak within init.el, however,

* ```(add-to-list 'inf-ruby-implementations '("pry" . "pry"))``` causes init.el load error. It's already implemented in the inf-ruby.el source so I don't think it's necessary to add again.

* ```(setq inf-ruby-default-implementation "pry")``` actually makes inf-ruby run the pry. However, with **flaws**. If pry is running with this set up and if I send the buffer/region/block, I get ```NameError: uninitialized constant IRB from (pry):1:in `__pry___'```. Again, I looked into the inf-ruby.el source code and it looks like inf-ruby is already taking care of the pry smartly. So this set up shouldn't be added to init.el as well.

### Solution
* don't add anything which is mentioned above to init.el to make pry work especially if it's installed from MELPA
* Instead, [set pry as default irb](http://blog.revathskumar.com/2012/11/set-pry-as-default-irb.html) by
 * create ~/.irbrc if you don't have one
 * add this
  ```ruby 
require 'pry'
Pry.start
exit
