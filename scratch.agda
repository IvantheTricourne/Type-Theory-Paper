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

-- plus : ℕ → ℕ → ℕ
-- plus = ?
-- plus-left-unit : (i : ℕ) → plus 0 i ≡ i
-- plus-left-unit = ?
-- plus-right-unit : (i : ℕ) → plus i 0 ≡ i
-- plus-right-unit = ?


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


sym_J : {A : Set} {x y : A} → x ≡ y → y ≡ x
sym_J = J (λ {x y} x=y → y ≡ x) refl

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


congruence : {A : Set} {x y : A} (P : A → Set) →
             (p : x ≡ y) → P x → P y
congruence P = 
  J (λ {x y} x=y → P x → P y)
    (λ x px → px)

-- exercises
_plus_ : ℕ → ℕ → ℕ
m plus n = f m n where
  f = recℕ (ℕ → ℕ) (λ n → n) (λ m r n → suc (r n))

plus-left-unit : (i : ℕ) → 0 plus i ≡ i
plus-left-unit = 
  indℕ (λ i → 0 plus i ≡ i)
        (refl zero)
        (λ x _ → refl (suc x))

-- plus-right-unit : (i : ℕ) → plus i 0 ≡ i
-- plus-right-unit = 
--   indℕ (λ i → plus i 0 ≡ i)
--        (refl zero)
--        (λ i x+0=x → {!!})

plus-associativity : (x y z : ℕ) → x plus (y plus z) ≡ (x plus y) plus z
plus-associativity = {!!}

transport : {A : Set} {x y : A} (P : A → Set) →
            (p : x ≡ y) → P x → P y
transport {A} {x} {y} P p = 
  J -- on p
    (λ {x} {y} p → (P x → P y))
    (λ _ → λ z → z)
    {x} {y} p



_++_ : {A : Set} → List A → List A → List A
_++_ = append where
  append : {A : Set} → List A → List A → List A
  append {A} = recList (List A → List A)
                       (λ ys → ys)
                       (λ a xs f ys → a :: (f ys))

reverse : {A : Set} → List A → List A
reverse = {!!}

append-left-unit : {A : Set} (xs : List A) → Nil ++ xs ≡ xs
append-left-unit = {!!}

append-right-unit : {A : Set} (xs : List A) → xs ++ Nil ≡ xs
append-right-unit = {!!}

append-associativity : {A : Set} (xs ys zs : List A) →
                       xs ++ (ys ++ zs) ≡ (xs ++ ys) ++ zs
append-associativity = {!!}

append-distributivity : {A : Set} (xs ys : List A) →
                        reverse (xs ++ ys) ≡ (reverse ys) ++ (reverse xs) 
append-distributivity = {!!}

double-reverse : {A : Set} (xs : List A) → reverse (reverse xs) ≡ xs
double-reverse = {!!}
