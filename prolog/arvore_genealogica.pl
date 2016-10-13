feminino(ana).
feminino(maria).
feminino(carla).
feminino(sara).

feminino(carolina).
feminino(julia).
feminino(mariana).
feminino(geovana).

masculino(joao).
masculino(pedro).
masculino(carlos).
masculino(daniel).
masculino(andre).
masculino(bruno).
masculino(mateus).
masculino(gabriel).

masculino(victor).
masculino(tiago).
masculino(paulo).
masculino(lucas).

progenitor(andre,daniel).
progenitor(sara,daniel).
progenitor(daniel,pedro).

progenitor(daniel,carlos).
progenitor(daniel,ana).

progenitor(maria,pedro).
progenitor(maria,carlos).
progenitor(maria,ana).

progenitor(carla,maria).
progenitor(carla,joao).

progenitor(pedro,bruno).
progenitor(jose,mateus).
progenitor(jose,gabriel).

progenitor(victor,tiago).
progenitor(carolina,tiago).

progenitor(victor,julia).
progenitor(carolina,julia).

progenitor(tiago,paulo).
progenitor(julia,lucas).
progenitor(julia,mariana).

% ?- progenitor(X,pedro).

pai(X,Y) :- masculino(X),progenitor(X,Y).
mae(X,Y) :- feminino(X),progenitor(X,Y).

% ?- pai(X,carlos).
% ?- mae(X,carlos).

filho(X,Y) :- masculino(X),progenitor(Y,X).
filha(X,Y) :- feminino(X),progenitor(Y,X).
filhos(X,Y) :- progenitor(Y,X).

% ?- filho(daniel,X).
% ?- filha(X,daniel).
% ?- filhos(X,victor).

irmao(X,Y) :-  masculino(X),mae(Z,X),mae(Z,Y),pai(K,X),pai(K,Y), X \= Y.
irma(X,Y) :- feminino(X),mae(Z,X),mae(Z,Y),pai(K,X),pai(K,Y), X \= Y.
irmaos(X,Y) :- mae(Z,X),mae(Z,Y),pai(K,X),pai(K,Y), X \= Y.

% ?- irmao(X,pedro).
% ?- irma(X,pedro).
% ?- irmaos(X,pedro).

tio(X,Y) :- masculino(X),irmao(X,Z),progenitor(Z,Y).
tia(X,Y) :- feminino(X),irma(X,Z),progenitor(Z,Y).

% ?- tio(X,lucas).
% ?- tia(X,paulo).

primo(X,Y) :- masculino(X),tio(Z,X),progenitor(Z,Y).
prima(X,Y) :- feminino(X),tio(Z,X),progenitor(Z,Y).

% ?- primo(X,lucas).
% ?- prima(X,lucas).

avoMasc(X,Y) :- masculino(X),progenitor(X,Z),progenitor(Z,Y).
avoFemi(X,Y) :- feminino(X),progenitor(X,Z),progenitor(Z,Y).

% ?- avoMasc(X,mariana).
% ?- avoFemi(X,mariana).

neto(X,Y) :- masculino(X),progenitor(Y,Z),progenitor(Z,X).
neta(X,Y) :- feminino(X),progenitor(Y,Z),progenitor(Z,X).

% ?- neto(X,victor).
% ?- neta(X,victor).

antepassado(X,Y) :- progenitor(X,Y).
antepassado(X,Y) :- progenitor(X,Z),antepassado(Z,Y).

% ?- antepassado(X,mariana).

descendente(X,Y):-progenitor(Y,X).
descendente(X,Y):-progenitor(Z,X),descendente(Z,Y).

% ?- antepassado(X,mariana).
