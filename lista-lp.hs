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

-- Caso a potência X seja zero (x==0), temos o resultado um, já quebraEmBarra 2^0 = 1
-- Caso contrário, no casamento com um valor não nulo (x/=0), multiplica-se por 2 a chamada recursiva da mesmo função
-- com novo parâmtro do antecessor do valor (x--) e assim sucessivamente até que volte a "cair" na condição de valor nulo (x==0)
-- "quebrando" a função e finalizando a recursividade

doisElevadoA x | x==0 = 1 | otherwise = 2*doisElevadoA(x-1)

-- 5. Escreva uma função que calcule o dobro da soma dos elementos de uma lista - Hugo

-- Primeiramente testa-se o tamanho da lista, caso seja uma lista vazia, o dobro da soma de seus elementos será 0 por convenção
-- Caso contrário (a lista tenha um elemento ou mais), é utilizada a função foldl1 com o operador
-- (+) para somar os elementos da lista e este total é multiplicado por dois

dobroDaSomaLista ls | (length ls) == 0 = 0 | otherwise = 2*(foldl1(+)ls)

-------------------------------------------------------------
-- Parte 2 - 3 questões

-- 10. Escreva uma função que retorne o número de vezes que um dado elemento aparece numa lista - Hugo

-- Inicialmente é feita a verificação se a lista é vazia, resultando em 0 caso esta seja
-- Se há casamento com uma lista não vazia:
-- testa-se se o valor procurado é igual à cabeça da lista. Caso seja, adiciona-se 1 (na contagem) ao processo recursivo
-- da função com novo parâmetro cauda da lista (ls). O valor procurado é mantido constante na recursividade.
-- Caso não haja igualdade, é chamada a função recursiva da mesma forma, todavia sem a adição de 1 (na contagem)
-- e assim sucessivamente até que volte a "cair" na condição de lista vazia (a cauda será vazia quando atingir-se o último elemento da lista)
-- "quebrando" a função e finalizando a recursividade

vezesNaLista x [] = 0
vezesNaLista x (l:ls) | x==l = 1 + vezesNaLista x ls | otherwise = vezesNaLista x ls

--11. Escreva uma função que receba uma lista e retorne o número de elementos que estão acima da média dos valores da lista - Éden
acimaMedia (x:xs) = length [y | y <- (x:xs), y > sum (x:xs) `div` length (x:xs)]

-- 13. Escreva uma função que receba uma lista e retorne a posição de um dado
-- elemento nessa lista, iniciando de 0. Verifica primeiramente se a lista não é nula.
-- Caso sim, retorna 0. Caso não, cai no segundo guard que verifica se o elemento
-- pertence a lista tirando o primeiro elemento. Se sim, chama recursivamente 1 + (a lista sem
-- o primeiro elemento) e o caractere procurado. Caso não pertença, cairá no
-- guard mais geral que retornará 0. - Éden

indexOf (x:xs) a  | null (x:xs) = 0
                  | a `elem` xs = 1 + indexOf xs a
                  | otherwise = 0

-- 14. Escreva uma função que receba uma lista de números e retorne uma tupla com uma lista dos números pares e uma lista dos números ímpares - Hugo

-- Inicialmente testa-se se o comprimento da lista é menor que 1, isto resulta em uma lista vazia
-- Caso contrário, utiliza-se a função filter para filtrar valores pares (função even) e valores ímpares (função odd) e realiza-se o agrupamento
-- em tuplas por meio da função zip

parEImpar ls | (length ls)<1 = [] | otherwise = zip [filter even ls] [filter odd ls]

-------------------------------------------------------------
-- Parte 3 - 3 questões

-- 17. Palindrome é uma seqüência de caracteres igual se lida da esquerda para a direita ou ao contrário. As seqüências - Hugo
-- %&*+--+*&%, abcdefedcba, 0110 e 0112110 são palíndromes. Escreva uma função que verifique se uma string é
-- uma palindrome. A análise deve ser caracter a caracter, sem reversão da string e verificação de igualdade entre elas.

