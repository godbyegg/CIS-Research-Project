include "alldifferent.mzn"; 
int: row; 
set of int: Row = 1..row;
int: column; 
set of int: Column = 1..column;
int: n;
int: c;
array[Row,Column] of 0..n: Board;
array[Row,Column] of 1..c: Region; 
array[Row,Column] of var 1..n: Solution; 
output [ show(Solution[i,j]) ++ if j == column then "\n" else " " endif 
        |i in Row, j in Column];  
constraint forall(i in Row,j in Column where Board[i,j] != 0)(Solution[i,j]==Board[i,j]);
solve satisfy;
