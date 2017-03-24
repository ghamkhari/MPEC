
Phi_Value=zeros(size(Link,1),1);
Phi_Value(C<Infinite_Capacity)=V(1,Showed_Position_Phi_Resiptory)';

Psi_Value=zeros(size(Link,1),1);
Psi_Value(C<Infinite_Capacity)=V(1,Showed_Position_Psi_Resiptory)';

Lambda_Resiptory_Value=V(1,Showed_Position_Lambda_Resiptory)';
Lambda_Value=zeros(Node_Number,1);
Lambda_Value(Leadings)=((B(Leadings,Leadings))')^-1*((U(:,Leadings))'*(Phi_Value-Psi_Value)- B(setdiff(1:Node_Number,Leadings),Leadings)'*Lambda_Resiptory_Value);
Lambda_Value(setdiff(1:Node_Number,Leadings))=Lambda_Resiptory_Value;

Theta_Resiptory_Value=V(1,Showed_Position_Theta_Resiptory)';
Theta_Value=Theta_Dependency*[0;Theta_Resiptory_Value];

a_S_Value=V(1,Showed_Position_a_S)';

P_G_Resiptory_Value=V(1,Showed_Position_P_G_Resiptory);
P_G_Value=zeros(length(G),1);
P_G_Value(find(Node_Type(G)==3))=P_G_Resiptory_Value;
P_G_Value(find(Node_Type(G)==2))=B(G(find(Node_Type(G)==2)),:)*Theta_Value;
 




Max_Temp=P_G_Max;
Min_Temp=P_G_Min;
P_G_Max=zeros(length(G),1);
P_G_Min=zeros(length(G),1);
a_Value=zeros(length(G),1);

P_G_Max(find(ismember(G,setdiff(G,S)))) =Max_Temp;
P_G_Min(find(ismember(G,setdiff(G,S)))) =Min_Temp;
a_Value(find(ismember(G,setdiff(G,S)))) =a;      
P_G_Max(find(~ismember(G,setdiff(G,S))))=P_S_Max;
P_G_Min(find(~ismember(G,setdiff(G,S))))=P_S_Min;
a_Value(find(~ismember(G,setdiff(G,S))))=a_S_Value;
      


Sigma_Value=V(1,Showed_Position_Sigma_Resiptory)';
Zeta_Value=V(1,Showed_Position_Zeta_Resiptory)';

Delta_Value=-a_Value +Lambda_Value(G)+Sigma_Value;    


Xi_Value=b-Lambda_Value(D)+Zeta_Value;





P_D_Value=[];

for j=1:length(D)
    i=D(j);
    
    if Node_Type(i)==3  && ismember(i,G)
       P_D_Value=[P_D_Value;     P_G_Value(find(G==i))-B(i,:)*Theta_Value];
    end
    
    
    if Node_Type(i)==3  && ~ismember(i,G)
       P_D_Value=[P_D_Value;    -B(i,:)*Theta_Value];
    end
   
end







%P_D_Value(find(ismember(D,intersect( Node_Type(D),intersect(D,G)))))=P_G_Value(find(ismember(G,intersect(Node_Type(D),intersect(D,G)))))-B(intersect( Node_Type(D),intersect(D,G)),:)*Theta_Value

