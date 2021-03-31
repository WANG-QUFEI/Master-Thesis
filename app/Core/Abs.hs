-- Haskell data types for the abstract syntax.
-- Generated by the BNF converter.

module Core.Abs where

import Prelude (Char, Double, Int, Integer, String)
import qualified Prelude as C (Eq, Ord, Show, Read)

newtype Id = Id ((Int, Int), String)
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Context = Ctx [CDecl]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data CExp
    = CU
    | CVar Id
    | CApp CExp CExp
    | CArr CExp CExp
    | CPi Id CExp CExp
    | CWhere Id CExp CExp CExp
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data CDecl = CDec Id CExp | CDef Id CExp CExp
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Cmd
    = Help
    | Exit
    | ShowCtx
    | Eval CExp
    | Iter Integer CExp
    | UnfoldV Id CExp
    | UnfoldN CExp
  deriving (C.Eq, C.Ord, C.Show, C.Read)

