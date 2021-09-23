import Data.Set ( fromList, toList )
import Data.List
import Data.Char (digitToInt)

-- Ejercicio 1
quitaUno :: Eq a => a -> [a] -> [a] -- Eq para que la a sea de un tipo generico que se pueda igualar.
quitaUno _ [] = []
quitaUno x (y:ys)   | x == y    = quitaUno x ys
                    | otherwise = y : quitaUno x ys

-- Ejercicio 2
quitaRep1 ::  Ord a =>  [a] -> [a]
quitaRep1 = toList . fromList

quitaRep2 :: (Eq a) => [a] -> [a]
quitaRep2 [] = []
quitaRep2 [x] = [x]
quitaRep2 (x:xs) = x : [ k | k <- quitaRep2 xs, k /=x ]

-- Ejercicio 3
dif::Eq a=>[a]->[a]->[a]
dif x [] = x
dif x (y:ys) = dif (quitaUno y x) ys

--Ejercicio 4
perm::Eq a=>[a]->[a]->Bool
perm x y = (dif x y == []) && (dif y x == [])

--Ejercicio 5 ***
-- sonpermede1 :: [[a]] -> [[a]]
-- sonpermede1 (x:xs)= 
   -- filter perm x x:xs  

-- Ejercicio 6
aDecimal :: Num int => [int] -> int
aDecimal = foldl addDigit 0
   where addDigit num d = 10*num + d

digits :: Int-> [Int]
digits = map digitToInt . show

-- Ejercicio 7
toBin :: Int -> [Int]
toBin 0 = [0]
toBin n =   if n `mod` 2 == 1 then toBin (n `div` 2) ++ [1]
            else toBin (n `div` 2) ++ [0]

decimalAbinario:: Int -> Int
decimalAbinario x= aDecimal (toBin x)

binarioAdecimal :: Int -> Int
binarioAdecimal 0 = 0
binarioAdecimal i = 2 * binarioAdecimal (div i 10) + (mod i 10)
-- Ejercicio 8
ordenada :: Ord a => [a] -> Bool
ordenada (x:xs)=    if (xs/=[])then (x<=head xs) && ordenada xs 
                    else True

-- Ejercicio 9 ***
wordsWhen :: (Char -> Bool) -> [Char] -> [[Char]]
wordsWhen p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'

