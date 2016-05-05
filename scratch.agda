open import Data.Nat
open import Data.Empty

data 𝔹 : Set where
  True  : 𝔹
  False : 𝔹

const : ℕ → 𝔹 → ℕ
const = λ n b → n

polyConst : {A B : Set} → A → B → A
polyConst {A} {B} = λ a b → a

data List (A : Set) : Set where
  Nil  : List A
  _::_ : A → List A → List A

-- 42 : ℕ : Set : Set₁ ...

data _isEven : ℕ → Set where
  ZEven : 0 isEven
  NEven : ∀ n → n isEven → (suc (suc n)) isEven

4isEven : 4 isEven
4isEven = NEven 2 (NEven 0 ZEven)

¬ : Set → Set
¬ A = A → ⊥

recℕ : (C : Set) → C₀ ... → T → C

indℕ : (C : T → Set) → (C₀ : ...) ... → (t : T) → C t




