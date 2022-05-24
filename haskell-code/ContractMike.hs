module ContractMike where

{-
Schritt 1:
einfaches Beispiel

Zero Coupon Bond / Zero-Bond
"Ich bekomme am 24.12.2022 100€."

Schritt 2:
einfaches Beispiel in kleinere Bestandteile/Ideen zerlegen
- Währung "1€ jetzt"
- Betrag/Vielfaches "100€ jetzt"
- Später
suche dabei nach "closure of operations": gleicher Typ rein wie raus

Schritt 3:
nächstes Beispiel

FX Swap:
Ich bekomme am 24.12.2022 100€.
Ich zahle am 24.12.2022 100GBP.

Suche speziell nach "binären Kombinatoren": Aus 2 Dingen wird 1 Ding
... -> Monoid
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

-- >>> :type Multiple
-- Multiple :: Amount -> Contract -> Contract
-- >>> :type And
-- And :: Contract -> Contract -> Contract
data Contract =
    One Currency
  | Multiple Amount Contract -- Kombinator
  | Later Date Contract
  | Reverse Contract
  | And Contract Contract
  | Empty -- neutrales Element bezüglich And
  deriving Show

one = One

zcb1 = Later (Date "2022-24-12") (Multiple 100 (One EUR))

zeroCouponBond :: Date -> Amount -> Currency -> Contract
zeroCouponBond date amount currency =
    Later date (Multiple amount (One currency))

zcb2 = Reverse (zeroCouponBond (Date "2022-24-12") 100 GBP)

fxSwap :: Date -> Amount -> Currency -> Amount -> Currency -> Contract
fxSwap date amount1 currency1 amount2 currency2 =
    And (zeroCouponBond date amount1 currency1)
        (Reverse (zeroCouponBond date amount2 currency2))

data Direction = Long | Short  
  deriving Show 

data Payment =
    Payment Date Direction Amount Currency
  deriving Show

-- type ContractState = (Date, Contract)
-- Welche Zahlungen entstehen durch einen Vertrag?
contractPayments :: Contract -> Date -> ([Payment], Contract)
contractPayments (One currency) now =
    ([Payment now Long 1 currency], Empty)
contractPayments (Multiple amount contract) now = undefined
contractPayments (Later date contract) now = undefined
contractPayments (Reverse contract) now = undefined
contractPayments (And contract1 contract2) now = undefined
contractPayments Empty now = ([], Empty)
