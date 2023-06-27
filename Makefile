clean:
	rm -f *.o *.hi *.dyn_o *.dyn_hi

build: clean
	 ghc --make A B TH

build2: clean
	ghc -fwrite-if-simplified-core --make A B TH

ghci:
	ghc --interactive A B TH -osuf ".dyn_o" -hisuf ".dyn_hi"
