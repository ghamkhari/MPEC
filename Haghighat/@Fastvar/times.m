function Obj_Set=times(Obj1,Obj2)

if size(Obj1)~=size(Obj2)   
    if length(Obj1) >1 && length(Obj2) >1       
        error('In multiplication of two objects, the operand should be of equal length or at least one of operand should be of length 1*1');
    end    
end

if isempty(Obj1)  || isempty(Obj2)
    
    Obj_Set=zeros(0,max(size(Obj1,2),size(Obj2,2)));
    return;
end




if length(Obj1)==1 && length(Obj2)>1   
    Obj_Set(size(Obj2,1),size(Obj2,2))=Fastvar;
    for k=1:length(Obj2)
        Obj_Set(k)=Obj1*Obj2(k);
    end  
    return
end

if length(Obj2)==1 && length(Obj1)>1   
    Obj_Set(size(Obj1,1),size(Obj1,2))=Fastvar;
    for k=1:length(Obj1)
        Obj_Set(k)=Obj2*Obj1(k);
    end    
    return
end





if length(Obj1)~=length(Obj2)
    error('The length of first and second arguments in .* multiplication should be the same')
else
    Obj_Set(size(Obj1,1),size(Obj1,2))=Fastvar;
    
    for k=1:length(Obj1)
        
        Obj_Set(k)=Obj1(k)*Obj2(k);
    end
end

