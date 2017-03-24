function String_Set=Which_Variable(Table,Location_Set)


String_Set=cell(length(Location_Set),1);

for j=1:length(Location_Set)
for i=1:length(Table)
    
    if ShowPosition(Table(i))==Location_Set(j)
        
        String_Set{j,1}= Table(i).String;
        
    end


end

end