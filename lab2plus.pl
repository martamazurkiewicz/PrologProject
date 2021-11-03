grandparent(X,Y):-parent(X,M),parent(M,Y).
child(X,Y):-parent(Y,X).
son(X,Y):-child(X,Y),male(X).
granddaughter(X,Y):-female(X),grandparent(Y,X).
aunt(X,Y):-female(X),grandparent(M,Y),parent(M,X),not(parent(X,Y)).
partner(X,Y):-parent(X,M),parent(Y,M),not(X=Y).