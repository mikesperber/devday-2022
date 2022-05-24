module ContractMike where

{-
Schritt 1:
einfaches Beispiel

Zero Coupon Bond / Zero-Bond
"Ich bekomme am 24.12.2022 100€."

-}
data Currency = EUR | GBP
  deriving Show 

type Amount = Double

data Date = Date String
  deriving (Show, Eq, Ord)

date1 = Date "2022-12-24"
