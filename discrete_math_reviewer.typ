#import "@preview/itemize:0.1.2" as el
#set enum(numbering: "(I). (A). (1).")
#show: el.default-enum-list
#set par(justify: true)
#set text(font: "New Computer Modern", size: 11pt)
#let pmod-spacing = state("pmod-spacing", 2em/9)
#show math.equation.where(block: true): it => {
  pmod-spacing.update(2em/9)
  it
}
#show math.equation.where(block: false): it => {
  pmod-spacing.update(2em/9)
  it
}
#show math.equation.where(block: false): box
#let pmod(m) = context h(pmod-spacing.get()) + $(mod med #m)$
#set page(paper: "a4", numbering: "1")
#set enum(numbering: "1.")
#set heading(numbering: "1.1")

#align(center)[
  #text(size: 20pt, weight: "bold")[LE Reviewer]
  
  #v(0.3em)
  #text(size: 12pt)[Counting, Combinatorics, and Generating Functions]

  #v(0.3em)
  #text(size: 12pt)[Vinluan, Ieuan David R.]
  
  #v(0.5em)
  #line(length: 100%, stroke: 0.5pt)
]

#v(1em)
#outline()
= Basic Counting Principles

== Addition Rule

_Definition_. If a task can be done in $n_1$ ways OR $n_2$ ways, and these ways are disjoint, then there are $n_1 + n_2$ ways to do the task.

Generally, If there are $k$ disjoint sets with cardinalities $|A_1|, |A_2|, ..., |A_k|$, then we have:
$ |A_1 union A_2 union ... union A_k| = |A_1| + |A_2| + ... + |A_k| $

_Example_. A student must choose one class to take next semester. They can choose to take either a math class (5 options) or a history class (3 options). Total choices: $5 + 3 = 8$.

Always remember that the sets must be *mutually exclusive* (disjoint)!

== Multiplication Rule (Product Rule)

_Definition_. If a task consists of a sequence of $k$ steps, where:
- Step 1 can be done in $n_1$ ways
- Step 2 can be done in $n_2$ ways (for each way of doing step 1)
- Step $k$ can be done in $n_k$ ways

Then the total number of ways to complete the task is given by:
$ n_1 times n_2 times ... times n_k $

_Example_. A password consists of 2 letters followed by 3 digits.
- Letters: $26 times 26 = 676$ ways
- Digits: $10 times 10 times 10 = 1000$ ways
- Total: $676 times 1000 = 676 space 000$ passwords

== Inclusion-Exclusion Principle

Given $n$ sets $A_1, A_2, dots, A_n$, the cardinality of their union is given by:
$
  n(union.big_(i = 1)^n A_i) = sum_(k = 1)^n (-1)^(k + 1) (sum_(1 <= i_1 < dots < i_k <= n) n(A_(i_1) inter dots inter A_(i_k))).
$

For two sets,
$ |A union B| = |A| + |B| - |A inter B|. $

For three sets,
$ |A union B union C| = |A| + |B| + |C| - |A inter B| - |A inter C| - |B inter C| + |A inter B inter C|. $

The general idea is to add individual sets, subtract pairwise intersections, add three-way intersections, subtract four-way, and so on.

_Example_. In a class of 30 students:
- 18 play basketball
- 15 play soccer  
- 8 play both sports.

How many play at least one sport?
$ |B union S| = 18 + 15 - 8 = 25 "students" $

#pagebreak()

= Pigeonhole Principle

== Basic Pigeonhole Principle

_Definition_. If $n$ items are placed into $k$ containers, and $n > k$, then at least one container must contain more than one item.

_Example 1_. In a group of 13 people, at least 2 must share the same birth month.
- Pigeons: 13 people
- Holes: 12 months
- Since $13 > 12$, at least one month contains at least 2 people

