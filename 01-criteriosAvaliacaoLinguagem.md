#Critérios Avaliação da Linguagem de Programação

##1. Legibilidade

###* Simplicidade Global
  - diminuir maneiras de fazer a mesma coisa (operação particular)

    ```
    ex:
    cont=cont+1 / cont++ / cont+=1 -> mesma coisa
    ```
  - sobrecarga deve ser bem utilizada

    ```
    ex:
    int Quadrado(int x) { return x * x; }
    double Quadrado(double y) { return y * y; }
    ```
  - ter poucos componentes básicos
  - excesso de simplicidade -> falta estrutura

###* Ortogonalidade
  - combinar conceitos primitivos p/ chegar a novos conceitos
  - mais ortogonalidade = mais complexidade

###* Instruções de Controle
  - ao escolher próxima instrução a ser executada -> diminui legibilidade pois tira linearidade da leitura "pulando" de um trecho para outro local
  ex: go-to

###* Tipos de Dados / Estruturas definidos
  - ajudam categorização e entendimento

###* Sintaxe mais legível
  - identificadores grandes
  - usar palavras especiais (delimitadores)
  - forma semântica compatível

##2. Capacidade de Escrita

###* Simplicidade + Ortogonalidade
  - combinar poucos componentes básicos sob regras consistentes

###* Suporte p/ Abstração
  - abstrair detalhes - facilita Escrita
  - abstração de processo - ex: subprogramas
  - abstração de dados - ex: classes

###* Expressividade
  - formas convenientes de especificar

###* Sintaxe (pode reduzir legibilidade)
  - delimitadores + operadores poderosos

##3. Confiabilidade

###* Verificar Tipos
  - verificar - quanto mais cedo descobrir o erro melhor

###* Tratar Exceções
  - interceptar erros, corrigir e prosseguir

###* Evitar Aliasing
  - evitar apontamentos simultâneos na mesma posição de memória / desalocar apontamentos

###* Legibilidade + Capacidade de Escrita
  - Mais fácil de escrever = mais chance de estar correto, mais entendível, melhor manutenção

##4. Custo

###* Treinamento
  - LP simples = menos gasto com treinamento, menos experiência exigida

###* Escrita
  - LP fácil de escrever = melhor adequação, melhor entendimento

###* Compilação
  - Código otimizado leva em conta tamanho do código e velocidade de execução

###* Execução
  - Mais confiabilidade = mais lento
  - Menor confiabilidade = mais rápido

##4. Outros

###* Portabilidade
  - Facilita transferência de implementação

###* Generalidade
  - aplicável de forma ampla

###* Qualidade da Documentação
