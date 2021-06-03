{-|
Module          : TypeChecker
Description     : providing functions that type check the abstract syntax
Maintainer      : wangqufei2009@gmail.com
Portability     : POSIX
-}
module TypeChecker where


import           Control.Monad
import           Control.Monad.Except
import           Control.Monad.State
import           Data.List
import qualified Data.Map             as Map
import           Data.Maybe
import           Debug.Trace

import           Classes
import           Convertor
import           Core.Abs
import           Core.Print           (printTree)
import           Lang
import           Monads

-- | monad for type-checking
type TypeCheckM a = G TypeCheckError Cont a

-- | a datatype used as exception in an ExceptT monad
data TypeCheckError
  = InvalidApp Exp
  | TypeInferErr Exp
  | NotConvertible Val Val
  deriving (Show)

instance InformativeError TypeCheckError where
  explain (InvalidApp e) = ["Invalid application on: " ++ show e]
  explain (TypeInferErr e) = ["Can not infer type for: " ++ show e]
  explain (NotConvertible v1 v2) = ["Values not convertible", "v1: " ++ show v1, "v2: " ++ show v2]

-- | all the checking functions below run in the context of 'TypeCheckM' monad
-- | infer the type of an expression
checkI       :: Exp -> TypeCheckM Val
-- | check an expression has certain value as its type
checkT       :: Exp -> Val -> TypeCheckM ()
-- | check that two values are equal and infer their type
checkCI      :: Val -> Val -> TypeCheckM Val
-- | check that two values are equal and has the given type
checkCT      :: Val -> Val -> Val -> TypeCheckM ()
-- | check that a definition is valid
checkDef     :: String -> Exp -> Exp -> TypeCheckM Cont
-- | check taht a declaration is valid
checkDec     :: String -> Exp -> TypeCheckM Cont

checkI c U = return U
checkI c (Var x) = case getType c x of
  Just v  -> return v
  Nothing -> error ("variable " ++ show x ++ " is not bound")
checkI c (App e1 e2) = do
  v <- checkI c e1
  case v of
    Clos (Abs (Dec x a) b) r -> do
      checkT c e2 (eval a r)
      let v' = eval e2 (envCont c)
      return $ eval b (consEVar r x v')
    _ -> throwError $ InvalidApp e1
checkI c (Abs (Def x a e1) e) = do
  c' <- checkDef c x a e1
  checkI c' e
checkI c e@(Abs Dec {} _) = do
  checkT c e U
  return U
checkI _ e = throwError $ TypeInferErr e

checkT c U U = return ()
checkT c (Var x) v = case getType c x of
  Just v' -> void (checkCI c v' v)
checkT c e@App {} v = do
  v' <- checkI c e
  void (checkCI c v v')
checkT c (Abs (Dec x a) b) U = do
  checkT c a U
  checkT (consCVar c x a) b U
checkT c (Abs (Dec x a) e) (Clos (Abs (Dec x' a') e') r) = do
  checkT c a U
  let v  = eval a (envCont c)
      v' = eval a' r
  checkCI c v v'
  checkT (consCVar c x a) e (eval e' (consEVar r x' (Var x)))
checkT c (Abs (Def x a e1) e) v = do
  c' <- checkDef c x a e1
  checkT c' e v

checkCI _ U U = return U
checkCI c (Var x) (Var x') =
  if x == x'
  then case getType c x of
         Just v  -> return v
         Nothing -> error ("variable: " ++ show x ++ " is not bound")
  else throwError $ NotConvertible (Var x) (Var x')
checkCI c (App m1 n1) (App m2 n2) = do
  t1 <- checkCI c m1 m2
  case t1 of
    Clos (Abs (Dec x a) b) r -> do
      let t2 = eval a r
          v  = eval n1 (envCont c)
      checkCT c n1 n2 t2
      return (eval b (consEVar r x v))
    _ -> throwError $ NotConvertible (App m1 n1) (App m2 n2)
checkCI c v1@(Clos (Abs (Dec x a) e) r) v2@(Clos (Abs (Dec x' a') e') r') = do
  checkCT c v1 v2 U
  return U
checkCI _ v v' = throwError $ NotConvertible v v'

checkCT c v1 v2 (Clos (Abs (Dec z a) b) r) = do
  let t1 = eval a r
      sx = freshVar z (varsCont c)
      vx = Var sx
      c1 = consCVar c sx t1
      r1 = consEVar r z vx
      t2 = eval b r1
      v1' = eval (App v1 vx) (envCont c)
      v2' = eval (App v2 vx) (envCont c)
  checkCT c1 v1' v2' t2
checkCT c (Clos (Abs (Dec x1 a1) b1) r1) (Clos (Abs (Dec x2 a2) b2) r2) U = do
  let t1 = eval a1 r1
      t2 = eval a2 r2
      sx = freshVar x1 (varsCont c)
      vx = Var sx
      c1 = consCVar c sx t1
      v1 = eval b1 (consEVar r1 x1 vx)
      v2 = eval b2 (consEVar r2 x2 vx)
  checkCI c t1 t2
  checkCI c1 v1 v2
  return ()
checkCT c v1 v2 t = do
  checkCI c v1 v2
  return ()

checkDef c x a e = do
  checkT c a U
  checkT c e (eval a (envCont c))
  return (CConsDef c x a e)

checkDec c x a = do
  checkT c a U
  return (consCVar c x a)

runTypeCheckCtx :: Context -> Either TypeCheckError Cont
runTypeCheckCtx ctx@(Ctx cs) =
  case runG (absCtx ctx) Map.empty of
    Left err -> Left err
    Right ds -> runG (typeCheckCtx ds) CNil
  where
    typeCheckCtx :: [Decl] -> TypeCheckM Cont
    typeCheckCtx ds = do
      mapM_ checkDecl ds
      get
    checkDecl :: Decl -> TypeCheckM ()
    checkDecl d@(Dec x a) = do {
      c  <- get ;
      c' <- checkDec c x a ;
      put c' } `catchError` errhandler d
    checkDecl d@(Def x a e) = do {
      c  <- get ;
      c' <- checkDef c x a e ;
      put c' } `catchError` errhandler d
    errhandler :: Decl -> TypeCheckError -> TypeCheckM ()
    errhandler d err = do
      let ss = ["when checking decl: " ++ show d]
      throwError $ ExtendedErr err ss

checkExpValidity :: Context -> Cont -> CExp -> Either TypeCheckError Exp
checkExpValidity cc ac ce = let m = toMap cc in
  case runG (absExp ce) m of
    Left err -> Left err
    Right e  -> case runG (checkI ac e) CNil of
      Left err -> Left err
      Right _  -> Right e

checkDeclValidity :: Context -> Cont -> CDecl -> Either TypeCheckError Decl
checkDeclValidity cc ac cd =
  let m = toMap cc
  in case runG (absDecl cd) m of
       Left err -> Left err
       Right d -> case d of
         Dec x a -> case runG (checkDec ac x a) of
           Left err -> Left err


toMap :: Context -> Map.Map String Id
toMap (Ctx ds) = Map.unions (map toMapD ds)

toMapD :: CDecl -> Map.Map String Id
toMapD (CDec id _)   = Map.singleton (idStr id) id
toMapD (CDef id _ _) = Map.singleton (idStr id) id