_Example 2_. Among 5 points placed inside a unit square, at least 2 are within distance $sqrt(2)/2$ of each other.
- Divide the square into 4 quadrants (each $1/2 times 1/2$)
- By pigeonhole, at least one quadrant contains at least 2 points
- Maximum distance in a quadrant: $ sqrt((1/2)^2 + (1/2)^2) = sqrt(2)/2 $

== Generalized Pigeonhole Principle

_Definition_. If $n$ objects are placed into $k$ boxes, then:
- At least one box contains at least $ceil(n/k)$ objects

_Example_. If 100 students take an exam graded 0-10, at least $ceil(100/11) = 10$ students must receive the same grade.

#pagebreak()

= Permutations and Combinations

== Permutations

_Definition_. An arrangement of objects where *order matters*.

=== Permutations of n distinct objects

Number of ways to arrange $n$ distinct objects:
$ P(n) = n! = n times (n-1) times (n-2) times ... times 2 times 1 $

_Example_. Arrangements of letters A, B, C: $3! = 6$
$ "ABC, ACB, BAC, BCA, CAB, CBA" $

=== $r$-Permutations

Number of ways to arrange $r$ objects from $n$ distinct objects:
$ P(n,r) = (n)_r = n!/(n-r)! = n times (n-1) times ... times (n-r+1) $

_Example_. Choose and arrange 2 letters from {A,B,C,D}: 
$ P(4,2) = 4!/(4-2)! = 4!/2! = 12 $

=== Circular Permutations

Given $n$ distinct elements, the number of ways to arrange them in a circle is $(n - 1)!$. Cyclical shifts of a permutation of $n$ elements in a row are all considered the same when they are in a circle.

=== Permutations with Repetition

If there are $n$ objects in total, with $n_1$ of type 1, $n_2$ of type 2, ..., $n_k$ of type $k$:
$ P = n!/(n_1! dot n_2! dot ... dot n_k!) $

_Example_. Arrangements of MISSISSIPPI:
- M: 1, I: 4, S: 4, P: 2
- Total: $ 11!/(1! dot 4! dot 4! dot 2!) = 34650 $

== Combinations

_Definition_. A selection of objects where *order does not matter*.

=== $r$-Combinations

Number of ways to choose $r$ objects from $n$ distinct objects:
$ C(n,r) = binom(n, r) = n!/(r!(n-r)!) $

_Example_. Choose 2 letters from ${A,B,C,D}$:
$ binom(4, 2) = (4 dot 3)/(2 dot 1) = 6 $

Selections: AB, AC, AD, BC, BD, CD

=== Key Properties

Selecting to include is the same as selecting to exclude:
$ binom(n, r) = binom(n, n-r) $

Number of ways to pick nothing or everything:
$ binom(n, 0) = binom(n, n) = 1 $

=== Relationship between P and C

$ P(n,r) = C(n,r) dot r! $

Interpretation: Each combination can be arranged in $r!$ ways.

=== Derangements

A derangement is a permutation of $n$ elements where no element appears in its original position. This is denoted as $D_n$ and is given by the formula

$
  D_n = n! sum_(k = 0)^(n) (-1)^k/k!.
$

#pagebreak()

= Pascal's Formulas and Binomial Theorem

Each entry is $binom(n, r)$ where $n$ is the row and $r$ is the position.

== Pascal's Identity

$ binom(n, r) = binom(n-1, r-1) + binom(n-1, r) $

_Proof_. Consider choosing a subset of size $r$ from a set $S$ with $n$ items. Fix one specific item $x in S$:
- Case 1: we choose $x$. Then, choose $r-1$ more from remaining $n-1$ items: $ binom(n-1, r-1) $
- Case 2: we don't choose $x$. Then, choose $r$ from remaining $n-1$ items → $ binom(n-1, r) $
- Thus, in total:
$
  binom(n, r) = binom(n - 1, r - 1) + binom(n - 1, r)
$

== Vandermonde's Identity

$ binom(m+n, r) = sum_(k=0)^r binom(m, k) binom(n, r-k) $

_Proof_. Consider choosing a subset of size $r$ from two sets $A, B$ of sizes $m$ and $n$, respectively.

