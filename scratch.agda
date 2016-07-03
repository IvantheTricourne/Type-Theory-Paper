open import Data.Nat
-- open import Data.Empty
data ⊥ : Set where

rec⊥ : (C : Set) → ⊥ → C
rec⊥ C ()

ind⊥ : (C : ⊥ → Set) → (z : ⊥) → C z
ind⊥ C ()

data ⊤ : Set where
  * : ⊤

rec⊤ : (C : Set) → C → ⊤ → C
rec⊤ C z _ = z

ind⊤ : (C : ⊤ → Set) → C * → (x : ⊤) → C x
ind⊤ C c * = c

data _+'_ (A B : Set) : Set where
  inl : A → A +' B
  inr : B → A +' B

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

¬ : Set → Set
¬ A = A → ⊥

infix  4  _≡_     -- propositional equality

data _≡_ {ℓ} {A : Set ℓ} : (a b : A) → Set ℓ where
  refl : (a : A) → (a ≡ a)

ind≡ : {A : Set} (C : {x y : A} → x ≡ y → Set) →
       (∀ (x : A) → C (refl x)) →
       {x y : A} (p : x ≡ y) → C p
ind≡ C c (refl x) = c x       

rec≡ : {A : Set} {x y : A} (C : A → Set) → (p : x ≡ y) → C x → C y
rec≡ {A} {x} {y} C = 
  ind≡ (λ {x} {y} _ → C x → C y)
       (λ x → λ z → z)
       {x} {y} 

data List (A : Set) : Set where
  Nil  : List A
  _::_ : A → List A → List A

recList : {A : Set} → (C : Set) → C →
          (A → List A → C → C) → List A → C
recList C c f Nil = c
recList C c f (x :: xs) = f x xs (recList C c f xs)

indList : {A : Set} → (C : List A → Set) → C Nil →
          ((x : A) → (xs : List A) → C xs → C (x :: xs)) →
          (xs : List A) → C xs
indList C c f Nil = c
indList C c f (x :: xs) = f x xs (indList C c f xs)
