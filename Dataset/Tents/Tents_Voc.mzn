int: row; 
set of int: Row = 1..row;
int: column; 
set of int: Column = 1..column;
array[Row,Column] of 0..1: Board;
array[Row] of 0..4: right;
array[Column] of 0..4: bottom;
array[Row,Column] of var 0..1: Solution;
output [ show(Solution[i,j]) ++ if j == column then "\n" else " " endif 
        |i in Row, j in Column];  
constraint forall(i in Row, j in Column where Board[i,j] == 1)(Solution[i,j] == 0);
solve satisfy;