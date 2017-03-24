Node_Type=[];    %%%%%%%%   Type=3:  Load Leading,    Type=2  Generator Leading,  Type=1  Theta Leading
for i=1:Node_Number
    if ismember(i,D)
        Node_Type=[Node_Type;3];
    else      
        if ismember(i,G)
            Node_Type=[Node_Type;2];
        else
            Node_Type=[Node_Type;1];
        end       
    end  
end




A=zeros(Node_Number,size(Link,1));
for i=1:size(Link,1)
       A(Link(i,1),i)=1; 
       A(Link(i,2),i)=-1;
end
X=diag(1./Link(:,3));
U=(X^-1)*A';
B=A*(X^-1)*A';





Data

global Total_Number; Total_Number=0;
P_G_Resiptory=Fastvar(length(G),length(Scenario_Set),length(Time_Set),'P_G_Resiptory');
P_D_Resiptory=Fastvar(length(D),length(Scenario_Set),length(Time_Set),'P_D_Resiptory');
Theta_Resiptory=Fastvar(Node_Number,length(Scenario_Set),length(Time_Set),'Theta_Resiptory');
Lambda_Resiptory=Fastvar(Node_Number,length(Scenario_Set),length(Time_Set),'Lambda_Resiptory');
Sigma_Resiptory=Fastvar(length(G),length(Scenario_Set),length(Time_Set),'Sigma_Resiptory');
Delta_Resiptory=Fastvar(length(G),length(Scenario_Set),length(Time_Set),'Delta_Resiptory');
Zeta_Resiptory=Fastvar(length(D),length(Scenario_Set),length(Time_Set),'Zeta_Resiptory');
Xi_Resiptory=Fastvar(length(D),length(Scenario_Set),length(Time_Set),'Xi_Resiptory');
Phi_Resiptory=Fastvar(sum(C<Infinite_Capacity),length(Scenario_Set),length(Time_Set),'Phi_Resiptory');
Psi_Resiptory=Fastvar(sum(C<Infinite_Capacity),length(Scenario_Set),length(Time_Set),'Psi_Resiptory');
R_Phi_Resiptory=Fastvar(sum(C<Infinite_Capacity),length(Scenario_Set),length(Time_Set),'R_Phi_Resiptory');
R_Psi_Resiptory=Fastvar(sum(C<Infinite_Capacity),length(Scenario_Set),length(Time_Set),'R_Psi_Resiptory');
R_Sigma_Resiptory=Fastvar(size(Sigma_Resiptory,1),length(Scenario_Set),length(Time_Set),'R_Sigma_Resiptory');
R_Delta_Resiptory=Fastvar(size(Delta_Resiptory,1),length(Scenario_Set),length(Time_Set),'R_Delta_Resiptory');
R_Zeta_Resiptory=Fastvar(size(Zeta_Resiptory,1),length(Scenario_Set),length(Time_Set),'R_Zeta_Resiptory');
R_Xi_Resiptory=Fastvar(size(Xi_Resiptory,1),length(Scenario_Set),length(Time_Set),'R_Xi_Resiptory');
a_S_Resiptory=Fastvar(length(S),1,length(Time_Set),'a_S_Resiptory');


Table=Reshaping(P_G_Resiptory,P_D_Resiptory,Theta_Resiptory,Lambda_Resiptory,Sigma_Resiptory,Delta_Resiptory,...
    Zeta_Resiptory,Xi_Resiptory,Phi_Resiptory,Psi_Resiptory,R_Phi_Resiptory,R_Psi_Resiptory,R_Sigma_Resiptory,...
    R_Delta_Resiptory,R_Zeta_Resiptory,R_Xi_Resiptory,a_S_Resiptory);





P_G=P_G_Resiptory;
P_D=P_D_Resiptory;
Theta=Theta_Resiptory;
Lambda=Lambda_Resiptory;
Sigma=Sigma_Resiptory;
Delta=Delta_Resiptory;
Zeta=Zeta_Resiptory;
Xi=Xi_Resiptory;

