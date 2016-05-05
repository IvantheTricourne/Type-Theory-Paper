## general
* HoTT is compatible with both classical and constructive logic
* Since TT constructs its terms, it has a very nice computational nature
* HoTT, speficially with (-1)-types like #t and #f, includes classical logic
* Since HoTT operates on a spectrum -1 < n < (oo), with (oo) being
constructivism and -1 being classical
* However, even in the classical spectrum, HoTT still remains "constructive"
in that it still uses the notion of inhabitance

## notes to self
* read chapter 2 in UF: "homotopical viewpoint on type theory"
* chapter 6: higher inductive types (basis of Chp8 on HoTT)
* chapter 7: homotopy n-types (above)

## random
* **box** is paradoxical, since it **box** : **box**. From there, we can inhabit even **perp**,
since all types have an inhabitant.
* to combat this, universes are added. **box 0** : **box 1**
* *Pi* is a special case of *arrow*
* *Sigma* is a special case for *product*
* *induction* is a special case for *recursor*

## stuff
* Thinking of logic as a game, *rules* are the rules of movement or progression, while
axioms are statements on how the game is *started*
* **Iso(a,b)** : E(f,g : a->b) . (A(x:a) . g f x = x) ^ (A(y:b) . f g y = y)
* **UA** : (A = B) =~= (A =~= B)
* **Refl** : {a : Type} -> (x : a) -> x = x
* *identity is equivalent to equivalence*, *equivalent types are identical*
* this expands the notion of **identity**, not **equivalence**
* **3 notions of UA**
* logic: an identification p : A = B
* topo: a path p : A ~> B
* homotopical: an equivalence A=~=B
