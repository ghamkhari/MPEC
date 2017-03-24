function New_Obj=uminus(Obj)

global Total_Number;

if isempty(Obj)
    New_Obj=Obj; return
end

if isnumeric(Obj)
    New_Obj=-Obj;
       return;
end


New_Obj(size(Obj,1),size(Obj,2))=Fastvar;

for i=1:size(Obj,1)
for j=1:size(Obj,2)
   Matrix_Padded=Padder(Obj(i,j));
   New_Obj(i,j).Matrix=-Matrix_Padded;
end
end
