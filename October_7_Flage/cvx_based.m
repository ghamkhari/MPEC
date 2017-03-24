

A=zeros(Node_Number,size(Link,1));
for i=1:size(Link,1)
       A(Link(i,1),i)=1; 
       A(Link(i,2),i)=-1;
end
X=diag(1./Link(:,3));
U=(X^-1)*A';
B=A*(X^-1)*A';



clc
addpath('/Users/Mahdi/Copy/Lab/matlabs/MPEC/SOS/cvx')



Data

Max_Temp=P_G_Max;
Min_Temp=P_G_Min;
a_Temp=a;



P_G_Max=zeros(length(G),length(Scenario_Set),length(Time_Set));
P_G_Min=zeros(length(G),length(Scenario_Set),length(Time_Set));
%a=zeros(length(G),length(Scenario_Set),length(Time_Set));
a=300*ones(length(G),length(Scenario_Set),length(Time_Set));


P_G_Max(~ismember(G,S),:,:)=Max_Temp;
P_G_Min(~ismember(G,S),:,:)=Min_Temp;
a(~ismember(G,S),:,:)=  a_Temp;


P_G_Max( ismember(G,S),:,:)=P_S_Max(:,ones(1,length(Scenario_Set)),ones(1,length(Time_Set)));
P_G_Min( ismember(G,S),:,:)=P_S_Min(:,ones(1,length(Scenario_Set)),ones(1,length(Time_Set)));




cvx_begin
cvx_solver mosek
cvx_precision best
variable  P_G_Cvx(length(G),1,length(Time_Set))
variable P_D_Cvx(length(D),1,length(Time_Set))
variable  Theta_Cvx(Node_Number,1,length(Time_Set))

dual variable Lambda_Cvx{Node_Number,1,length(Time_Set)}
dual variable Phi_Cvx{1,length(Time_Set)}
dual variable Psi_Cvx{1,length(Time_Set)}
dual variable Sigma_Cvx{length(G),1,length(Time_Set)}
dual variable Delta_Cvx{length(G),1,length(Time_Set)}
dual variable Zeta_Cvx{length(D),1,length(Time_Set)}
dual variable Xi_Cvx{length(D),1,length(Time_Set)}
dual variable Omega_Cvx{1,length(Time_Set)}
dual variable Nu_Cvx{1,length(Time_Set)}
dual variable RR{length(Time_Set)}

Objective=0;

for T=1:length(Time_Set)
    Objective=Objective+(a(:,1,T)'* P_G_Cvx(:,1,T)-b(:,1,T)'*P_D_Cvx(:,1,T));
end


minimize  Objective


subject to






for T=1:length(Time_Set)
    RR{T}: Theta_Cvx(1,1,T)==0;
    
    for i=1:Node_Number     
        %Lambda_Cvx{i,1,T}:sum(P_G_Cvx(:,1,T).*(G==i))-sum(P_D_Cvx(:,1,T).*(D==i)) ==(  sum(Link(:,3).*(Link(:,1)==i).*(Theta_Cvx(i,1,T)-Theta_Cvx(Link(:,2),1,T))) + sum(Link(:,3).*(Link(:,2)==i).*(Theta_Cvx(i,1,T)-Theta_Cvx(Link(:,1),1,T))));
        if ~isempty(find(ismember(G,i))) && ~isempty(find(ismember(D,i)))
        Lambda_Cvx{i,1,T}: P_G_Cvx(find(ismember(G,i)),1,T)-P_D_Cvx(find(ismember(D,i)),1,T)==B(i,:)*Theta_Cvx(:,1,T);
        end
        
        if ~isempty(find(ismember(G,i))) && isempty(find(ismember(D,i)))
        Lambda_Cvx{i,1,T}: P_G_Cvx(find(ismember(G,i)),1,T)==B(i,:)*Theta_Cvx(:,1,T);
        end
        
        if isempty(find(ismember(G,i))) && ~isempty(find(ismember(D,i)))
        Lambda_Cvx{i,1,T}: -P_D_Cvx(find(ismember(D,i)),1,T)==B(i,:)*Theta_Cvx(:,1,T);
        end
        
        if isempty(find(ismember(G,i))) && isempty(find(ismember(D,i)))
        Lambda_Cvx{i,1,T}: 0==B(i,:)*Theta_Cvx(:,1,T);
        end
        
        if ~isempty(find(ismember(G,i))), Sigma_Cvx{find(ismember(G,i)),1,T}: P_G_Min(find(ismember(G,i)),1,T)<=P_G_Cvx(find(ismember(G,i)),1,T), end;
        if ~isempty(find(ismember(G,i))), Delta_Cvx{find(ismember(G,i)),1,T}: P_G_Cvx(find(ismember(G,i)),1,T)<=P_G_Max(find(ismember(G,i)),1,T), end ;
        if ~isempty(find(ismember(D,i))), Zeta_Cvx {find(ismember(D,i)),1,T}: P_D_Min(find(ismember(D,i)),1,T)<=P_D_Cvx(find(ismember(D,i)),1,T), end;
        if ~isempty(find(ismember(D,i))), Xi_Cvx   {find(ismember(D,i)),1,T}: P_D_Cvx(find(ismember(D,i)),1,T)<=P_D_Max(find(ismember(D,i)),1,T), end;
    end
        
        
    
    
    if T>=2
            Omega_Cvx{1,T}: P_G_Cvx(:,1,T)-P_G_Cvx(:,1,T-1)<=Gamma;
            Nu_Cvx{1,T}:   -Gamma<=P_G_Cvx(:,1,T)-P_G_Cvx(:,1,T-1);
    end
%     
    Psi_Cvx{1,T}:  Link(:,3).*(Theta_Cvx(Link(:,1),1,T)-Theta_Cvx(Link(:,2),1,T))<= C;
    Phi_Cvx{1,T}: -C<=Link(:,3).*(Theta_Cvx(Link(:,1),1,T)-Theta_Cvx(Link(:,2),1,T));
    
    
    
end



cvx_end














