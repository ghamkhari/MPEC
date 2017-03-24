function   Degree=ShowDegree(Obj)

Degree=1;
if size(Obj,1)~=1 && size(Obj,2)~=1 
    
    error('The size of object that is passed to ShowDegree should be 1*1 ')

else
    
    [Non_Zero_Value ]=find(Obj.Matrix(2:end,2:end));
    
    for i=1:length(Non_Zero_Value)
        if abs(Non_Zero_Value(i))>10^-9
            Degree=2;
        end
    end
end

end