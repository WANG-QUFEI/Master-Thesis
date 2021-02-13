type Id = String

data Exp = Var Id | App Exp Exp | Type | Abs Id Exp | Pi Id Exp Exp | Let Id Exp Exp Exp

data Val = VGen Int | VApp Val Val | VType | VAbs FVal | VPi Val FVal

type FVal = (Id,Exp,Env)

type Env = [(Id,Val)]

update :: Env -> Id -> Val -> Env
update env x u = (x,u):env

lookUp :: Id -> Env -> Val
lookUp x ((y,u):env) =
 if x == y then u
 else lookUp x env
lookUp x [] = error"lookUp"

-- the whnf algorithm

fapp :: FVal -> Val -> Val
app :: Val -> Val -> Val
eval :: Env -> Exp -> Val

fapp (x,e,env) u = eval (update env x u) e

app (VAbs f) = fapp f 
app v = VApp v 

eval env e = case e of
 Var x -> lookUp x env
 App e1 e2 -> app (eval env e1) (eval env e2)
 Let x e1 _ e3 -> eval (update env x (eval env e1)) e3
 Type -> VType
 Abs x e1 -> VAbs (x,e1,env)
 Pi x a b -> VPi (eval env a) (x,b,env)

-- the conversion algorithm; the integer is
-- used to represent the introduction of a fresh variable

eqVal :: (Int,Val,Val) -> Bool
eqVal (k,u1,u2) =
 case (u1,u2) of
   (VType,VType) -> True
   (VApp t1 w1,VApp t2 w2) -> eqVal (k,t1,t2) && eqVal (k,w1,w2)
   (VGen k1,VGen k2) -> k1 == k2
   (VAbs f1,VAbs f2) -> 
      let v = VGen k 
      in eqVal (k+1,fapp f1 v,fapp f2 v)
   (VPi w1 f1,VPi w2 f2) -> 
      let v = VGen k 
      in eqVal (k,w1,w2) && eqVal (k+1,fapp f1 v,fapp f2 v)
   _ -> False

-- type-checking and type inference

checkExp :: (Int,Env,Env) -> Exp -> Val -> Bool
inferExp :: (Int,Env,Env) -> Exp -> Val
checkType :: (Int,Env,Env) -> Exp -> Bool


checkType (k,rho,gamma) e = checkExp (k,rho,gamma) e VType

checkExp (k,rho,gamma) e v =
 case (e,v) of
   (Abs x e1,VPi w f) ->
        let v = VGen k
        in checkExp (k+1,update rho x v,update gamma x w) e1 (fapp f v)
   (Pi x a b,VType) -> 
        checkType (k,rho,gamma) a &&
        checkType (k+1,update rho x (VGen k),update gamma x (eval rho a)) b 
   (Let x e1 e2 e3,v) ->
        checkType (k,rho,gamma) e1 &&
        let v1 = eval rho e1
        in checkExp (k,rho,gamma) e2 v1 &&
           checkExp (k,update rho x (eval rho e1),update gamma x (eval rho e2)) e3 v
   _ -> eqVal (k,inferExp (k,rho,gamma) e,v)

inferExp (k,rho,gamma) e =
 case e of
   Var id -> lookUp id gamma
   App e1 e2 ->
      case (inferExp (k,rho,gamma) e1) of
        VPi w f -> 
          if checkExp (k,rho,gamma) e2 w
               then fapp f (eval rho e2)
          else error"application error"
        _ -> error"application, expected Pi"
   Type -> VType
   _ -> error"cannot infer type"
