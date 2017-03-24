function  Resizer(varargin)

Obj_Set=[];
for i=1:nargin
    Obj_Vector=varargin{i};
    for j=1:length(Obj_Vector)
    Obj_Set=[Obj_Set;Obj_Vector(j)];
    end
end
    
    
global Total_Number

for i=1:size(Obj_Set,1)
    for j=1:size(Obj_Set,2)
        Obj_Set(i,j).Matrix=[Obj_Set(i,j).Matrix, zeros(size(Obj_Set(i,j).Matrix,1),Total_Number+1-size(Obj_Set(i,j).Matrix,2));zeros(Total_Number+1-size(Obj_Set(i,j).Matrix,1),Total_Number+1)];
    end
end


