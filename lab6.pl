%for manipulating player order
next_player(b,w).
next_player(w,b).
%legal moves
move(1,2,s(X,e,X3,X4,X5,X6,X7),s(e,X,X3,X4,X5,X6,X7)):-!.
move(1,3,s(X,X2,e,X4,X5,X6,X7),s(e,X2,X,X4,X5,X6,X7)):-!.
move(3,4,s(X1,X2,X,e,X5,X6,X7),s(X1,X2,e,X,X5,X6,X7)):-!.
move(2,4,s(X1,X,X3,e,X5,X6,X7),s(X1,e,X3,X,X5,X6,X7)):-!.
move(4,5,s(X1,X2,X3,X,e,X6,X7),s(X1,X2,X3,e,X,X6,X7)):-!.
move(5,7,s(X1,X2,X3,X4,X,X6,e),s(X1,X2,X3,X4,e,X6,X)):-!.
move(6,7,s(X1,X2,X3,X4,X5,X,e),s(X1,X2,X3,X4,X5,e,X)):-!.
move(4,6,s(X1,X2,X3,X,X5,e,X7),s(X1,X2,X3,e,X5,X,X7)):-!.
move(2,6,s(X1,X,X3,X4,X5,e,X7),s(X1,e,X3,X4,X5,X,X7)):-!.
move(3,5,s(X1,X2,X,X4,e,X6,X7),s(X1,X2,e,X4,X,X6,X7)):-!.
%if it is legal to move in one configuration than it is also legal to move in the reversed one (ex. legal(1-3) <=> legal(3-1))
move(X,Y,Z1,Z2):-move(Y,X,Z2,Z1).

