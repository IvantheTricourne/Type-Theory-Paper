%default total

transit : {a : Type} -> {x,y,z : a} -> y = z -> x = y -> x = z
transit Refl prf1 = prf1

leftIdentity : {a : Type} -> {x,y : a} -> (f : x = y) -> trans f Refl = f
leftIdentity Refl = Refl

rightIdentity : {a : Type} -> {x,y : a} -> (f : x = y) -> trans Refl f = f
rightIdentity Refl = Refl

transitAssociativity : {a : Type} -> {x,y,z : a} -> (f : x = y) -> (g : y = z) -> (h : z = w) ->
  transit h (transit g f) = transit (transit h g) f
transitAssociativity Refl Refl Refl = Refl

symmetry : x = y -> y = x
symmetry prf = rewrite prf in Refl

leftInverse : {a : Type} -> {x,y : a} -> (f : x = y) -> trans f (symmetry f) = Refl
leftInverse Refl = Refl

rightInverse : {a : Type} -> {x,y : a} -> (f : x = y) -> trans (symmetry f) f = Refl
rightInverse Refl = Refl

