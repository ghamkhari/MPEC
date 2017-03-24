function Obj_Sum=sum(Obj)
global Total_Number;


if isempty(Obj)
    Obj_Sum=0;
return    
end

Obj_Sum=Fastvar;
Obj_Sum.Matrix=sparse(Total_Number+1,Total_Number+1);

for k=1:length(Obj)
    Obj_Sum=Obj_Sum+Obj(k);    
end

