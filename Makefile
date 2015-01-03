.PHONY:
	echo "make install baby!"
	exit 0

install:
	install open-ze-lock /usr/local/bin/
	install sudowrap-open-ze-lock /usr/local/bin/
	install lockdaemon /usr/local/bin/


