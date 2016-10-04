#Prolog / SWI-Prolog

- Linguagem Declarativa
- SWI-Prolog - interpretador
- Base: declaração de axiomas e regras
- Estrutura: Base de Conhecimentos; Memória de Trabalho; Máquina de Inferência
- Ciclo: definir relações -> formular perguntas sobre elas

####Exemplo - Árvore Genealógica Stark
Fatos:
```
genitor(Eddard,Arya)
genitor(Eddard,Robb)
genitor(Eddard,JonSnow)

genitor(Catelyn,Arya)
genitor(Catelyn,Robb)
```
Perguntas (queries):
- Eddard Stark
```
?-genitor(Eddard,Arya).
    true
?-genitor(Eddard,JonSnow).
    true
?-genitor(Eddard,X).
    X = Arya;
    X = Robb;
    X = JonSnow
```
- Catelyn Stark
```
?-genitor(Catelyn,Robb).
    true
?-genitor(Eddard,JonSnow).
    false
?-genitor(Eddard,X).
    X = Arya;
    X = Robb
```
- Genericamente
```
?-genitor(X,Y).
    X = Eddard,
    Y = Arya;
    X = Eddard,
    Y = Robb;
    (...)
```
- Duas queries simultaneamente com AND
```
?-genitor(X,Arya),genitor(X,JonSnow).
    X = Eddard
```
