-------------------------------------------------------------
-- Parte 1 - 2 questões

-- 4. Utilize recursão para criar uma função que calcule 2n
doisElevadoA x  | x==0 = 1
                | otherwise = 2*doisElevadoA(x-1)

-- 5. Escreva uma função que calcule o dobro da soma dos elementos de uma lista.
dobroDaSomaLista ls | (length ls) == 0 = 0
                    | otherwise = 2*(foldl1(+)ls)

-------------------------------------------------------------
-- Parte 2 - 3 questões

-- 10. Escreva uma função que retorne o número de vezes que um dado elemento aparece numa lista.
vezesNaLista x [] = 0
vezesNaLista x (l:ls) | x==l = 1 + vezesNaLista x ls
                      | otherwise = vezesNaLista x ls

-- 14. Escreva uma função que receba uma lista de números e retorne uma tupla com uma lista dos números pares e uma lista dos números ímpares.
parEImpar ls | (length ls)<1 = []
             | otherwise = zip [filter even ls] [filter odd ls]

-------------------------------------------------------------
-- Parte 3 - 3 questões

-- 17. Palindrome é uma seqüência de caracteres igual se lida da esquerda para a direita ou ao contrário. As seqüências
-- %&*+--+*&%, abcdefedcba, 0110 e 0112110 são palíndromes. Escreva uma função que verifique se uma string é
-- uma palindrome. A análise deve ser caracter a caracter, sem reversão da string e verificação de igualdade entre elas.
checaPalindrome (l:ls)  | (length ls) <= 1 = True
                        | l==(last ls) = checaPalindrome (drop ((length ls) - 1) ls)
                        | otherwise = False

-------------------------------------------------------------
-- Parte 4 - Todas

-- 22. Crie uma nova função que utilize a expressão where.
somaDoisBits x y | x/=0&&x/=1||y/=0&&y/=1 = "Parametros devem ser apenas 0 ou 1"
somaDoisBits x y
  | soma < 1 = "0"
  | soma == 1 = "1"
  | soma > 1 = "overflow"
  where soma = x + y

-- 23. Crie uma nova função que utilize a expressão let.
quantosAnosTem ano =  let anoAtual=2016
                        in  anoAtual-ano

-- 24. Crie uma nova função que utilize uma função lambda e a função map.
potenciaLista = (\ls x -> map (^x) ls)

-- 25. Crie uma função que seja polimórfica e que use o operador de composição de funções.


-- 26. Crie uma função que tenha guardas e um operando infinito e requeira avaliação preguiçosa para ser executada.


-------------------------------------------------------------
-- Parte 5
