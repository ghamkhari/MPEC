function Show_Set=ShowPosition(Obj_Set)


Show_Set=zeros(size(Obj_Set,1),size(Obj_Set,2),size(Obj_Set,3));

for i=1:size(Obj_Set,1)
    
for j=1:size(Obj_Set,2)
    
for z=1:size(Obj_Set,3)
    
    
    Obj=Obj_Set(i,j,z);
    
    if ~isempty(find(Obj.Matrix(2:end,2:end)))
        error('Show Position can be called only for Original Fastvar variables, not the Degree 2 Expressions')
    end
    
    if length((find(Obj.Matrix)))>2
        
        error('Show Position can be called only for Original Fastvar variables, not a Linear Combination of them')
        
    else
        Show=find(Obj.Matrix(1,:));  
    end
    
    Show_Set(i,j,z)=Show;
end
    
end

end

