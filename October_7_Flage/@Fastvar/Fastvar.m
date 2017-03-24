classdef   Fastvar  < handle
    
    
    properties
        Matrix=[];
        String=[];
    end
    
    
    methods
        
        function  Obj=Fastvar(varargin)
                        
            
            global Total_Number
            
            if nargin==1
                Obj(size(varargin{1},1),size(varargin{1},2),size(varargin{1},3))=Fastvar;
                for i=1:size(varargin{1},1)
                    for j=1:size(varargin{1},2)
                        for z=1:size(varargin{1},3)
                         Obj(i,j,z).Matrix=sparse(Total_Number+1,Total_Number+1);
                         Obj(i,j,z).Matrix(1,1)=varargin{1}(i,j,z);
                        end
                    end
                end
            end
            
            if nargin==2
                m=varargin{1};
                Obj(m,1)=Fastvar;
                for i=1:m
                    Total_Number=Total_Number+1;
                    Obj(i).Matrix=sparse(Total_Number+1,Total_Number+1);
                    Obj(i).Matrix(Total_Number+1,1)=.5;
                    Obj(i).Matrix(1,Total_Number+1)=.5;
                end
            end
            
            if nargin==3
                m=varargin{1};
                n=varargin{2};
                
                if m==0 || n==0
                    Obj=Fastvar.empty;
                    return
                end
                
                Obj(m,n)=Fastvar;
                for i=1:m
                    for j=1:n
                        Total_Number=Total_Number+1;
                        Obj(i,j).Matrix=sparse(Total_Number+1,Total_Number+1);
                        Obj(i,j).Matrix(Total_Number+1,1)=.5;
                        Obj(i,j).Matrix(1,Total_Number+1)=.5;
                    end
                end
            end
            
            
            if nargin==4
                m=varargin{1};
                n=varargin{2};
                p=varargin{3};
                
                if m==0 || n==0 || p==0
                    Obj=Fastvar.empty;
                    return
                end
                
                Obj(m,n,p)=Fastvar;
                for i=1:m
                    for j=1:n
                        for z=1:p
                         Total_Number=Total_Number+1;
                         Obj(i,j,z).Matrix=sparse(Total_Number+1,Total_Number+1);
                         Obj(i,j,z).Matrix(Total_Number+1,1)=.5;
                         Obj(i,j,z).Matrix(1,Total_Number+1)=.5;
                         Obj(i,j,z).String=([varargin{4},'(',num2str(i),',',num2str(j),',',num2str(z),')']);
                        end
                    end
                end
            end
           
                
        end
        
        Obj_Set=plus(Obj1,Obj2);
        New_Obj=mtimes(Obj1,Obj2);
        Obj_Set=minus(Obj1,Obj2);
        Obj_Set=times(Obj,Power);
        New_Obj=uminus(Obj);
        New_Obj=mpower(Obj,Power);
        New_Obj=ctranspose(Obj); 
        Obj_Sum=sum(Obj);
        Show_Set=ShowVector(Obj_Set);
        Show_Set=ShowPosition(Obj_Set);
        Show=ShowMatrix(Obj);
        Degree=ShowDegree(Obj)
        Resizer(varargin);
        Obj_Set=power(Obj,Power);
        Matrix_Padded=Padder(Obj);
        Compressed=ShowCompressMatrix(Obj_Set,Scaling);
        String_Set=Which_Variable(Table,Location_Set);
            
            
    end
        
    
    
    
end
