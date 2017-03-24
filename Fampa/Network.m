

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


Ineq_SDP_Whole=[];
Equl_SDP_Whole=[];
Objective_Whole=[];



global Total_Number; Total_Number=0;

P_S_Save_Set=Fastvar(zeros(length(S),length(Scenario_Set),length(Time_Set)));

a_S_Resiptory=Fastvar(length(S),1,length(Time_Set),'a_S_Resiptory');


for T=1:length(Time_Set)




for K=1:length(Scenario_Set) 
    
    

    
    
Data          
Single

P_G_Resiptory=Fastvar(length(G),1,'P_G_Resiptory');
P_D_Resiptory=Fastvar(length(D),1,'P_D_Resiptory');
Theta_Resiptory=Fastvar(Node_Number-1,1,'Theta_Resiptory');
Lambda_Resiptory=Fastvar(Node_Number,1,'Lambda_Resiptory');
Sigma_Resiptory=Fastvar(length(G),1,'Sigma_Resiptory');
Delta_Resiptory=Fastvar(length(G),1,'Delta_Resiptory');
Zeta_Resiptory=Fastvar(length(D),1,'Zeta_Resiptory');
Xi_Resiptory=Fastvar(length(D),1,'Xi_Resiptory');
Phi_Resiptory=Fastvar(sum(C<Infinite_Capacity),1,'Phi_Resiptory');
Psi_Resiptory=Fastvar(sum(C<Infinite_Capacity),1,'Psi_Resiptory');


a_S=a_S_Resiptory(:,1,T);


Sigma=Sigma_Resiptory;
Delta=Delta_Resiptory;
Zeta=Zeta_Resiptory;
Xi=Xi_Resiptory;



Phi=Fastvar(zeros(size(Link,1),1));
Phi(C<Infinite_Capacity)=Phi_Resiptory;


Psi=Fastvar(zeros(size(Link,1),1));
Psi(C<Infinite_Capacity)=Psi_Resiptory;


Theta=[0;Theta_Resiptory];  %%%% We set the Theta1 to be zero.  %%% Also, (B(find(Node_Type==1),:)*Theta_Dependency*rand(13,1)) results in zero


Lambda=Lambda_Resiptory;

P_G=P_G_Resiptory;

P_S_Save_Set(:,K,T)=P_G(find(ismember(G,S)));


P_D=P_D_Resiptory;



Max_Temp=P_G_Max;
Min_Temp=P_G_Min;
a_Temp=a;

P_G_Max=zeros(length(G),1);
P_G_Min=zeros(length(G),1);
a=Fastvar(zeros(length(G),1));

P_G_Max(find(ismember(G,setdiff(G,S)))) =Max_Temp;
P_G_Min(find(ismember(G,setdiff(G,S)))) =Min_Temp;
      a(find(ismember(G,setdiff(G,S)))) =a_Temp;      
P_G_Max(find(~ismember(G,setdiff(G,S))))=P_S_Max;
P_G_Min(find(~ismember(G,setdiff(G,S))))=P_S_Min;
      a(find(~ismember(G,setdiff(G,S))))=a_S;
      

 
      
     

for i=1:Node_Number
        Ineq=[]; 
    if Node_Type(i)==3  && ismember(i,G)
    Ineq=[Ineq; P_G_Max(find(G==i))-P_G(find(G==i))];
    Ineq=[Ineq; P_G(find(G==i))-P_G_Min(find(G==i))];   
    Ineq=[Ineq; P_D_Max(find(D==i))-P_D(find(D==i))];
    Ineq=[Ineq; P_D(find(D==i))-P_D_Min(find(D==i))];
    Ineq=[Ineq; C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta];  %%%%  The  Vector C is replaced with C(,:) such that C([]) is a 0*1 dimension Matrix
    Ineq=[Ineq; C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta];
    Ineq=[Ineq; U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; Sigma(find(G==i))];
    Ineq=[Ineq; Delta(find(G==i))];    
    Ineq=[Ineq; Zeta(find(D==i))];
    Ineq=[Ineq; Xi(find(D==i))];
    Ineq=[Ineq; Phi(find(Link(:,1)==i))];
    Ineq=[Ineq; Phi(find(Link(:,2)==i))];
    Ineq=[Ineq; Psi(find(Link(:,1)==i))];
    Ineq=[Ineq; Psi(find(Link(:,2)==i))]; 
    end
    
    if Node_Type(i)==3  && ~ismember(i,G)
    Ineq=[Ineq; P_D_Max(find(D==i))-P_D(find(D==i))];
    Ineq=[Ineq; P_D(find(D==i))-P_D_Min(find(D==i))];
    Ineq=[Ineq; C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta];  %%%%  The  Vector C is replaced with C(,:) such that C([]) is a 0*1 dimension Matrix
    Ineq=[Ineq; C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta];
    Ineq=[Ineq; U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; Zeta(find(D==i))];
    Ineq=[Ineq; Xi(find(D==i))];
    Ineq=[Ineq; Phi(find(Link(:,1)==i))];
    Ineq=[Ineq; Phi(find(Link(:,2)==i))];
    Ineq=[Ineq; Psi(find(Link(:,1)==i))];
    Ineq=[Ineq; Psi(find(Link(:,2)==i))]; 
    end
    
     if Node_Type(i)==2
    Ineq=[Ineq; P_G_Max(find(G==i))-P_G(find(G==i))];
    Ineq=[Ineq; P_G(find(G==i))-P_G_Min(find(G==i))];   
    Ineq=[Ineq; C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta];  %%%%  The  Vector C is replaced with C(,:) such that C([]) is a 0*1 dimension Matrix
    Ineq=[Ineq; C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta];
    Ineq=[Ineq; U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; Sigma(find(G==i))];
    Ineq=[Ineq; Delta(find(G==i))];    
    Ineq=[Ineq; Phi(find(Link(:,1)==i))];
    Ineq=[Ineq; Phi(find(Link(:,2)==i))];
    Ineq=[Ineq; Psi(find(Link(:,1)==i))];
    Ineq=[Ineq; Psi(find(Link(:,2)==i))]; 
     end
    
    
      if Node_Type(i)==1
    Ineq=[Ineq; C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta];  %%%%  The  Vector C is replaced with C(,:) such that C([]) is a 0*1 dimension Matrix
    Ineq=[Ineq; C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta];
    Ineq=[Ineq; U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; Phi(find(Link(:,1)==i))];
    Ineq=[Ineq; Phi(find(Link(:,2)==i))];
    Ineq=[Ineq; Psi(find(Link(:,1)==i))];
    Ineq=[Ineq; Psi(find(Link(:,2)==i))]; 
      end
    
    
    if ismember(i,S)
        Ineq=[Ineq; a_S(find(i==S))];
    end
    
    
    Ineq_SDP_Whole=[Ineq_SDP_Whole;Ineq];
    
