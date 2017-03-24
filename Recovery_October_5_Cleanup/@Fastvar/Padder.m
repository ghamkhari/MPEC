function Matrix_Padded=Padder(Obj)

global Total_Number;

Matrix_Padded=[Obj.Matrix, sparse(size(Obj.Matrix,1),Total_Number+1-size(Obj.Matrix,2));  sparse(Total_Number+1-size(Obj.Matrix,1),Total_Number+1)];


