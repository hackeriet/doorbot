.PHONY:
	echo "make install baby!"
	exit 0

install:
	install open-ze-lock /usr/local/bin/
	install lockdaemon /usr/local/bin/
	install rc.lockdaemon /etc/init.d/lockdaemon
	update-rc.d lockdaemon defaults


