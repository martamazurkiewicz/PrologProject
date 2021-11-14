%for manipulating player order
next_player(b,w).
next_player(w,b).
%member predicate for checking membership of element in a list
member(X,[X|_]).
member(X,[_|T]):-member(X,T).
%legal moves
move(X,1,2,s(X,e,X3,X4,X5,X6,X7),s(e,X,X3,X4,X5,X6,X7)).
move(X,1,3,s(X,X2,e,X4,X5,X6,X7),s(e,X2,X,X4,X5,X6,X7)).

move(X,2,4,s(X1,X,X3,e,X5,X6,X7),s(X1,e,X3,X,X5,X6,X7)).
move(X,2,6,s(X1,X,X3,X4,X5,e,X7),s(X1,e,X3,X4,X5,X,X7)).

move(X,3,1,s(e,X2,X,X4,X5,X6,X7),s(X,X2,e,X4,X5,X6,X7)).
move(X,3,4,s(X1,X2,X,e,X5,X6,X7),s(X1,X2,e,X,X5,X6,X7)).
move(X,3,5,s(X1,X2,X,X4,e,X6,X7),s(X1,X2,e,X4,X,X6,X7)).

move(X,4,2,s(X1,e,X3,X,X5,X6,X7),s(X1,X,X3,e,X5,X6,X7)).
move(X,4,3,s(X1,X2,e,X,X5,X6,X7),s(X1,X2,X,e,X5,X6,X7)).
move(X,4,5,s(X1,X2,X3,X,e,X6,X7),s(X1,X2,X3,e,X,X6,X7)).
move(X,4,6,s(X1,X2,X3,X,X5,e,X7),s(X1,X2,X3,e,X5,X,X7)).

move(X,5,3,s(X1,X2,e,X4,X,X6,X7),s(X1,X2,X,X4,e,X6,X7)).
move(X,5,4,s(X1,X2,X3,e,X,X6,X7),s(X1,X2,X3,X,e,X6,X7)).
move(X,5,7,s(X1,X2,X3,X4,X,X6,e),s(X1,X2,X3,X4,e,X6,X)).

move(X,6,2,s(X1,e,X3,X4,X5,X,X7),s(X1,X,X3,X4,X5,e,X7)).
move(X,6,4,s(X1,X2,X3,e,X5,X,X7),s(X1,X2,X3,X,X5,e,X7)).
move(X,6,7,s(X1,X2,X3,X4,X5,X,e),s(X1,X2,X3,X4,X5,e,X)).

%init
play(Player,StartPosition,EndGamePosition,States):-play(Player,StartPosition,EndGamePosition,[],States).
%game over condition
play(_,EndGamePosition,EndGamePosition,_,[]):-!.
%game playing conditions
%player denotes the player making a move (either black or white)
%StartPosition denotes for every move the current board state
%EndGamePosition denotes the desired outcome position
%States is a list of all board states

play(Player, StartPosition, EndGamePosition, States, [StartPosition|NextPositions]):-
    move(Player,_,_,StartPosition,EP),
    next_player(Player, NextPlayer),
    not(member(EP,States)),
    play(NextPlayer, EP, EndGamePosition, [EP|States], NextPositions).