- Suppose $k$ come from $A$ and $r - k$ come from $B$
- There are $ binom(m, k) binom(n, r - k) $ ways to choose a subset
- Sum up over all possible $k$:
$
  binom(m + n, r) = sum_(k = 0)^r binom(m, k) binom(n, r - k)
$

== Binomial Theorem

$ (x + y)^n = sum_(k=0)^n binom(n, k) x^k y^(n-k) $

=== Special Cases

*Setting $x = y = 1$:*
$ 2^n = sum_(k=0)^n binom(n, k) $

This gives the total number of subsets of an $n$-element set.

*Setting $x = 1, y = -1$:*
$ 0 = sum_(k=0)^n (-1)^k binom(n, k) $

This shows that the number of even-sized subsets equals odd-sized subsets.

*Setting $y = 1$:*
$ (1 + x)^n = sum_(k=0)^n binom(n, k) x^k $

#pagebreak()

= Recurrence Relations

== Definition

A *recurrence relation* (or recurrence) expresses a sequence term $a_n$ in terms of previous terms.

_Example_. Fibonacci sequence:
$ F_n = F_(n-1) + F_(n-2), quad F_0 = 0, F_1 = 1 $

The equations $F_0 = 0, F_1 = 1$ are called *initial conditions*.

== Common Recurrence Relations

=== Arithmetic Sequence
$ a_n = a_(n-1) + d $
Closed form: $a_n = a_0 + n d$

=== Geometric Sequence  
$ a_n = r dot a_(n-1) $
Closed form: $a_n = a_0 dot r^n$

== Linear Homogeneous Recurrences

A recurrence of the form
$ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k) $

is called a *linear homogeneous recurrence of order $k$* with constant coefficients.

=== Solving Second-Order Linear Homogeneous Recurrences

For $a_n = c_1 a_(n-1) + c_2 a_(n-2)$:

*Step 1:* Write the *characteristic equation*:
$ r^2 = c_1 r + c_2 $
or equivalently: $r^2 - c_1 r - c_2 = 0$

*Step 2:* Solve for roots $r_1, r_2$

*Step 3:* General solution depends on the roots:

_Case 1_: Two distinct real roots $r_1 eq.not r_2$
$ a_n = alpha_1 r_1^n + alpha_2 r_2^n $

_Case 2_: One repeated root $r_1 = r_2 = r$
$ a_n = alpha_1 r^n + alpha_2 n r^n $

*Step 4:* Use initial conditions to find $alpha_1, alpha_2$

== Linear Non-Homogeneous Recurrences

Form: $a_n = c_1 a_(n-1) + c_2 a_(n-2) + f(n)$, where $f(n)$ is the *non-homogeneous term*.

=== Solving

*Step 1:* Solve the associated homogeneous recurrence to get $a_n^((h))$

*Step 2:* Find a particular solution $a_n^((p))$ based on the form of $f(n)$:

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  [*Form of $f(n)$*], [*Try for $a_n^((p))$*],
  [$c$ (constant)], [$A$],
  [$c dot n$], [$A n + B$],
  [$c dot n^2$], [$A n^2 + B n + C$],
  [$c dot s^n$], [$A dot s^n$],
)

*Important:* If your guess for $a_n^((p))$ solves the homogeneous equation (i.e., is a root of the characteristic equation), multiply by $n$.

*Step 3:* General solution: $a_n = a_n^((h)) + a_n^((p))$

*Step 4:* Use initial conditions to find constants

#pagebreak()

= Generating Functions

== Definition

The *ordinary generating function* (OGF) for a sequence ${a_n}_(n = 0)^(oo)$ is:
$ G(x) = sum_(n=0)^oo a_n x^n = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + ... $

The generating function encodes the entire sequence into a single function.

== Common Generating Functions

=== Geometric Series
$ 1/(1-x) = sum_(n=0)^oo x^n = 1 + x + x^2 + x^3 + ... $

*Convergence:* $|x| < 1$

