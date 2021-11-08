member1(Head,[Head|_]).
member1(Head,[_|Tail]) :- member1(Head,Tail).
concat1([],L2,L2).
concat1([Head|Tail],X,[Head|Y]) :- concat1(Tail,X,Y). 
delete1(Head,[Head|Tail],Tail).
delete1(X,[Y|Tail],[Y|L1]):-delete1(X,Tail,L1).

len1(X,L):-len1(X,0,L).
len1([],L,L).
len1([_|X],T,L):-T1 is T+1,len1(X,T1,L).

reverse1([],[]).
reverse1([Head|Tail],L2):-reverse1(Tail,L1),concat1(L1,[Head],L2).

reverse2([Head|Tail],Accumulator,L3):-reverse2(Tail,[Head|Accumulator],L3).
reverse2([],Accumulator,Accumulator).

sum1([],0).
sum1([Head|Tail],N):-sum1(Tail,Q),N is Q+Head.

lenNum([],0).
lenNum([_|Tail],X):-lenNum(Tail,Q),X is Q+1.
avg1([],0):-!.
avg1(L1,N):-sum1(L1,Sum),lenNum(L1,Len),N is Sum//Len.

count1(_,[],0).
count1(X,[X|Tail],N):-count1(X,Tail,Q),N is Q+1.
count1(X,[Head|Tail],N):-not(X=Head),count1(X,Tail,N).

double1([],[]).
double1([Head|L1Tail],[Head|[Head|L2Tail]]):-double1(L1Tail,L2Tail).

rlen([Head|Tail],X):-rlen(Head,R),rlen(Tail,Q),X is Q+R,!.
rlen([],0):-!.
rlen(_,1):-!.

glue(What,ListIn,[What|ListIn],1):-!.
glue(What, ListIn, ListOut, N):-
    Q is N-1, 
    concat1([What], ListIn, ListInAppended),
    glue(What,ListInAppended,ListOut,Q).
	
repeat([],[],_):-!.
repeat([HeadToRep|TailToRep],ListOut,N):-
	glue(HeadToRep,[],ListAppended,N),
    concat1(ListAppended,ListIn,ListOut),
    repeat(TailToRep,ListIn,N).
	
sort1([]).
sort1([_]):-!.
sort1([Head,HeadOfTail|Tail]):-
    Head=<HeadOfTail,
    sort1([HeadOfTail|Tail]).

permutation([],[]).
permutation([Head|Tail],ListOut):-
    permutation(Tail,LTmp),
    delete1(Head,ListOut,LTmp).

naivesort(ListIn,ListOut):-
    permutation(ListIn,ListOut),
    sort1(ListOut),!.
