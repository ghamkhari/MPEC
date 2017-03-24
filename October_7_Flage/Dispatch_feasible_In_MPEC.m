
a=[
 39.0 39.8 39.5 40.8 40.7
 37.1 38.2 36.0 39.0 38.5
 44.2 41.7 45.4 46.8 47.0
 46.0 45.1 44.1 44.6 43.5
 41.4 43.2 40.9 43.0 42.1];

a=a(:,5);
%a_Modified=[a(1);double(a_S_Value(1));a(2:4);double(a_S_Value(2));a(5)];

a_Modified=[a(1);16.71;a(2:4);34.54;a(5)];

[Cost MPEC_Object P_G_Cvx, P_D_Cvx, Theta_Cvx, Lambda_Cvx, Sigma_Cvx ,Delta_Cvx, Zeta_Cvx, Xi_Cvx, Phi_Cvx, Psi_Cvx]=cvx_based(Node_Number,Link,G,D,S,a_Modified,b,P_G_Max,P_G_Min,P_D_Max,P_D_Min,C,c);
Optimal_Sol=zeros(length(Variable_Table)+1,1);


Optimal_Sol(1)=1;

[Useless, Index]=ismember(Theta,Variable_Table);
Optimal_Sol(Index+1)=Theta_Cvx; 

[Useless, Index]=ismember(P_G,Variable_Table);
Optimal_Sol(Index+1)=P_G_Cvx; 

[Useless ,Index]=ismember(Lambda,Variable_Table);
Optimal_Sol(Index+1)=Lambda_Cvx; 


[Useless, Index]=ismember(P_D,Variable_Table);
Optimal_Sol(Index+1)=P_D_Cvx;


[Useless, Index]=ismember(Phi,Variable_Table);
Optimal_Sol(Index+1)=Phi_Cvx;

[Useless ,Index]=ismember(Psi,Variable_Table);
Optimal_Sol(Index+1)=Psi_Cvx;

[Useless ,Index]=ismember(Sigma,Variable_Table);
Optimal_Sol(Index+1)=Sigma_Cvx;


[Useless ,Index]=ismember(Delta,Variable_Table);
Optimal_Sol(Index+1)=Delta_Cvx;

[Useless ,Index]=ismember(Zeta,Variable_Table);
Optimal_Sol(Index+1)=Zeta_Cvx;


[Useless, Index]=ismember(Xi,Variable_Table);
Optimal_Sol(Index+1)=Xi_Cvx;

[Useless, Index]=ismember(R_Sigma,Variable_Table);
R_Sigma_Cvx=1-min(floor(max(Sigma_Cvx,0)*10^6),1);
Optimal_Sol(Index+1)=R_Sigma_Cvx;

[Useless, Index]=ismember(R_Zeta,Variable_Table);
R_Zeta_Cvx=1-min(floor(max(Zeta_Cvx,0)*10^6),1);
Optimal_Sol(Index+1)=R_Zeta_Cvx;

[Useless ,Index]=ismember(R_Delta,Variable_Table);
R_Delta_Cvx=1-min(floor(max(Delta_Cvx,0)*10^6),1);
Optimal_Sol(Index+1)=R_Delta_Cvx;

[Useless ,Index]=ismember(R_Xi,Variable_Table);
R_Xi_Cvx=1-min(floor(max(Xi_Cvx,0)*10^6),1);
Optimal_Sol(Index+1)=R_Xi_Cvx;

[Useless ,Index]=ismember(R_Phi,Variable_Table);
R_Phi_Cvx=1-min(floor(max(Phi_Cvx,0)*10^6),1);
Optimal_Sol(Index+1)=R_Phi_Cvx;

[Useless, Index]=ismember(R_Psi,Variable_Table);
R_Psi_Cvx=1-min(floor(max(Psi_Cvx,0)*10^6),1);
Optimal_Sol(Index+1)=R_Psi_Cvx;

Indices=find((Prob.a*Optimal_Sol<-10^-10));
Prob.a(Indices,:)*Optimal_Sol;
vpa(Prob.a(Indices,:)*[1 Variable_Table]',4);


%Prob.a(220,:)*Optimal_Sol;

min(Prob.a*Optimal_Sol>=Prob.blc);
min(Prob.a*Optimal_Sol<=Prob.buc);

Indices=find(~(Prob.a*Optimal_Sol<=Prob.buc));
vpa(Prob.a(Indices,:)*[1 Variable_Table]',4);
Prob.a(Indices,:)*Optimal_Sol;


Flage=1;
for i=1:length(Location)
if (Optimal_Sol(Location(i)+1)==0 || Optimal_Sol(Location(i)+1)==1) ~=1 
  Flage=0;
end
end
Flage;




%R_Sigma_Cvx*Large-(P_G_Cvx-P_G_Min)
%-b+Lambda_Cvx(D)-Zeta_Cvx+Xi_Cvx;

%vpa(Prob.a(incides,:)*[1 Variable_Table]',4)

%R_Psi_Cvx(16)*Large-(C(16)-Link(16,3)*(Theta_Cvx(Link(16,1))-Theta_Cvx(Link(16,2))));




% (1-R_Sigma_Cvx(6))*Large-Sigma_Cvx(6);
% R_Sigma_Cvx(6)*Large-(P_G_Cvx(6)-P_G_Min(6));
% 
