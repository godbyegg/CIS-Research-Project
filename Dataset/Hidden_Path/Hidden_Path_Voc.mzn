int: row; 
set of int: Row = 1..row;
int: column; 
set of int: Column = 1..column;
array[Row,Column] of 0..8:Board;
array[Row,Column] of 0..column*row:Num;
array[Row,Column] of var 1..row*column: Solution;
output [ show(Solution[i,j]) ++ if j == column then "\n" else " " endif 
        |i in Row, j in Column];   
constraint forall(i in Row, j in Column where Num[i,j]>0)(Solution[i,j]==Num[i,j]);
constraint forall(i in Row, j in Column where Board[i,j] == 0)(Solution[i,j] == row*column);
solve satisfy;
include "alldifferent.mzn";
constraint alldifferent([Solution[i,j] |i in Row, j in Column]);