=== Variations

$ 1/(1-a x) = sum_(n=0)^oo a^n x^n $

$ 1/(1+x) = sum_(n=0)^oo (-1)^n x^n $

$ 1/(1-x)^2 = sum_(n=0)^oo (n+1) x^n $

$ 1/(1-x)^k = sum_(n=0)^oo binom(n+k-1, k-1) x^n $

== Operations on Generating Functions

=== Addition
If $G(x) = sum a_n x^n$ and $H(x) = sum b_n x^n$, then:
$ G(x) + H(x) = sum (a_n + b_n) x^n $

=== Scalar Multiplication
$ c dot G(x) = sum (c dot a_n) x^n $

=== Multiplication by $x^k$
$ x^k G(x) = sum a_n x^(n+k) $

This shifts the sequence by $k$ positions.

=== Differentiation
$ G'(x) = sum_(n=1)^oo n a_n x^(n-1) $

Equivalently: $x G'(x) = sum_(n=1)^oo n a_n x^n$

=== Integration
$ integral G(x) dif x = sum_(n=0)^oo a_n/(n+1) x^(n+1) $

== Using Generating Functions to Solve Recurrences

=== General Method

*Step 1:* Let $G(x) = sum_(n=0)^oo a_n x^n$

*Step 2:* Multiply the recurrence by $x^n$ and sum over appropriate values of $n$

*Step 3:* Express the result in terms of $G(x)$ and initial conditions

*Step 4:* Solve for $G(x)$

*Step 5:* Expand $G(x)$ as a power series to find $a_n$

=== Example 1: Fibonacci Numbers

Recurrence: $F_n = F_(n-1) + F_(n-2)$ for $n >= 2$, with $F_0 = 0, F_1 = 1$

*Step 1:* Let $G(x) = sum_(n=0)^oo F_n x^n$

*Step 2:* Multiply recurrence by $x^n$ and sum from $n=2$ to $oo$:
$ sum_(n=2)^oo F_n x^n = sum_(n=2)^oo F_(n-1) x^n + sum_(n=2)^oo F_(n-2) x^n $

*Step 3:* Express in terms of $G(x)$:
- Left side: $G(x) - F_0 - F_1 x = G(x) - x$
- First sum on right: $x sum_(n=2)^oo F_(n-1) x^(n-1) = x(G(x) - F_0) = x G(x)$
- Second sum on right: $x^2 sum_(n=2)^oo F_(n-2) x^(n-2) = x^2 G(x)$

So: $G(x) - x = x G(x) + x^2 G(x)$

*Step 4:* Solve for $G(x)$:
$ G(x)(1 - x - x^2) = x $
$ G(x) = x/(1 - x - x^2) $

*Step 5:* Use partial fractions. Factor denominator:
$ 1 - x - x^2 = -(x - phi)(x - hat(phi)) $

where $phi = (1+sqrt(5))/2$ and $hat(phi) = (1-sqrt(5))/2$

$ G(x) = x/((1-phi x)(1-hat(phi) x)) = A/(1-phi x) + B/(1-hat(phi) x) $

Solving: $A = 1/sqrt(5)$, $B = -1/sqrt(5)$

Expand using geometric series:
$ G(x) = 1/sqrt(5) sum_(n=0)^oo phi^n x^n - 1/sqrt(5) sum_(n=0)^oo hat(phi)^n x^n $

Therefore:
$ F_n = 1/sqrt(5)(phi^n - hat(phi)^n) $

=== Example 2: Constant Non-Homogeneous Term

Recurrence: $a_n = 3a_(n-1) + 2$ for $n >= 1$, with $a_0 = 1$

Let $ G(x) := sum_(n=0)^oo a_n x^n. $

Multiply recurrence by $x^n$ and sum from $n=1$ to $oo$:
$ sum_(n=1)^oo a_n x^n = 3 sum_(n=1)^oo a_(n-1) x^n + 2 sum_(n=1)^oo x^n $

LHS: $ G(x) - a_0 = G(x) - 1 $

