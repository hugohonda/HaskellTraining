#Influências no Projeto da Linguagem de Programação

##1. Arquitetura do Computador
  Linguagens Imperativas são motivadas pela arquitetura Von Neumman. Componentes:
```
CPU (ALU, Controle, Registradores, Program Counter)
    /         \
   /           \  
  V             V
Memória       Periféricos (Input/Output)
```
  - Processo: FETCH -> DECODE -> EXECUTE
  - Processo Sequencial - Instruções armazenadas em sequencia na memória = mais velocidade
  - Gargalo de Von Neumman: transferência lenta de dados entre componentes -> redução com CACHE, pipelining, acesso direto, buffers, blocos

##2. Métodos de Programação
  Maximar Produtividade e Manutenabilidade
