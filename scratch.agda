open import Data.Nat
-- open import Data.Empty

data ⊥ : Set where

rec⊥ : (C : Set) → ⊥ → C
rec⊥ C ()

ind⊥ : (C : ⊥ → Set) → (z : ⊥) → C z
ind⊥ C ()

prop : {A : Set} → ⊥ → A
prop {A} perp = rec⊥ A perp

prop' : {A : ⊥ → Set} → (x : ⊥) → A x
prop' {A} perp = ind⊥ A perp

¬ : Set → Set
¬ A = A → ⊥


prop₀ : {A : Set} → ¬ (¬ (¬ A)) → ¬ A
prop₀ {A} ¬¬¬a a = rec⊥ ⊥ (¬¬¬a (λ ¬a → ¬a a))
  -- ¬¬¬a (λ ¬a → rec⊥ ⊥ (¬a a))

data ⊤ : Set where
  * : ⊤

rec⊤ : (C : Set) → C → ⊤ → C
rec⊤ C c * = c

ind⊤ : (C : ⊤ → Set) → C * → (x : ⊤) → C x
ind⊤ C c * = c

data _+'_ (A B : Set) : Set where
  inl : A → A +' B
  inr : B → A +' B

prop₁ : ⊤ +' ⊥ → ⊤
prop₁ (inl *) = *
prop₁ (inr perp) = rec⊥ ⊤ perp

-- data _+'_ (A B : Set) : Set where
--   inl : A → A +' B
--   inr : B → A +' B

rec+ : {A B : Set} (C : Set) → (A → C) → (B → C) → A +' B → C
rec+ C f _ (inl a) = f a
rec+ C _ f (inr b) = f b

ind+ : {A B : Set} (C : A +' B → Set) →
       (∀ (x : A) → C (inl x)) →
       (∀ (x : B) → C (inr x)) →
       (x : A +' B) → C x
ind+ C f _ (inl a) = f a
ind+ C _ f (inr b) = f b

data _×_ (A B : Set) : Set where
  _,_ : A → B → A × B

rec× : {A B : Set} (C : Set) → (A → B → C) → A × B → C
rec× C f (a , b) = f a b

ind× : {A B : Set} (C : A × B → Set) →
       (∀ (x : A) (y : B) → C (x , y)) →
       (x : A × B) → C x
ind× C f (a , b) = f a b

record Σ (A : Set) (B : A → Set) : Set
record Σ A B where
  constructor _,_
  field fst : A
        snd : B fst
open Σ

recΣ : {A : Set} {B : A → Set} (C : Set) →
       (∀ (x : A) → B x → C) →
       Σ A B → C
recΣ C f (a , b) = f a b

indΣ : {A : Set} {B : A → Set} (C : Σ A B → Set) →
       (∀ (x : A) → (y : B x) → C (x , y)) →
       (x : Σ A B) → C x
indΣ C f (a , b) = f a b

data 𝔹 : Set where
  True  : 𝔹
  False : 𝔹

rec𝔹 : (C : Set) → C → C → 𝔹 → C
rec𝔹 C t f True = t
rec𝔹 C t f False = f

ind𝔹 : (C : 𝔹 → Set) → C True → C False → (x : 𝔹) → C x
ind𝔹 C t f True = t
ind𝔹 C t f False = f

-- data ℕ: Set where
--   0 : ℕ
--   suc : ℕ → ℕ

example : ℕ → ℕ
-- example = λ (z : ℕ) → z
example = λ z → z
  
recℕ : (C : Set) → C → (ℕ → C → C) → ℕ → C
recℕ C c _ 0 = c
recℕ C c f (suc n) = f n (recℕ C c f n) 

indℕ : (C : ℕ → Set) → C 0 →
       (∀ (x : ℕ) → C x → C (suc x)) →
       (x : ℕ) → C x
indℕ C c _ 0 = c
indℕ C c f (suc n) = f n (indℕ C c f n)

const : ℕ → 𝔹 → ℕ
const = λ n b → n

polyConst : {A B : Set} → A → B → A
polyConst {A} {B} = λ a b → a

-- 42 : ℕ : Set : Set₁ ...

data _isEven : ℕ → Set where
  ZEven : 0 isEven
  NEven : ∀ n → n isEven → (suc (suc n)) isEven

4isEven : 4 isEven
4isEven = NEven 2 (NEven 0 ZEven)


infix  4  _≡_
data _≡_ {A : Set} : (a b : A) → Set where
  refl : (a : A) → (a ≡ a)

-- "PROPOSITIONAL EQUALITY"
-- For a proposition on an arbitrary identity type,
-- if we can show that it holds for (refl x), then
-- C holds for all proofs, p, such that x ≡ y.
J : {A : Set} (C : {x y : A} → x ≡ y → Set) →
    (∀ (x : A) → C (refl x)) →
    {x y : A} (p : x ≡ y) → C p
J C c (refl x) = c x

-- "STRICT EQUALITY"
-- For a proposition on a reflexive equality (x ≡ x),
-- if we can show that it holds for (refl x), then
-- C holds for all other reflexive equalities p : x ≡ x.
K : {A : Set} (C : {x : A} → x ≡ x → Set) →
    (∀ (x : A) → C (refl x)) →
    {x : A} (p : x ≡ x) → C p
K C c (refl x) = c x

rec≡ : {A : Set} {x y : A} (C : A → Set) →
       (p : x ≡ y) → C x → C y
rec≡ {A} {x} {y} C = 
  J (λ {x} {y} _ → C x → C y)
    (λ x z → z)
    {x} {y}


⊤ᵤ : (x : ⊤) → x ≡ *
-- ⊤ᵤ * = refl *
⊤ᵤ = ind⊤ (λ top → top ≡ *) (refl *)


data List (A : Set) : Set where
  Nil  : List A
  _::_ : A → List A → List A

recList : {A : Set} → (C : Set) → C →
          (A → List A → C → C) → List A → C
recList C c f Nil = c
recList C c f (x :: xs) = f x xs (recList C c f xs)

indList : {A : Set} → (C : List A → Set) → C Nil →
          (∀ (x : A) → (xs : List A) → C xs → C (x :: xs)) →
          (xs : List A) → C xs
indList C c f Nil = c
indList C c f (x :: xs) = f x xs (indList C c f xs)

data _↔_ (A B : Set) : Set where
  <>_ : (A → B) × (B → A) → (A ↔ B)

1+1=2 : (⊤ +' ⊤) ↔ 𝔹
1+1=2 = <> (1+1=2' , 1+1=2'')
  where 1+1=2'  = rec+ 𝔹 (λ inl* → True) (λ inr* → False)
        1+1=2'' = rec𝔹 (⊤ +' ⊤) (inl *) (inr *)

absurd : ⊥ → (1 ≡ 2)
absurd = rec⊥ (1 ≡ 2) 
