function  Obj_Set=power(Obj,Power)


if ~isnumeric (Power)
    
    error('In argument^Power,  the Power should have a numerical value')
    
end

if isempty(Obj)    
    Obj_Set=Obj;
    return   
end


Obj_Set=[];



for k=1:length(Obj)
    
    Obj_Set=[Obj_Set; Obj(k)^Power];
    
end













