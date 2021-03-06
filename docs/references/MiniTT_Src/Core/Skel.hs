-- Haskell module generated by the BNF converter

module Core.Skel where

import qualified Core.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transIdent :: Core.Abs.Ident -> Result
transIdent x = case x of
  Core.Abs.Ident string -> failure x
transCaseTk :: Core.Abs.CaseTk -> Result
transCaseTk x = case x of
  Core.Abs.CaseTk string -> failure x
transDataTk :: Core.Abs.DataTk -> Result
transDataTk x = case x of
  Core.Abs.DataTk string -> failure x
transExp :: Core.Abs.Exp -> Result
transExp x = case x of
  Core.Abs.ELam patt exp -> failure x
  Core.Abs.ESet -> failure x
  Core.Abs.EPi patt exp1 exp2 -> failure x
  Core.Abs.ESig patt exp1 exp2 -> failure x
  Core.Abs.EOne -> failure x
  Core.Abs.Eunit -> failure x
  Core.Abs.EPair exp1 exp2 -> failure x
  Core.Abs.ECon ident exp -> failure x
  Core.Abs.EData datatk summands -> failure x
  Core.Abs.ECase casetk branchs -> failure x
  Core.Abs.EFst exp -> failure x
  Core.Abs.ESnd exp -> failure x
  Core.Abs.EApp exp1 exp2 -> failure x
  Core.Abs.EVar ident -> failure x
  Core.Abs.EVoid -> failure x
  Core.Abs.EDec decl exp -> failure x
  Core.Abs.EPN -> failure x
transDecl :: Core.Abs.Decl -> Result
transDecl x = case x of
  Core.Abs.Def patt exp1 exp2 -> failure x
  Core.Abs.Drec patt exp1 exp2 -> failure x
transPatt :: Core.Abs.Patt -> Result
transPatt x = case x of
  Core.Abs.PPair patt1 patt2 -> failure x
  Core.Abs.Punit -> failure x
  Core.Abs.PVar ident -> failure x
transSummand :: Core.Abs.Summand -> Result
transSummand x = case x of
  Core.Abs.Summand ident exp -> failure x
transBranch :: Core.Abs.Branch -> Result
transBranch x = case x of
  Core.Abs.Branch ident exp -> failure x

