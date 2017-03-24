function Compressed=ShowCompressMatrix(Obj_Set,Scaling)

global Total_Number;

Chunk=1000;

Compressed=[];

if strcmp(Scaling,'Regular')
    
    
    Counter=1;
    while Counter*Chunk <= length(Obj_Set)
        
        Small=[];
        for i=(Counter-1)*Chunk+1:1:Counter*Chunk
            Small=[Small, reshape((ShowMatrix(Obj_Set(i))),(Total_Number+1)^2,1)];
        end
        Compressed=[Compressed, Small];
        Counter=Counter+1;
    end
    
    
    Small=[];
    for i=(Counter-1)*Chunk+1:1:length(Obj_Set)
        Small=[Small, reshape((ShowMatrix(Obj_Set(i))),(Total_Number+1)^2,1)];
    end
    
    Compressed=[Compressed, Small];
    
    
    
end








if strcmp(Scaling,'Normalized')
    
    
        Counter=1;
    while Counter*Chunk <= length(Obj_Set)
        Small=[];
        for i=(Counter-1)*Chunk+1:1:Counter*Chunk
            Small=[Small, reshape((ShowMatrix(Obj_Set(i))/(max(1,norm(ShowMatrix(Obj_Set(i)),'fro')))),(Total_Number+1)^2,1)];
        end
        Compressed=[Compressed, Small];
        Counter=Counter+1;
    end
    
    Small=[];
    for i=(Counter-1)*Chunk+1:1:length(Obj_Set)
        Small=[Small, reshape((ShowMatrix(Obj_Set(i))/(max(1,norm(ShowMatrix(Obj_Set(i)),'fro')))),(Total_Number+1)^2,1)];
    end
    
    Compressed=[Compressed, Small];
     
        
end


end