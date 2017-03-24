function Show_Set=ShowVector(Obj_Set)
global Total_Number;
Show_Set=[];



for k=1:length(Obj_Set)
    
    Obj=Obj_Set(k);
    
    if ~isempty(find(Obj.Matrix(2:end,2:end)))
            error('ShowVector can be called only for Linear Relaxvar Expression')
    end
       
        Matrix_Padded=Padder(Obj);
    Show=[Matrix_Padded(1,1), 2*Matrix_Padded(1,2:end)];  
    Show_Set=[Show_Set;Show];
end


