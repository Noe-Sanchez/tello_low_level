DESTDIR = /usr/local
MODE = 755
CC = gcc
CFLAGS = -Wall -Os `pkg-config --cflags gtk+-3.0`
LIBS = -lm -lpthread `pkg-config --libs gtk+-3.0`

all: main.c tello.c
	$(CC) $(CFLAGS) $(LIBS) main.c tello.c -o tello

clean:
	rm -f tello

install: all
	install -d ${DESTDIR}/bin
	install -m ${MODE} tello ${DESTDIR}/bin

uninstall:
	rm -f ${DESTDIR}/bin/tello

.PHONY: all clean install uninstall

