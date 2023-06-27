{-# LANGUAGE TemplateHaskell #-}
module TH (th) where

import A
import Control.Monad.IO.Class (liftIO)

th n = do
  liftIO dep
  [|Nothing|]