First term of RHS: $ 3x sum_(n=1)^oo a_(n-1) x^(n-1) = 3x G(x) $

Second term on right: $ 2 sum_(n=1)^oo x^n = (2x)/(1-x) $

So:
$ G(x) - 1 = 3x G(x) + (2x)/(1-x) $

Solve for $G(x)$:
$
  G(x)(1-3x) &= 1 + (2x)/(1-x) \
  &= (1-x+2x)/(1-x) \
  &= (1+x)/(1-x) \
$
Thus:
$ G(x) = (1+x)/((1-x)(1-3x)) $

Partial fractions:
$ (1+x)/((1-x)(1-3x)) = A/(1-x) + B/(1-3x) $

Solving yields $(A, B) = (-1, 2)$.

$ 
  G(x) &= 2/(1-3x) - 1/(1-x) \
  &= 2 sum_(n=0)^(oo) 3^n x^n - sum_(n=0)^(oo) x^n \
  &= sum_(n=0)^(oo) x^n (2 dot 3^n - 1)
$

Therefore:
$ a_n = 2 dot 3^n - 1 $

== Solving Counting Problems with Generating Functions

=== Example: Coin Change

*Problem:* In how many ways can we make change for $n$ cents using pennies, nickels, and dimes?

Let $a_n$ = number of ways to make $n$ cents.

*Generating function:*
- Pennies (1¢): can use 0, 1, 2, 3, ... $ (1 + x + x^2 + x^3 + ...) = 1/(1-x) $
- Nickels (5¢): can use 0, 1, 2, 3, ... $ (1 + x^5 + x^(10) + x^(15) + ...) = 1/(1-x^5) $
- Dimes (10¢): can use 0, 1, 2, 3, ... $ (1 + x^(10) + x^(20) + ...) = 1/(1-x^(10)) $

Total generating function:
$ G(x) = 1/((1-x)(1-x^5)(1-x^(10))) $

The coefficient of $x^n$ in the expansion of $G(x)$ gives $a_n$.

=== Example: Distributing Identical Objects

*Problem:* Distribute 10 identical candies to 3 children such that each child gets at least 1 candy.

*Solution:* Give 1 candy to each child first. Now distribute remaining 7 candies with no restrictions.

Generating function for each child: $ 1 + x + x^2 + ... = 1/(1-x) $

For 3 children:
$ G(x) = 1/(1-x)^3 = sum_(n=0)^oo binom(n+2, 2) x^n $

Coefficient of $x^7$:
$ binom(7+2, 2) = binom(9, 2) = 36 $

So there are *36 ways*.

#pagebreak()

= Key Formulas

== Counting

- Addition Rule: $ |A union B| = |A| + |B| $
- Multiplication Rule: $ n_1 times n_2 times ... times n_k $
- Inclusion-Exclusion: $ |A union B| = |A| + |B| - |A inter B| $
- Pigeonhole: $n$ objects in $k$ boxes $=>$ at least $ceil(n/k)$ in one box

== Permutations & Combinations

- Permutations: $ P(n,r) = n!/(n-r)! $
- Permutations with repetition: $ n^r $
- Permutations with repeated elements: $ n!/(n_1 ! n_2 ! ... n_k !) $
- Combinations: $ binom(n,r) = n!/(r!(n-r)!) $
- Combinations with repetition: $ binom(n + r - 1,r) $

== Pascal & Binomial

- Pascal's Identity: $ binom(n,r) = binom(n-1,r-1) + binom(n-1,r) $
- Binomial Theorem: $ (x+y)^n = sum_(k=0)^n binom(n,k) x^k y^(n-k) $

== Recurrences

- Characteristic equation for $a_n = c_1 a_(n-1) + c_2 a_(n-2)$: 
  $r^2 - c_1 r - c_2 = 0$
- Distinct roots: $a_n = alpha_1 r_1^n + alpha_2 r_2^n$
- Repeated root: $a_n = alpha_1 r^n + alpha_2 n r^n$

