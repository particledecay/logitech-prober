CC = gcc
CFLAGS = -lX11

xquery-pointer-x: xquery-pointer-x.c
	$(CC) -o $@ $^ $(CFLAGS)
