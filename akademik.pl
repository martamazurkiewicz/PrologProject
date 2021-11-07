above(X,Y,order(X,_,Y,_,_,_)).
above(X,Y,order(X,_,_,_,Y,_)).
above(X,Y,order(_,X,_,Y,_,_)).
above(X,Y,order(_,X,_,_,_,Y)).
above(X,Y,order(_,_,X,_,Y,_)).
above(X,Y,order(_,_,_,X,_,Y)).
floorAbove(X,Y,order(X,_,Y,_,_,_)).
floorAbove(X,Y,order(X,_,_,Y,_,_)).
floorAbove(X,Y,order(X,_,_,_,Y,_)).
floorAbove(X,Y,order(X,_,_,_,_,Y)).
floorAbove(X,Y,order(_,X,Y,_,_,_)).
floorAbove(X,Y,order(_,X,_,Y,_,_)).
floorAbove(X,Y,order(_,X,_,_,Y,_)).
floorAbove(X,Y,order(_,X,_,_,_,Y)).
floorAbove(X,Y,order(_,_,X,_,Y,_)).
floorAbove(X,Y,order(_,_,X,_,_,Y)).
floorAbove(X,Y,order(_,_,_,X,Y,_)).
floorAbove(X,Y,order(_,_,_,X,_,Y)).
below(X,Y,order(Y,_,X,_,_,_)).
below(X,Y,order(Y,_,_,_,X,_)).
below(X,Y,order(_,Y,_,X,_,_)).
below(X,Y,order(_,Y,_,_,_,X)).
below(X,Y,order(_,_,Y,_,X,_)).
below(X,Y,order(_,_,_,Y,_,X)).
floorBelow(Y,X,order(X,_,Y,_,_,_)).
floorBelow(Y,X,order(X,_,_,Y,_,_)).
floorBelow(Y,X,order(X,_,_,_,Y,_)).
floorBelow(Y,X,order(X,_,_,_,_,Y)).
floorBelow(Y,X,order(_,X,Y,_,_,_)).
floorBelow(Y,X,order(_,X,_,Y,_,_)).
floorBelow(Y,X,order(_,X,_,_,Y,_)).
floorBelow(Y,X,order(_,X,_,_,_,Y)).
floorBelow(Y,X,order(_,_,X,_,Y,_)).
floorBelow(Y,X,order(_,_,X,_,_,Y)).
floorBelow(Y,X,order(_,_,_,X,Y,_)).
floorBelow(Y,X,order(_,_,_,X,_,Y)).
nextTo(X,Y,order(X,Y,_,_,_,_)).
nextTo(X,Y,order(_,_,X,Y,_,_)).
nextTo(X,Y,order(_,_,_,_,X,Y)).
nextTo(Y,X,order(X,Y,_,_,_,_)).
nextTo(Y,X,order(_,_,X,Y,_,_)).
nextTo(Y,X,order(_,_,_,_,X,Y)).
groundF(X,order(_,_,_,_,X,_)).
groundF(X,order(_,_,_,_,_,X)).
secondF(X,order(X,_,_,_,_,_)).
secondF(X,order(_,X,_,_,_,_)).
left(X,Y,order(X,Y,_,_,_,_)).
left(X,Y,order(_,_,X,Y,_,_)).
left(X,Y,order(_,_,_,_,X,Y)).
between(X,Y,Z,order(X,_,Y,_,Z,_)).
between(X,Y,Z,order(Z,_,Y,_,X,_)).
between(X,Y,Z,order(_,X,_,Y,_,Z)).
between(X,Y,Z,order(_,Z,_,Y,_,X)).

clue1(S):-above(student(stanislaw,_,_),student(_,_,czat),S).
clue2(S):-below(student(_,rano,_),student(_,_,naczynia),S).
clue3(S):-nextTo(student(miroslaw,_,_),student(_,czasWolny,_),S).
clue4(S):-nextTo(student(_,_,lekcje),student(ania,_,_),S).

clue5(S):-between(student(ania,_,_),student(_,zajecia,_),student(adam,_,_),S).
clue6(S):-secondF(student(_,noc,_),S).
clue7(S):-groundF(student(adrian,_,_),S).

clue8(S):-floorAbove(student(ola,_,_),student(_,_,warzywa),S).
clue9(S):-floorBelow(student(_,_,zdjecia),student(_,_,czat),S).
clue10(S):-nextTo(student(_,wieczor,_),student(adam,_,_),S).

clue11(S):-nextTo(student(_,rano,warzywa),student(_,_,_),S).
clue12(S):-nextTo(student(_,poludnie,naczynia),student(_,_,_),S).
clue13(S):-nextTo(student(miroslaw,_,_),student(_,_,czat),S).

clue14(S):-nextTo(student(_,czasWolny,czat),student(_,_,_),S).
clue15(S):-left(student(ola,_,_),student(_,_,gra),S).

odpowiedz1(S):-clue1(S),clue2(S),clue3(S),clue4(S),
    clue5(S),clue6(S),clue7(S),clue8(S),
    clue9(S),clue10(S),clue11(S),clue12(S),
    clue13(S),clue14(S),clue15(S),!.

odpowiedz2(Kto,Kiedy):-odpowiedz1(order(student(Kto,Kiedy,gra),_,_,_,_,_)),!.
odpowiedz2(Kto,Kiedy):-odpowiedz1(order(_,student(Kto,Kiedy,gra),_,_,_,_)),!.
odpowiedz2(Kto,Kiedy):-odpowiedz1(order(_,_,student(Kto,Kiedy,gra),_,_,_)),!.
odpowiedz2(Kto,Kiedy):-odpowiedz1(order(_,_,_,student(Kto,Kiedy,gra),_,_)),!.
odpowiedz2(Kto,Kiedy):-odpowiedz1(order(_,_,_,_,student(Kto,Kiedy,gra),_)),!.
odpowiedz2(Kto,Kiedy):-odpowiedz1(order(_,_,_,_,_,student(Kto,Kiedy,gra))),!.

odpowiedz3(S3,S4,S5):-odpowiedz1(order(_,_,S3,S4,S5,_)).