== Generating Functions

- Geometric: $ 1/(1-x) = sum_(n=0)^(oo) x^n $
- Power of $(1 - x)$ as denominator: $ 1/(1-x)^k = sum_(n=0)^(oo) binom(n+k-1, k-1) x^n $

= Exercises

_Instructions_. Answer the following correctly, completely, and precisely.

== Basic Counting Principles

1. How many 7-letter strings over the alphabet ${A, B, C, D}$ contain at least one $A$?

2. In how many ways can 5 different books be distributed to 3 students so that each student gets at least one book?

3. How many integers between 1 and 10,000 (inclusive) are divisible by 3 or 5 but not both?

4. A password consists of 8 characters: uppercase letters or digits. How many passwords contain at least one digit?

5. How many 6-letter strings over ${A, B, C}$ contain exactly two $A$’s and at least one $B$?

== Pigeonhole Principle

6. Prove or disprove: among any 13 integers, there are two whose difference is divisible by 12.

7. Prove or disprove: any set of 6 people has at least 3 mutual acquaintances or 3 mutual strangers.

8. Prove or disprove: in any sequence of $n^2 + 1$ distinct real numbers,
   there exists an increasing or decreasing subsequence of length $n + 1$.

9. Given an integer $n >= 2$ and a set $S$ consisting of $n$ distinct odd integers in the range $[3, 2^X]$, show that if $n >= X$, then you can always find two distinct integers $x, y in S$ such that $y > x$ and $y mod x$ is even.

10. Prove or disprove: Let $S$ be any set of 10 integers chosen from ${1,2,...,18}$.
    There exist two whose sum is $19$.

== Permutations, Combinations, Derangements

11. How many permutations of the letters in MISSISSIPPI are there?

12. How many permutations of {1,2,...,8} have no fixed points?
    (Compute the number of derangements.)

13. How many ways are there to seat 6 men and 6 women in a row
    so that no two women sit next to each other?

14. In how many ways can 10 identical balls be distributed into 4 distinct boxes
    if each box must contain at least one ball?

15. How many permutations of {1,2,...,n} contain exactly one fixed point?

== Pascal’s Formula and Binomial Theorem

16. Prove combinatorially that $ binom(n, k) = binom(n - 1, k) + binom(n - 1, k - 1). $

17. Find the coefficient of $x^7$ in $(1 + 2x)^10$.

18. Prove that
   $ sum_(k=0)^n binom(n, k) = 2^n. $

19. Show that
   $ sum_(k=0)^n (-1)^k binom(n, k) = 0. $

20. Find a closed form for
   $ sum_(k=0)^n k binom(n, k). $

== Recurrences and Solving Recurrences

21. Solve the recurrence:
   $ a_n = 2a_(n-1)$, with $a_0 = 3.$

22. Solve: $a_n = a_(n-1) + 3n$, with $a_0 = 0.$

23. Solve: $a_n = 3a_(n-1) - 2$, with $a_0 = 1$.

24. The Fibonacci sequence satisfies
   $F_n = F_(n-1) + F_(n-2)$, $F_0 = 0$, $F_1 = 1$.
   Find a closed form for $F_n$. // replace

25. Solve:
   $a_n = a_(n-1) + a_(n-2) + 1$,
   with $a_0 = 0, a_1 = 1$.

== Generating Functions

26. Find the generating function for the sequence $a_n = 1$ for all $n >= 0$.

27. Find the generating function for $a_n = n$.

28. Use generating functions to solve
   $a_n = 2a_{n-1}, a_0 = 1.$

29. Find the number of ways to make $n$ cents using coins of
   1, 5, and 10 cents.

30. Let $a_n$ be the number of ways to write $n$ as a sum of 1’s and 2’s.
    Find a generating function and a closed form for $a_n$.

#align(center)[
  #v(2em)
  #line(length: 50%, stroke: 0.5pt)
  
  #text(size: 10pt, style: "italic")[End of Reviewer]
]