end





P_D_Expand_Node=Fastvar(zeros(Node_Number,1));
P_D_Expand_Node(D)=P_D;
P_G_Expand_Node=Fastvar(zeros(Node_Number,1));
P_G_Expand_Node(G)=P_G;





Equl_SDP_Whole=[Equl_SDP_Whole; P_G_Expand_Node-P_D_Expand_Node-B*Theta];
Equl_SDP_Whole=[Equl_SDP_Whole; a-Lambda(G)-Sigma+Delta];
Equl_SDP_Whole=[Equl_SDP_Whole; b-Lambda(D)+Zeta-Xi];
Equl_SDP_Whole=[Equl_SDP_Whole; B*Lambda+U'*(Psi-Phi)];
Equl_SDP_Whole=[Equl_SDP_Whole; Sigma.*(P_G_Min-P_G)];
Equl_SDP_Whole=[Equl_SDP_Whole; Delta.*(P_G-P_G_Max)];
Equl_SDP_Whole=[Equl_SDP_Whole; Zeta.*(P_D_Min-P_D)];
Equl_SDP_Whole=[Equl_SDP_Whole; Xi.*(P_D-P_D_Max)];
Equl_SDP_Whole=[Equl_SDP_Whole; Phi(C<Infinite_Capacity).*(C(C<Infinite_Capacity,:)+U(C<Infinite_Capacity,:)*Theta)];
Equl_SDP_Whole=[Equl_SDP_Whole; Psi(C<Infinite_Capacity).*(U(C<Infinite_Capacity,:)*Theta-C(C<Infinite_Capacity,:))];



Objective=Lambda(G(Extract(G,G(Extract(G,S)))))'*P_G(Extract(G,G(Extract(G,S))))-c'*P_G(Extract(G,G(Extract(G,S)))) ;



Objective_Whole=[Objective_Whole;Objective];



%%%%%%%%%%%%%%%  Coupling Constraints

if T>=2
    
    Ineq_SDP_Whole=[Ineq_SDP_Whole;  P_S_Save_Set(:,K,T)-P_S_Save_Set(:,K,T-1)+Gamma];
    Ineq_SDP_Whole=[Ineq_SDP_Whole; -P_S_Save_Set(:,K,T)+P_S_Save_Set(:,K,T-1)+Gamma];
    
end

%%%%%%%%%%%%%%%%



end







end





Ineq_SDP_Whole=[Ineq_SDP_Whole;Expression_Product_Self(Ineq_SDP_Whole)];






Constraints=[];
Len=Total_Number+1;
V=sdpvar(Len,Len);


    Objective_Matrix=ShowMatrix(sum(sum(Objective_Whole)))*V;
    
    
    

    Constraints=[Constraints;  V(1,1)==1];
    Constraints=[Constraints;  V(:,:)>=0];
   

    Constraints=[Constraints;  ShowCompressMatrix(Ineq_SDP_Whole,'Regular')'* reshape(V,Len^2,1) >=0];
    Constraints=[Constraints;  ShowCompressMatrix(Equl_SDP_Whole,'Regular')'* reshape(V,Len^2,1) ==0];


Settings=sdpsettings('verbose',0,'solver','mosek','debug',1,'mosek.MSK_IPAR_NUM_THREADS',1);
tic
Problem_Solved=optimize(Constraints,-trace(Objective_Matrix),Settings);
Time_Solver_Fampa=toc;

if strcmp(Problem_Solved.info,'Unbounded objective function (MOSEK)')==1
    Optimal_Objective_Fampa='Unbounded';
else
    Optimal_Objective_Fampa=trace(value(Objective_Matrix))/length(Scenario_Set);
    V=value(V);
end