Phi=Fastvar(zeros(size(Link,1),length(Scenario_Set),length(Time_Set)));
Phi(C<Infinite_Capacity,:,:)=Phi_Resiptory;

Psi=Fastvar(zeros(size(Link,1),length(Scenario_Set),length(Time_Set)));
Psi(C<Infinite_Capacity,:,:)=Psi_Resiptory;

R_Phi=Fastvar(ones(size(Phi,1),length(Scenario_Set),length(Time_Set)));
R_Phi(C<Infinite_Capacity,:,:)=R_Phi_Resiptory;

R_Psi=Fastvar(ones(size(Psi,1),length(Scenario_Set),length(Time_Set)));
R_Psi(C<Infinite_Capacity,:,:)=R_Psi_Resiptory;

R_Sigma=R_Sigma_Resiptory;
R_Delta=R_Delta_Resiptory;
R_Zeta=R_Zeta_Resiptory;
R_Xi=R_Xi_Resiptory;
a_S=a_S_Resiptory;



Binary_Table=Reshaping(R_Phi(C<Infinite_Capacity,:,:),R_Psi(C<Infinite_Capacity,:,:),R_Sigma,R_Delta,R_Zeta,R_Xi);





Max_Temp=P_G_Max;
Min_Temp=P_G_Min;
a_Temp=a;



P_G_Max=zeros(length(G),length(Scenario_Set),length(Time_Set));
P_G_Min=zeros(length(G),length(Scenario_Set),length(Time_Set));
      a=Fastvar(zeros(length(G),length(Scenario_Set),length(Time_Set)));

P_G_Max(~ismember(G,S),:,:)=Max_Temp;
P_G_Min(~ismember(G,S),:,:)=Min_Temp;
      a(~ismember(G,S),:,:)=  a_Temp;


P_G_Max( ismember(G,S),:,:)=P_S_Max(:,ones(1,length(Scenario_Set)),ones(1,length(Time_Set)));
P_G_Min( ismember(G,S),:,:)=P_S_Min(:,ones(1,length(Scenario_Set)),ones(1,length(Time_Set)));
      a( ismember(G,S),:,:)=a_S(:,ones(1,length(Scenario_Set)),:);






clear Prob
Prob.c=zeros(1, Total_Number+1);
Prob.a=[];
Prob.blc=[];
Prob.buc=[];
Prob.ints.sub=[];
Prob.bux=[];
Prob.blx=[];





for T=1:length(Time_Set)
for K=Scenario_Set


Equl_Coeff_Set=[];
Ineq_Coeff_Set=[];
Objective_Coeff_Set=[];




%%%%%%%%  Theta1=0;
Equl=[Theta(1,K,T)];
Equl_Coeff_Set=[Equl_Coeff_Set; Equl.ShowVector];


% %%%%%%%% (4)
% for i=1:Node_Number 
%     Equl=sum(P_G(:,K,T).*double(G==i))-sum(P_D(:,K,T).*double(D==i)) -(  sum(Link(:,3).*(Link(:,1)==i).*(Theta(i,K,T)-Theta(Link(:,2),K,T))) + sum(Link(:,3).*double(Link(:,2)==i).*(Theta(i,K,T)-Theta(Link(:,1),K,T))));
%     Equl_Coeff_Set=[Equl_Coeff_Set; Equl.ShowVector];
% end


%%%%%%% (4)
for i=1:Node_Number      
     Equl=sum(P_G(:,K,T).*double(G==i))-sum(P_D(:,K,T).*double(D==i))-B(i,:)*Theta(:,K,T);
     Equl_Coeff_Set=[Equl_Coeff_Set; Equl.ShowVector];
