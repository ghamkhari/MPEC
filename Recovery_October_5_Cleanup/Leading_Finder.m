function Leadings=Leading_Finder(Matrix)

A=rref(Matrix);
Leadings=[];
Position=1;
for i=1:size(A,1)
    
    if A(Position,i)==1
        Leadings=[Leadings;i];
        Position=Position+1;
    end
    
end