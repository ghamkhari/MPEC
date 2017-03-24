function   New_Obj=ctranspose(Obj)

New_Obj(size(Obj,2),size(Obj,1))=Fastvar;


for i=1:size(Obj,1)
    for j=1:size(Obj,2)
        New_Obj(j,i)=Obj(i,j);
    end
end