end



  
   %%%%% (5a)
    Ineq=P_G(:,K,T)-P_G_Min(:,K,T);
    Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];
    
   %%%%% (5b)
    Ineq=P_G_Max(:,K,T)-P_G(:,K,T);
    Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];
    
    
   %%%%%% (6a)
    Ineq=P_D(:,K,T)-P_D_Min(:,K,T);
    Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

    %%%%% (6b)
    Ineq=P_D_Max(:,K,T)-P_D(:,K,T);
    Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];
     
    
     %%%%%%%% (7a)
    Ineq=C-(Link(:,3).*(Theta(Link(:,1),K,T)-Theta(Link(:,2),K,T)));
    Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

    %%%%%% (7b)
    Ineq=C+(Link(:,3).*(Theta(Link(:,1),K,T)-Theta(Link(:,2),K,T)));
    Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

    
    %%%%%% (8)   
    Equl=a(:,K,T)-Lambda(G,K,T)-Sigma(:,K,T)+Delta(:,K,T);
    Equl_Coeff_Set=[Equl_Coeff_Set; Equl.ShowVector];

    
    %%%%%%%%% (9) 
    Equl=-b(:,K,T)+Lambda(D,K,T)-Zeta(:,K,T)+Xi(:,K,T);
    Equl_Coeff_Set=[Equl_Coeff_Set; Equl.ShowVector];

    
%%%%%%% (10)
% for i=1:Node_Number   
%    Equl=-sum(double(Link(:,1)==i).*(Phi(:,K,T)-Psi(:,K,T)).*Link(:,3))+ ...
%      sum(double(Link(:,2)==i).*(Phi(:,K,T)-Psi(:,K,T)).*Link(:,3))+...
%      sum(Link(:,3).*double(Link(:,1)==i)+Link(:,3).*double(Link(:,2)==i))*Lambda(i,K,T)-sum(Link(:,3).*double(Link(:,2)==i).*Lambda(Link(:,1),K,T)+Link(:,3).*double(Link(:,1)==i).*Lambda(Link(:,2),K,T));
%       Equl_Coeff_Set=[Equl_Coeff_Set; Equl.ShowVector];
% end


%%%%%%%%%%%%% (10)
Equl=B'*Lambda(:,K,T)+U'*(Psi(:,K,T)-Phi(:,K,T));
Equl_Coeff_Set=[Equl_Coeff_Set; Equl.ShowVector];


