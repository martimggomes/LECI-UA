CFLAGS := $(CFLAGS) -g

all: ec_sign

ec_sign: ec_sign.o
	$(CC) -g -o $@ $^ -lcrypto

clean:
	-rm *.o
	rm ec_sign
