function  Reshaped=Reshaping(varargin)

Reshaped=[];

for i=1:nargin
   
    
    Reshaped=[Reshaped, reshape(varargin{i},1,size(varargin{i},1)*size(varargin{i},2)*size(varargin{i},3))];
    
end