-------------------------------------------------------------
-- Parte 1 - 3 questões

-- 1. Escreva uma função que receba uma lista de 4 elementos e verifique se todos os elementos são iguais. - Éden

-- A função funciona para uma lista de vários elementos inclusive de 4.
-- A função, primeiramente, define que os elementos das listas recebidas devem ser do mesmo tipo
-- e esses tipos devem fazer parte do typeclass Eq. Assim, esses elementos podem ser comparados.
-- A função então, simplesmente chama a função (==). Por se tratar de uma lista sendo comparada
-- com outra, a função (==) irá comparar elemento a elemento na ordem. Caso elas não possuam os mesmo elemntos
-- ou possuam tamanhos diferentes, a função retorna Falso.

todosElemIguais :: (Eq a) => [a] -> [a] -> Bool
todosElemIguais xs ys = xs == ys

-- 4. Utilize recursão para criar uma função que calcule 2n - Hugo
doisElevadoA x | x==0 = 1 | otherwise = 2*doisElevadoA(x-1)

-- 5. Escreva uma função que calcule o dobro da soma dos elementos de uma lista - Hugo
dobroDaSomaLista ls | (length ls) == 0 = 0 | otherwise = 2*(foldl1(+)ls)

-------------------------------------------------------------
-- Parte 2 - 3 questões

-- 10. Escreva uma função que retorne o número de vezes que um dado elemento aparece numa lista - Hugo
vezesNaLista x [] = 0
vezesNaLista x (l:ls) | x==l = 1 + vezesNaLista x ls | otherwise = vezesNaLista x ls

--11. Escreva uma função que receba uma lista e retorne o número de elementos que estão acima da média dos valores da lista - Éden
acimaMedia (x:xs) = length [y | y <- (x:xs), y > sum (x:xs) `div` length (x:xs)]

-- 14. Escreva uma função que receba uma lista de números e retorne uma tupla com uma lista dos números pares e uma lista dos números ímpares - Hugo
parEImpar ls | (length ls)<1 = [] | otherwise = zip [filter even ls] [filter odd ls]

-------------------------------------------------------------
-- Parte 3 - 3 questões

-- 17. Palindrome é uma seqüência de caracteres igual se lida da esquerda para a direita ou ao contrário. As seqüências - Hugo
-- %&*+--+*&%, abcdefedcba, 0110 e 0112110 são palíndromes. Escreva uma função que verifique se uma string é
-- uma palindrome. A análise deve ser caracter a caracter, sem reversão da string e verificação de igualdade entre elas.
checaPalindrome (l:ls) | (length ls) <= 1 = True | l==(last ls) = checaPalindrome (drop ((length ls) - 1) ls) | otherwise = False

-- 18. Escreva uma função que quebre uma string em duas partes no ponto onde estiver uma “/” e retorne uma tupla com as duas partes.
-- quebraEmBarra [] = []
-- quebraEmBarra (l:ls) | l/='/' = [l:(quebraEmBarra ls)] | otherwise = []

-- 20. Estenda a função map f xs (retorna a lista dos valores de f aplicada à lista xs) para map3 f xs ys zs (retorna a lista dos resultados de f aplicada às triplas (x,y,z) onde x   xs, y   ys e z   zs).
-- map3 f xs ys zs =[f x y z | (x,y,z) <- zip3 xs ys zs]

-------------------------------------------------------------
-- Parte 4 - Todas

-- 22. Crie uma nova função que utilize a expressão where - Hugo
somaDoisBits x y | x/=0&&x/=1||y/=0&&y/=1 = "Parametros devem ser apenas 0 ou 1"
somaDoisBits x y | soma < 1 = "0" | soma == 1 = "1" | soma > 1 = "overflow" where soma = x + y

-- 23. Crie uma nova função que utilize a expressão let - Hugo
quantosAnosTem ano = let anoAtual=2016 in anoAtual-ano

-- 24. Crie uma nova função que utilize uma função lambda e a função map - Hugo
potenciaLista = (\ls x -> map (^x) ls)

-- 25. Crie uma função que seja polimórfica e que use o operador de composição de funções.
-- O programa retorna o quadrado do tamanho de uma lista de qualquer tipo (polimórfica). Alex
tam [] = 0
tam (x:xs) = 1 + tam xs

