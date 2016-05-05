<!-- # Title: Introduction to Dependent Types -->

<!-- <\!-- ## Possible Titles -\-> -->
<!-- <\!-- * *All You Need is Pi* -\-> -->
<!-- <\!-- * *The Calculus of Constructions as an Intro to Type Theory* -\-> -->
<!-- <\!-- * *Type Theory in Little Pieces* -\-> -->

<!-- ## Abstract -->

<!-- <\!-- * What is this about? -\-> -->
<!-- <\!-- * Why do I need dependent types? -\-> -->
<!-- <\!-- * What am I going to talk about? -\-> -->

<!-- Coquand's Calculus of Constructions (λC) is an extension of the -->
<!-- simply-typed λ-calculus with dependent types. Dependent types<\!--  allow us -\-> -->
<!-- <\!-- to -\-> extend the Curry-Howard-DeBruijin Isomorphism<\!--  into a system -\-> -->
<!-- <\!-- that successfully models Intuitionstic (Constructive) Logic, consequently -\-> -->
<!-- allowing us to add to the already powerful relationship between computer -->
<!-- programming and logic. -->

<!-- <\!-- Use something to the lines of "Guided tour"  -\-> -->

<!-- In this talk, I will present an overview of the calculii that λC is composed of. -->
<!-- I do this with a guided tour through Barendregt's λ-cube. I also introduce the -->
<!-- concepts of Constructive Type Theory and present a method described by Nederpelt -->
<!-- and Geuvers of retaining the simplicity of the simply-typed λ-calculus using -->
<!-- combinators to model the logical connectives of Intuitionistic Logic. -->

<!-- With this We can then use the Lambda Cube as a tool -->
<!-- to present the ideas of Type Theory as "extension paths" from the simply-typed -->
<!-- λ-calculus. -->

<!-- allows Constructive Type Theory to be constructed and described by what is known -->
<!-- as H.P. Barendregt's "Lambda Cube". We can then use the Lambda Cube as a tool -->
<!-- to present the ideas of Type Theory as "extension paths" from the simply-typed -->
<!-- λ-calculus. -->

<!-- ----- -->
<!-- Coquand's Calculus of Constructions (λC) is an extension of the simply-typed -->
<!-- λ-calculus with dependent types. Dependent types extend the -->
<!-- Curry-Howard-DeBruijin Isomorphism allowing us to add to the already powerful -->
<!-- relationship between computer programming and logic. -->

<!-- In this talk, I will present an overview of the calculii that λC is composed of. -->
<!-- I do this with a guided tour through Barendregt's λ-cube. I also introduce the -->
<!-- concepts of Constructive Type Theory and present a method described by Nederpelt -->
<!-- and Geuvers of retaining the simplicity of the simply-typed λ-calculus using -->
<!-- combinators to model the logical connectives of Intuitionistic Logic. -->

<!-- ---- -->
<!--  To remedy this, λ→ can -->
<!-- be extended with more expressive types. -->

<!-- This means that λ→ is a system without infinite calculations, which -->
<!-- is what primarily sets it apart from the untyped λ-calculus. Unfortunately, -->
<!-- this system is far too restrictive to be a viable general purpose programming -->
<!-- language, let alone a system for formalizing mathematics. -->

<!-- Coquand's Calculus of Constructions (λC) is an extension of λ→ with dependent -->
<!-- types. Dependent types increase the expressivity of λ→ while retaining its -->
<!-- strongly normalizing attribute. With this, λC is able to extend the -->
<!-- Curry-Howard-DeBruijin Isomorphism in a way that allows it to be a viable -->
<!-- foundation for logic and mathematics. This is the reason why λC is commonly -->
<!-- used as the foundation of proof assistants and dependently typed programming -->
<!-- languages. -->

<!-- proof assistants get rid of -->
<!-- DT have become increasingly important in their use of... -->

<!-- The use of dependent types in the creation of proof assistants and theorem -->
<!-- provers (e.g. Coq, Agda, Idris) has become a bit of a modern standard. In this  -->
<!-- talk, I will introduce the concept of dependent types using the Coquand's -->
<!-- Calculus of Constructions (λC). λC is an extension of Church's simply-typed -->
<!-- λ-calculus (λ→), which is known for guaranteeing termination in the evaluation -->
<!-- of its terms, an attribute that is known as "strong normalization." λC retains -->
<!-- this attribute while also being significantly more expressive, primarily due to -->
<!-- its inclusion of dependent types. -->

<!-- In this talk, I will present a guided tour through Barendregt's λ-cube, starting -->
<!-- from λ→ and ending in λC. Along the way, I also introduce the concepts of -->
<!-- Constructive Type Theory and present a method described by Nederpelt and Geuvers -->
<!-- of retaining the simplicity of λ→ using combinators to model the logical -->
<!-- connectives of Intuitionistic Logic. -->

<!-- ---- -->
**Title**: Introduction to Dependent Types

**Speaker**: Carl Factora

**When/Where**:

October 28, 2015 4:00pm

Ballantine Hall 222

**Abstract**:

Dependent types are becoming more and more ubiquitous in the modern world of
computer programming. Specifically, dependent types can be used as the
theoretical foundation of proof assistants, type checkers and other forms of
program verification. In this talk, I will introduce the concept of dependent
types using the Coquand's Calculus of Constructions (λC). λC is an extension of
the simply-typed λ-calculus (λ->), which is known for its strong normalization. λC
retains this attribute while also being significantly more expressive, primarily
due to its inclusion of dependent types.

In this talk, I will present a guided tour through Barendregt's λ-cube, starting
from λ-> and ending in λC. Along the way, I also introduce the concepts of
Constructive Type Theory and present a method described by Nederpelt and Geuvers
of retaining the simplicity of λ-> using combinators to model the logical
connectives of Intuitionistic Logic.

**Content**

1. Appetizer: Introduce who you are (C311 TA).
   Namedrop -> Constructive Type Theory (CTT)
2. Propositions as Types (use CTT and Idris)
3. Main Course: λ-cube :: λ-> to λC
4. Dessert: All you need is Π (use same proofs as (1))
