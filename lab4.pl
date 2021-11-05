member1(Head,[Head|_]).
member1(Head,[_|Tail]) :- member1(Head,Tail).
concat1([],L2,L2).
concat1([Head|Tail],X,[Head|Y]) :- concat1(Tail,X,Y). 
delete1(Head,[Head|Tail],Tail).
delete1(X,[Y|Tail],[Y|L1]):-delete1(X,Tail,L1).

len1([],zero).
len1([_|Tail],s(X)):-len1(Tail,X).

sum1([],0).
sum1([Head|Tail],N):-sum1(Tail,Q),N is Q+Head.

lenNum([],0).
lenNum([_|Tail],X):-lenNum(Tail,Q),X is Q+1.
avg1(L1,N):-sum1(L1,Sum),lenNum(L1,Len),N is Sum//Len.

count1(_,[],0).
count1(X,[X|Tail],N):-count1(X,Tail,Q),N is Q+1.
count1(X,[Head|Tail],N):-not(X=Head),count1(X,Tail,N).