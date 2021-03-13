NAME=nn
OTHER=Nnet.hs
build:
	ghc -Wall $(NAME).hs $(OTHER) -o $(NAME)

clean:
	rm *.o
	rm *.hi
