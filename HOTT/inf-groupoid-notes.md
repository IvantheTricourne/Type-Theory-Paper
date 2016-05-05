# The Infinity Groupoid Structure of Identity Types

## A bit of Category Theory
A **category** is comprised of *objects*, *morphisms* and *operators* on morphisms.
For example,

```
f     : A -> B
g     : B -> C
--------------
g . f : A -> C
```

Here, `f` is a morphism and `A` and `B` are objects. `.` is an operator on the
`f` and `g` morphisms. On top of this, a category must meet several conditions.

### Condition 1
Every object has an *identity morphism* :: when this morphism is composed with
any morphism (say `f`), the resulting morphism is equivalent to the original.

```
1(A) : A -> A
f    : A -> B
---------------------(right)
f . 1(A) = f : A -> B

1(B) : B -> B
f    : A -> B
---------------------(left)
1(B) . f = f : A -> B
```

**Note:** We need to check both *left* and *right*. Function composition is
left associative.

### Condition 2
Morphism composition must be associative.

```
f : A -> B
g : B -> C
h : C -> D
----------------------------------
h . (g . f) = (h . g) . f : A -> D
```

## Propositional Equality Over Identity Types
We write `trans` to mean a special form of morphism composition (specifically for
*identity types*/*equivalence propositions*).
```
p         : Id(A, x, y)
q         : Id(A, y, z)
-----------------------
trans q p : Id(A, x, z)

Note: Here, x,y and z are terms of type A.
```

* In Idris syntax: `trans : {a : Type} -> {x,y,z : a} -> (y = z) -> (x = y) -> (x = z)`
* Try and prove this! (it's trivial)

We need to prove the two conditions for a category.

### Condition 1:
* **Q:** What is is an *identity morphism* for an object?
* **A:** It's `Refl`

```
1(x) : x -> x
f    : x -> y
-------------
f . 1(x) ~ f
```

Idris syntax:
```haskell
leftIdentity : {a : Type} -> {x,y : a} -> (f : x = y) -> trans f (Refl x) = f
rightIdentity : {a : Type} -> {x,y : a} -> (f : x = y) -> trans (Refl x) f = f
```

**Something cool:** Notice the proof uses `~` while Idris uses `=`. This should
be read as *propositional equivalence*, which happens at a higher level of proof
equivalence.

`Id_(Id_a x y) f . 1(x) f`

The equality between morphism (i.e., functions) requires proofs of a higher level
equivalence is called a *weak infinity groupoid*.

### Condition 2:
We must now prove the associativity of morphisms.
```
f : x -> y
g : y -> z
h : z -> w
-------------------------
h . (g . f) ~ (h . g) . f
```

Idris syntax:
```haskell
transAssociativity : {a : Type} -> {f : x = y} -> {g : y = z} -> {h : z = w} ->
  trans h (trans g f) = trans (trans h g) f
```

Once we have proven this, we have proven we are in a category.

## Groupoid Structure
**groupoid** : a category where every morphism is inversible (i.e., composing a
morphism with its inverse results in an identity morphism).
```
f   : x -> y
f⁻¹ : y -> x
-----------------------
f . f⁻¹ = 1(y) : y -> y

f   : x -> y
f⁻¹ : y -> x
-----------------------
f⁻¹ . f = 1(x) : x -> x
```

* **Q:** How do we define *inverse*?
* **A:** Inverse is `symmetry : x = y -> y = x`

Idris syntax:
```haskell
leftInverse : {a : Type} -> {x,y : a} -> {f : x = y} -> trans f (symmetry f) = Refl x
rightInverse : {a : Type} -> {x,y : a} -> {f : x = y} -> trans (symmetry f) f = Refl y
```
