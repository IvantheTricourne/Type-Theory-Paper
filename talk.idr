-- Jason : Didn't really help the talk at all

appendIdentity : {a : Type} -> (xs : List a) -> xs ++ [] = xs
appendIdentity [] = Refl
appendIdentity (x :: xs) = 
  rewrite appendIdentity xs in Refl

rev : List a -> List a
rev [] = []
rev (x :: xs) = rev xs ++ [x]

revDistOverAppend : {a : Type} -> (xs,ys : List a) -> rev(xs ++ ys) = rev ys ++ rev xs
revDistOverAppend [] ys = rewrite appendIdentity (rev ys) in Refl
revDistOverAppend (x :: xs) ys = 
  -- rewrite rev_append_dist xs ys in 
  -- rewrite appendAssociative (rev ys) (rev xs) [x] in 
  rewrite revDistOverAppend xs ys in 
  rewrite appendAssociative (rev ys) (rev xs) [x] in
  Refl


-- appendAssociative comes for free

doubleRevThm : {a : Type} -> (xs : List a) -> rev (rev xs) = xs
doubleRevThm [] = Refl
doubleRevThm (x :: xs) = 
  rewrite revDistOverAppend (rev xs) [x] in 
  rewrite doubleRevThm xs in Refl
