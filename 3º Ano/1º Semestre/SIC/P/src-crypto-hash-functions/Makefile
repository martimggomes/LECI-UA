CFLAGS := -Wall -g

all: avalanche-analysis

avalanche-analysis: avalanche-analysis.o
	$(CC) -o $@ $^ -lcrypto

clean:
	rm *.o
	rm avalanche-analysis
