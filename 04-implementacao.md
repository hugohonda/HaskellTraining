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