-- Inicialmente verifica-se o tamanho da lista, caso ela tenha tamanho menor ou igual a 1, naturalmente ela será um palíndrome,
-- considerando que listas vazias podem ser "lidas" em qualquer direção tendo o mesmo valor semântico.
-- Caso o tamanho seja maior que 1, é feita a verificação se a cabeça da lista se iguala ao último elemento da cauda desta. Caso isto
-- ocorra, retira-se o último elemento da lista analisada por meio da função drop e do index do último elemento obtido por meio
-- de lenght (comprimento) da cauda menos 1.
-- Caso contrário, retorna-se falso pois a lista não será palíndrome

checaPalindrome (l:ls) | (length ls) <= 1 = True | l==(last ls) = checaPalindrome (drop ((length ls) - 1) ls) | otherwise = False

-- 18. Escreva uma função que quebre uma string em duas partes no ponto onde estiver uma “/” e retorne uma tupla com as duas partes.
-- quebraEmBarra [] [] = []
-- quebraEmBarra (l:ls) []
--  | l == '/' = quebraEmBarra ls []
--  | otherwise = quebraEmBarra ls [l]
-- quebraEmBarra (l:ls) x
--  | l == '/' = quebraEmBarra ls []
--  | otherwise = quebraEmBarra ls (x++[l])

-- 20. Estenda a função map f xs (retorna a lista dos valores de f aplicada à lista xs) para map3 f xs ys zs (retorna a lista dos resultados de f aplicada às triplas (x,y,z) onde x   xs, y   ys e z   zs).
-- map3 f xs ys zs =[f x y z | (x,y,z) <- zip3 xs ys zs]

-- 21. Implemente um avaliador de expressões PRÉ-FIXADAS que receba uma string contendo a expressão na forma pré-fixada e retorne o seu valor.
-- As operações que ele deve reconhecer são: soma, subtração, divisão e multiplicação de números inteiros. -- Éden

-- Transforma a lista em uma tupla (char, [char], [char]) e verifica os padrões de acordo com o case.
-- Exemplo:
-- ('+', a, b) -> a + b. Como a e b são [char] então é feito a conversão com o read e retirando-se a ambiguidade com :: Integer.

validar xs = case (transformaTupla xs) of ('+', a, b) -> read a + read b :: Integer
                                          ('-', a, b) -> read a - read b :: Integer
                                          ('/', a, b) -> read a `quot` read b :: Integer
                                          ('*', a, b) -> read a * read b :: Integer

-- Recebe uma lista de char e transforma numa tupla (a,b,c). Onde a é o primeiro elemento da lista.
-- b é uma string até o aparecimento de ' '. E c é uma string até o aparecimento de ' '
-- retirando o tamanho da string b + 3 (1 caractere, espaço, espaço final de a)

transformaTupla :: String -> (Char, [Char], [Char])
transformaTupla xs = (a,b,c) where a = head xs; b = proximoNumero (drop 2 xs); c = drop (length b+3) xs

-- Recebe uma lista de char e a percorre até encontrar o primeiro elemento que seja ' '.
-- Retorna a lista até aquele elemento

proximoNumero :: [Char] -> [Char]
proximoNumero (x:xs)  | x/=' ' = x:proximoNumero xs
                      | otherwise = []

-------------------------------------------------------------
-- Parte 4 - Todas

-- 22. Crie uma nova função que utilize a expressão where - Hugo

-- A soma de dois bits pode ser realizada apenas com bits 1 e 0, o que é checado na primeira etapa
-- caso soma dos bits seja < 1, a saída será 0, caso seja = 1, a saída será 1, caso a soma seja de dois bits 1, haverá overflow
-- where soma = x + y, sendo x o primeiro bit e y o segundo

somaDoisBits x y | x/=0&&x/=1||y/=0&&y/=1 = "Parametros devem ser apenas 0 ou 1"
somaDoisBits x y | soma < 1 = "0" | soma == 1 = "1" | soma > 1 = "overflow" where soma = x + y

-- 23. Crie uma nova função que utilize a expressão let - Hugo

-- Testa-se determinando o ano atual como 2016, let anoAtual=2016
-- quanto tempo tem um determinado ano do passado

quantosAnosTem ano = let anoAtual=2016 in anoAtual-ano

-- 24. Crie uma nova função que utilize uma função lambda e a função map - Hugo

-- A função lambda de potenciação individual de itens de uma lista, recebe a lista ls e uma potência x
-- e há um mapeamento com map em que cada elemento da lista será elevado individualmente a x

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
