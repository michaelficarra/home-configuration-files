all:
	git submodule init && git submodule update
	echo making directories...
	find . -type d -not -name . -a -not -regex "\./\.git\(/.*\)?" -print -exec mkdir -p ~/{} \;
	mkdir -p ~/.vim/backup
	echo linking files...
	find . -type f -not -name "README.md" -a -not -name "Makefile" -a -not -regex "\./\.git\(/.*\)?" -a -not -name ".gitmodules" -print -exec ln -f -T '{}' ~/{} \;
