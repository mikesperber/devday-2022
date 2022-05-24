module Intro where

-- >>> x
-- 35
x :: Integer
x = 12 + 23

-- >>> f (f 12)
-- 14
f :: Integer -> Integer
f x = x + 1

-- Tiere auf dem texanischen Highway ist eins der folgenden:
-- - Gürteltiere - ODER -
-- - Papgeien

-- Gürteltier hat folgende Eigenschaften:
-- - tot oder lebendig - UND -
-- - Gewicht
data Liveness = Dead | Alive 
  deriving Show
--   ^^^^^^^^ Typ
--              ^^^ Konstruktor
l1 :: Liveness
l1 = Dead

type Weight = Integer

-- Ein Papagei hat folgende Eigenschaften:
-- - Satz
-- - Gewicht

-- algebraischer Datentyp
data Animal
  = Dillo Liveness Weight
  | Parrot String Weight
  deriving Show

dillo1 :: Animal
dillo1 = Dillo Alive 10 -- lebendiges Gürteltier, 10kg
dillo2 :: Animal
dillo2 = Dillo Dead 8 -- totes Gürteltier, 8kg

parrot1 :: Animal
parrot1 = Parrot "Hello!" 2
parrot2 :: Animal
parrot2 = Parrot "Goodbye!" 1

-- Tier überfahren
-- >>> runOver dillo1
-- Dillo Dead 10
runOver :: Animal -> Animal
runOver (Dillo l w) = Dillo Dead w
runOver (Parrot s w) = Parrot "" w

