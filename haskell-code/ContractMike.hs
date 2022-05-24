module ContractMike where

{-
Schritt 1:
einfaches Beispiel

Zero Coupon Bond / Zero-Bond
"Ich bekomme am 24.12.2022 100€."

Schritt 2:
einfaches Beispiel in kleinere Bestandteile/Ideen zerlegen
- Währung "1€ jetzt"
- Betrag/Vielfaches
- Später

-}
data Currency = EUR | GBP
  deriving Show 

type Amount = Double

data Date = Date String
  deriving (Show, Eq, Ord)

date1 = Date "2022-12-24"

{-
data Contract =
    ZeroCouponBond Date Amount Currency
    deriving Show
-}