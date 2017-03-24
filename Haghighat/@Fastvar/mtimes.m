%%%%%%%%%%%%%%%%%%%%%  Begin of  mtimes function
function Obj_Set=mtimes(Obj1,Obj2)
%tic;
global Total_Number


if size(Obj1,2)~=size(Obj2,1) 
    if size(Obj1,1)==1 && size(Obj1,2)==1 && ~isempty(Obj2)
        Obj_Set(size(Obj2,1),size(Obj2,2))=Fastvar;
       for i=1:size(Obj2,1)
           for j=1:size(Obj2,2)
              Obj_Set(i,j)=Obj1*Obj2(i,j);  
           end
       end
       return;
    end
    if size(Obj2,1)==1 && size(Obj2,2)==1 && ~isempty(Obj1)
        Obj_Set(size(Obj1,1),size(Obj1,2))=Fastvar;
       for i=1:size(Obj1,1)
           for j=1:size(Obj1,2)
              Obj_Set(i,j)=Obj2*Obj1(i,j);  
           end
       end
       return;
    end
        error('In Product of two matrices A * B, the number of columns in A should be the same as the number of Rows in B ');
end



if isempty(Obj1) || isempty(Obj2)
    if size(Obj1,2)==0
        error('In empty product of matrices A* B, the number of columns in A should not be zero')
    end
    if size(Obj1,1)==0
        Obj_Set=zeros(0,size(Obj2,2));
        return
    end
    if size(Obj2,2)==0
        Obj_Set=zeros(size(Obj1,1),0);
        return
    end
end


if size(Obj1,1)==1 && size(Obj2,2)==1  && size(Obj1,2) >1
    Obj_Set=Fastvar;
    Obj_Set.Matrix=sparse(Total_Number+1,Total_Number+1);
    for k=1:size(Obj1,2)
        Obj_Set=Obj_Set+Obj1(1,k)*Obj2(k,1);
    end  
    return
end

if size(Obj1,1)>1  || size(Obj2,2)>1
    Obj_Set(size(Obj1,1),size(Obj2,2))=Fastvar;
    for i=1:size(Obj1,1)
        for j=1:size(Obj2,2)
        Obj_Set(i,j)=Obj1(i,:)*Obj2(:,j);
        end
    end    
    return
end


% if isnumeric(Obj1) && isnumeric(Obj2) && ~isempty(Obj2) && ~isempty(Obj1) 
%     Obj_Set=Fastvar;
%     Obj_Set.Matrix(1,1)=Obj1*Obj2;
%     return
% end

if isnumeric(Obj1) && ~isempty(Obj1)
    Obj_Set=Fastvar;
    Obj_Set.Matrix=Obj1*Obj2.Matrix;
    return
else
    x=Padder(Obj1);
end

if isnumeric(Obj2) && ~isempty(Obj2)
    Obj_Set=Fastvar;
    Obj_Set.Matrix=Obj2*Obj1.Matrix;
    return
else
    y=Padder(Obj2);
end




  
  
Just_One=sparse(size(x,1),size(x,2));
Just_One(1,1)=1;

x_Except_One=[0,x(1,2:end);x(2:end,1), x(2:end,2:end)];
y_Except_One=[0,y(1,2:end);y(2:end,1), y(2:end,2:end)];

Obj_Set=Fastvar;
Obj_Set.Matrix=2*(x*y+y*x) - (x(1,1)*y+y(1,1)*x)  -2*trace(x_Except_One*y_Except_One)*Just_One;

Obj_Set.Matrix(1,1)=x(1,1)*y(1,1);


%Above the Above foruma:
%%%  Assume that the size of matrices, are all (Total_Number+1). We define
%%%  the matrix I to be a (Total_Number+1)*(Total_Number+1) matrix such
%%%  that   I(1,1)=1 and I has zero values at any other elements, i.e. I(i,j)=0 if i~=1 || j~= 1.
%%Then, any the above formula gives the product of any two expressions.
% However, However, the product of two two numerical value does not give the right answer if we set : 
%numerical_value_1= Value_1 *I   and numerical_value_2=Value_2 * I. 