%%%%%% (17a)
Ineq=Sigma(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%%% (17b)
Ineq=Delta(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%% (18a)
Ineq=Zeta(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%% (18b)
Ineq=Xi(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

%%%%% (19a)
Ineq=Phi(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%% (19b)
Ineq=Psi(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%  (37)
Ineq=(1-R_Phi(:,K,T))*Large-Phi(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%% (38)
Ineq=R_Phi(:,K,T)*Large-(C+Link(:,3).*(Theta(Link(:,1),K,T)-Theta(Link(:,2),K,T)));
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%% (39)
Ineq=(1-R_Psi(:,K,T))*Large-Psi(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%% (40)
Ineq=R_Psi(:,K,T)*Large-(C-Link(:,3).*(Theta(Link(:,1),K,T)-Theta(Link(:,2),K,T)));
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

%%%%%%%%% (41)
Ineq=(1-R_Sigma(:,K,T))*Large-Sigma(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%%% (42)
Ineq=R_Sigma(:,K,T)*Large-(P_G(:,K,T)-P_G_Min(:,K,T));
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%%% (43)
Ineq=(1-R_Delta(:,K,T))*Large-Delta(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%%%% (44)
Ineq=R_Delta(:,K,T)*Large-(P_G_Max(:,K,T)-P_G(:,K,T));
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%%%% (45)
Ineq=(1-R_Zeta(:,K,T))*Large-Zeta(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%%% (46)
Ineq=R_Zeta(:,K,T)*Large-(P_D(:,K,T) -P_D_Min(:,K,T));
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%%% (47)
Ineq=(1-R_Xi(:,K,T))*Large-Xi(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%%% (48)
Ineq=R_Xi(:,K,T)*Large-(P_D_Max(:,K,T)-P_D(:,K,T));
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


%%%%%  This is an additinal constraint that is not discussed in the report.
%%%%%  Generators energy bid cannot be negative, as they always sell energy
Ineq=a_S(:,1,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  All the optimization variables should
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  be  upper bounded by Large number.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  These extra inequalities are added to
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  make sure that the optimal a_S_Value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  and Lambda_Value are obtained below the
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Large Number
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ineq=Large-a_S(:,1,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

Ineq=Large-Lambda(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

Ineq=Large-Delta(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

Ineq=Large-Sigma(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

Ineq=Large-Zeta(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

Ineq=Large-Xi(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


Ineq=Large-Phi(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];


Ineq=Large-Psi(:,K,T);
Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];



%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%% Timing
if T>=2  
    Ineq=Gamma-P_G(find(ismember(G,S)),K,T)+P_G(find(ismember(G,S)),K,T-1);
    Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];

    
    Ineq=Gamma+P_G(find(ismember(G,S)),K,T)-P_G(find(ismember(G,S)),K,T-1);
    Ineq_Coeff_Set = [Ineq_Coeff_Set; Ineq.ShowVector];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    



Objective= -(a(Extract(G,S),K,T)')*P_G(Extract(G,S),K,T)+b(:,K,T)'*P_D(:,K,T)+ ...
    Sigma(Extract(G,S),K,T)'*P_G_Min(Extract(G,S),K,T)-...
    (Delta(Extract(G,S),K,T)')*P_G_Max(Extract(G,S),K,T)+...
    Zeta(:,K,T)'*P_D_Min(:,K,T)- (Xi(:,K,T)')*P_D_Max(:,K,T)-(Phi(:,K,T)')*C-(Psi(:,K,T)')*C-(c(Extract(S,[])))'*P_G(Extract(G,G(Extract(G,S))),K,T);

Objective_Coeff_Set=Objective.ShowVector;




Prob.c=Prob.c+Objective_Coeff_Set;
Prob.a=[Prob.a; Ineq_Coeff_Set;Equl_Coeff_Set];
Prob.blc=[Prob.blc; zeros(size(Ineq_Coeff_Set,1),1);    zeros(size(Equl_Coeff_Set,1),1)];
Prob.buc=[Prob.buc; inf*ones(size(Ineq_Coeff_Set,1),1); zeros(size(Equl_Coeff_Set,1),1)];



end


end








Location=reshape(Binary_Table.ShowPosition,1,size(Binary_Table,1)*size(Binary_Table,2)*size(Binary_Table,3)); 
% Lbound=-inf*ones(1,Total_Number+1);
% Ubound=inf*ones(1,Total_Number+1);
% Lbound(Location)=0;
% Ubound(Location)=1;
% Lbound(1)=1;          %%%% the first optimization variable in each Scenario_Set is 1
% Ubound(1)=1;


Constraints=[];
Optimization_Vector=sdpvar(length(Prob.c),1);
Constraints=[Constraints; Optimization_Vector(1)==1];
Constraints=[Constraints; binary(Optimization_Vector(Location))];

%Prob.ints.sub=[Prob.ints.sub Location];
%Prob.bux=[Prob.bux Ubound];
%Prob.blx=[Prob.blx Lbound];

Prob.c=Prob.c/length(Scenario_Set);

Constraints=[Constraints; Prob.blc<=Prob.a* Optimization_Vector<=Prob.buc];

%Param = [];
%Param.MSK_IPAR_NUM_THREADS    = 0; 


Settings=sdpsettings('verbose',0,'solver','gurobi','debug',1);

tic

Problem_Solved=optimize(Constraints, -Prob.c*Optimization_Vector, Settings);
%[R,Res] = mosekopt('maximize echo(0)',Prob,Param);


Time_Solver_MILP=toc;

Res.sol.int.xx=value(Optimization_Vector);

Recovery

Optimal_Objective_MILP=Prob.c*Res.sol.int.xx;






