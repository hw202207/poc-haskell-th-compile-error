$ ghc --make A B TH 
[1 of 3] Compiling A                ( A.hs, A.o, A.dyn_o )
[2 of 3] Compiling TH               ( TH.hs, TH.o, TH.dyn_o )
[3 of 3] Compiling B                ( B.hs, B.o )
dep.
B.hs:10:12-24: Splicing expression th ''Double ======> Nothing

$ ghc --interactive A B TH -osuf ".dyn_o" -hisuf ".dyn_hi"
GHCi, version 9.6.1: https://www.haskell.org/ghc/  :? for help
[3 of 3] Compiling B                ( B.hs, interpreted )
dep.
B.hs:10:12-24: Splicing expression th ''Double ======> Nothing
Ok, three modules loaded.
ghci> :q

(change A.hs trivially like adding spaces)
ghc --interactive A B TH -osuf ".dyn_o" -hisuf ".dyn_hi"
GHCi, version 9.6.1: https://www.haskell.org/ghc/  :? for help
[1 of 3] Compiling A                ( A.hs, interpreted ) [Source file changed]
[3 of 3] Compiling B                ( B.hs, interpreted )

<no location info>: error:
    
GHC.Linker.Loader.dynLoadObjs: Loading temp shared object failed
During interactive linking, GHCi couldn't find the following symbol:
  dlopen(/tmp/nix-shell.aWYMbw/ghc56626_0/libghc_2.dylib, 0x0009): symbol not found in flat namespace '_A_dep_closure'
This may be due to you not asking GHCi to load extra object files,
archives or DLLs needed by your current session.  Restart GHCi, specifying
the missing library using the -L/path/to/object/dir and -lmissinglibname
flags, or simply by naming the relevant files on the GHCi command line.
Alternatively, this link failure might indicate a bug in GHCi.
If you suspect the latter, please report this as a GHC bug:
  https://www.haskell.org/ghc/reportabug

Failed, two modules loaded.