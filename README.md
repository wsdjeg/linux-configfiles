This is my setup for configuration files for linux. It also includes my Vim
setup, which works cross OS (Windows, OSX, Linux) and is configured with the
Vim LUA interface introduced in Vim 7.3.

MacVim
	./configure --enable-luainterp=yes --disable-netbeans --enable-gui=macvim --disable-gtktest --disable-gpm --disable-sysmouse --with-features=huge --with-lua-prefix=/usr/local;
	make;
	sudo make install;