quadtam x = ((^2).tam) x

-- 26. Crie uma função que tenha guardas e um operando infinito e requeira avaliação preguiçosa para ser executada.
-- Algoritmo lista os n primeiros impares se t==1, e os n primeiros pares se t==0, avaliação preguiçosa
-- é feita na lsita infinita, que só é avaliada depois que n é definido. - Alex
listaImparesPares n t
                      | t == 0  = take n [2,4..]
                      | t == 1  = take n [1,3..]

-------------------------------------------------------------
-- Parte 5

-- 28 - O algoritmo pergunta ao usuário as características do animal visto, e retorna 
-- a espécie do animal, ou retorna que o animal visto não é conhecido. - Alex

animal = do putStr "\nO animal visto é um mamífero?? (s/n)>"
            ans <- getLine
            if head ans=='S' || head ans=='s' then mamifero
            else do putStr "\nO animal visto é uma ave? (s/n)>"
                    ans <- getLine
                    if head ans=='S' || head ans=='s' then ave
                    else putStr "\nAnimal não é conhecido\n" 
			
mamifero = do putStr "\nO animal visto é carnivoro?? (s/n)>"
              ans <- getLine
              if head ans=='S' || head ans=='s' then carniv
			  else do putStr "\nO animal visto é ungulado? (s/n)>"
			          ans <-getLine
			          if head ans=='S' || head ans=='s' then ungulado
			          else putStr "\nAnimal não é conhecido\n"

carniv  =   do putStr "\nO animal visto tem cor amarelada? (s/n)>"
               ans <- getLine
               if head ans=='S' || head ans=='s' then amarelada
               else putStr "\nAnimal não é conhecido\n" 

amarelada = do putStr "\nO animal visto tem manchas pretas?? (s/n)>"
               ans <- getLine 
               if head ans=='S' || head ans=='s' then putStr "\nO animal visto é um Guepardo!\n"   
               else do putStr "\nO animal visto tem listas pretas? (s/n)>"
                       ans <- getLine
                       if head ans=='S' || head ans=='s' then putStr "\nO animal visto é um Tigre!\n" 
                       else putStr "\nAnimal não é conhecido\n" 

ungulado = do putStr "\nO animal visto tem pescoço grande?? (s/n)>"
              ans <- getLine
              if head ans=='S' || head ans=='s' then pescgrande
              else do putStr "\nO animal visto tem listas pretas? (s/n)>"
                      ans <- getLine
                      if head ans=='S' || head ans=='s' then putStr "\nO animal visto é uma Zebra!\n" 
                      else putStr "\nAnimal não é conhecido\n"

pescgrande = do putStr "\nO animal visto tem pernas grandes?? (s/n)>"
                ans <- getLine
                if head ans=='S' || head ans=='s' then putStr "\nO animal visto é uma Girafa!\n" 
                else putStr "\nAnimal não é conhecido\n"

ave =    do putStr "\nO animal visto voa bem?? (s/n)>"
            ans <- getLine
            if head ans=='S' || head ans=='s' then voabem
            else do putStr "\nO animal visto voa? (s/n)>"
                    ans <- getLine
                    if head ans=='N' || head ans=='n' then naovoa
                    else putStr "\nAnimal não é conhecido\n"

voabem = do putStr "\nO animal visto tem longas asas?? (s/n)>"
            ans <- getLine
            if head ans=='S' || head ans=='s' then putStr "\nO animal visto é um Albatroz!\n"
            else putStr "\nAnimal não é conhecido\n"


naovoa = do putStr "\nO animal visto tem pescoço comprido?? (s/n)>"
            ans <- getLine
            if head ans=='S' || head ans=='s' then putStr"\nO animal visto é um Avestruz!\n"
            else do putStr "\nO animal visto nada? (s/n)>"
                    ans <- getLine
                    if head ans=='S' || head ans=='s' then nada
                    else putStr "\nAnimal não é conhecido\n"

nada = do putStr "\nO animal visto é preto e branco?? (s/n)>"
          ans <- getLine
          if head ans=='S' || head ans=='s' then putStr "\nO animal visto é um Pinguim!\n" 
		  else putStr "\nAnimal não é conhecido\n"
		


