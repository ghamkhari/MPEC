function Vectori=Extract(G,S)

Vectori=[];
for i=1:length(G)
    Flage=1;
    
   for j=1:length(S)
      
       if S(j)==G(i)
           Flage=0;
           
       end
       
       
     
   end
   
   if Flage==1
           Vectori=[Vectori;(i)];
           
       end
    
end



end
