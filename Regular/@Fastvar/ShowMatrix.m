function Show=ShowMatrix(Obj)

global Total_Number;

if length(Obj)~=1
    
    error('The size of Object to be shown should be 1 by 1')
    
end

Show=Padder(Obj);


