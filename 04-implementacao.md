#Implementação

##1. Compilador - gera Código de Máquina

####- Input Código Fonte
####- Analisador Léxico
  - confere identificadores - palavras reservadas (ex. "for", "while")
  - caso identificador novo -> coloca na tabela de símbolos
####- Analisador Sintático
  - confere gramática
  - caso tenha novidades -> coloca na tabela de símbolos
####- Analisador Semântico
  - recebe tabela de símbolos
  - confere "sentido" da escrita, correctude da construção
  - pode passar pela otimização do compilador
####- Gerador de Código
  - recebe código verificado, pode estar otimizado
  - recebe tabela de operandos
  - gera linguagem de máquina a partir do código

##2. Interpretador
###-Interpretação Pura:
Interpreta código fonte diretamente dando os resultados (não existe mais)

###-Interpretação Híbrida
####- Input Código Fonte
####- Analisador Léxico
  - confere identificadores - palavras reservadas
####- Analisador Sintático
  - confere gramática
####- Analisador Semântico
  - recebe tabela de símbolos
  - confere "sentido" da escrita, correctude da construção
####- Gerador de Código Intermediário
####- Interpretador
  - Realiza uma primeira compilação e em seguida será sempre interpretado
  ex: Java - javac - compilação / java - interpretação
  Java é complilado uma vez e é interpretado em outras máquinas virtuais java

##Computadores virtuais
  - Fazem a abstração de camadas inferiores
  Hardware -> Firmware -> Sistema Operacional -> Compilador / Interpretador / Máquina Virtual / Assembler
