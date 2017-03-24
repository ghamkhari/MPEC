
%%%%% First run the Stochastic program 
Solution=cell(5);

Node_Type=[];    %%%%%%%%   Type=3:  Load Leading,    Type=2  Generator Leading,  Type=1  Theta Leading
for i=1:Node_Number
    if sum(i==D)>0
        Node_Type=[Node_Type;3];
    else      
        if sum(i==G)>0
            Node_Type=[Node_Type;2];
        else
            Node_Type=[Node_Type;1];
        end       
    end  
end

Theta_Nodes=[];

for i=1:Node_Number
    if Node_Type(i)==2 || Node_Type(i)==3
        Theta_Nodes=[Theta_Nodes; 1];
    else
        Theta_Nodes=[Theta_Nodes; 0];
    end
    
end


for K=1:length(Scenario_Set)
v1=P_G_Value(find(Node_Type(G)==3),K);

v2=Theta_Value(setdiff(2:Node_Number,find(Node_Type==1))',K);
    
v3=Lambda_Value(end,K);
v4=Sigma_Value(:,K);
v5=Zeta_Value(:,K);
v6=Phi_Value(C<Infinite_Capacity,K);
v7=Psi_Value(C<Infinite_Capacity,K);
v8=a_S_Value;

%v=[1;v1;v2;v3;v4;v5;v6;v7;v8];
v=[1;v1;v2;v3;v4;v5;v6;v7;v8];

Solution{K}=v*v';

end


save Solution Solution 



