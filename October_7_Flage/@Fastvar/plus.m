
function Obj_Set=plus(Obj1,Obj2)
global Total_Number;

if length(Obj1)~=length(Obj2)
    if length(Obj1) >1 && length(Obj2) >1
        error('In summation of two objects, the operand should be of equal length or at least one of operand should be of length 1*1');
    end
end

if isempty(Obj1) || isempty(Obj2)
    Obj_Set=[];
    return;
end





if length(Obj1)==1 && length(Obj2)>1
    Obj_Set=[];
    for k=1:length(Obj2)
        Obj_Set=[Obj_Set; Obj1+Obj2(k)];
    end
    return
end

if length(Obj2)==1 && length(Obj1)>1
    Obj_Set=[];
    for k=1:length(Obj1)
        Obj_Set=[Obj_Set; Obj2+Obj1(k)];
    end
    return
end







if length(Obj1)~=1  && length(Obj1)==length(Obj2)
    Obj_Set=[];
    for k=1: length(Obj1)
        Obj_Set=[Obj_Set; Obj1(k)+Obj2(k)];
    end
    return
else
    
    if isnumeric(Obj1)  &&  ~isempty(Obj1) &&  length(Obj1)==1
        Obj1=Fastvar(Obj1);
    end
    
    
    if isnumeric(Obj2)  &&  ~isempty(Obj2) && length(Obj2)==1
        Obj2=Fastvar(Obj2);
    end
    
   
    New_Obj=Fastvar;
    Matrix1=Padder(Obj1);
    Matrix2=Padder(Obj2);
    New_Obj.Matrix=Matrix1+Matrix2;
    Obj_Set=[New_Obj];
end

end





