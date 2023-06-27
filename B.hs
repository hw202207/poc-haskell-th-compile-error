{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -ddump-splices #-}
 
module B (test) where

import TH (th)

test :: IO ()
test = do
  let s = $(th ''Double)
  print (s :: Maybe String)