# Talk notes for 10/28/15

* Change your Emacs theme to Whiteboard
* Natural numbers start with 0
* C-c C-s to case-start, C-c C-c case-split

**Don't spend too long on intuitionistic logic**

## PAT (curry howard)
* **Time for a bit of orange**
* PAT interpretation is what allows us to do some really cool things with types,
especially if we extend our concept of *types* (i.e., dependent types)
* *CP* stands for conditional proof
* *not all types are propositions* (e.g. Nat behaves more like a *set*).

## Pi and Sigma
* Exists and For all don't look like types.
* **LETS MAKE IT SO**
* What happens when the dependency isn't used? It defaults to...
* Essentially, the same expression, with more information
* Hence, *generalized*

## Idris
* before starting, say that you're offering a "modern" example
* END: What does it take to have a system like this?
* The theoretical foundation of proof assistants and dependent type systems
is the Calculus of Constructions.

## Lambda Calculus
* **Abstractions create dependency**
* We represent *dependency* as *abstracting over meaning* (i.e., a lambda abstraction)
* || means *or*, when reading language grammars
* the lambda calculus is not an *invented*; it is discovered.[Wadler]
* we have to be careful how we put things together. We need a strong, consistent
base (e.g. untyped lambda calculus is an inconsistent system).

## Lambda Cube
* explain from little yellow cirlce
* each "extension" corresponds to a movement in the shape (like category theory)
* Starting from yellow circle, we have 3 legal movements, representing the 3 extensions
* From any other point, the choices of legal movements decrease by 1 (i.e., we cannot
un-extend)

## STLC
* A safe, consistent system (so consistent that we cannot do anything)

## SOLC
* System F
* addition polymorphism

## Sub-Omega
* With System F, we get System F(omega)
* addition of type constructors

## Predicate
* addition of quantified propositions

## All you need
* `::` means "is defined as"
* hard to put into slide. note that I can send the detailed proof to whoever wants it
