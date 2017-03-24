function  New_Obj=mpower(Obj,Power)

if ~isnumeric (Power)    
    error('In argument^Power,  the Power should have a numerical value')   
end



if isempty(Obj)    
    New_Obj=[];
    return   
end



if length(Obj)~=1
    
    error('The size of Object in  Object^Power should be 1*1')
    
end

if  Power==2
    New_Obj=(Obj*Obj);
    return;
end

if Power==1
    New_Obj=Obj;
    return;
end

if  Power==0
    New_Obj=1;
    return;
end



if isnumeric(Obj)
    New_Obj=Fastvar(Obj^Power);
else
   error('Fast Var Object cannot have a power greater than 2')
end







