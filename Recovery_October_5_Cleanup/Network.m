

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


for T=1:length(Time_Set)


Ineq_SDP_Overal=[];
Equl_SDP_Overal=[];
Objective_Overal=[];


for K=1:length(Scenario_Set) 
    
    
Equl_SDP_Set=[];
Ineq_SDP_Set=[];
    
    
Data          
Single

global Total_Number; Total_Number=0;
P_G_Resiptory=Fastvar(length(intersect(find(Node_Type==3),G)),1,'P_G_Resiptory');
Theta_Resiptory=Fastvar(Node_Number-1-sum(Node_Type==1),1,'Theta_Resiptory');
Lambda_Resiptory=Fastvar(length(setdiff(1:Node_Number,Leading_Finder(B))),1,'Lambda_Resiptory');
Sigma_Resiptory=Fastvar(length(G),1,'Sigma_Resiptory');
Zeta_Resiptory=Fastvar(length(D),1,'Zeta_Resiptory');
Phi_Resiptory=Fastvar(sum(C<Infinite_Capacity),1,'Phi_Resiptory');
Psi_Resiptory=Fastvar(sum(C<Infinite_Capacity),1,'Psi_Resiptory');
a_S_Resiptory=Fastvar(length(S),1,'a_S_Resiptory');


a_S=a_S_Resiptory;
Sigma=Sigma_Resiptory;
Zeta=Zeta_Resiptory;


Phi=Fastvar(zeros(size(Link,1),1));
Phi(C<Infinite_Capacity)=Phi_Resiptory;


Psi=Fastvar(zeros(size(Link,1),1));
Psi(C<Infinite_Capacity)=Psi_Resiptory;


Theta_Dependency=Based_On_Free(B(find(Node_Type==1),:),sort([find(Node_Type==3);find(Node_Type==2)]));
Theta=Theta_Dependency*[0;Theta_Resiptory];  %%%% We set the Theta1 to be zero.  %%% Also, (B(find(Node_Type==1),:)*Theta_Dependency*rand(13,1)) results in zero

Leadings=Leading_Finder(B);
Lambda=Fastvar(zeros(Node_Number,1));
Lambda(Leadings)=((B(Leadings,Leadings))')^-1*((U(:,Leadings))'*(Phi-Psi)- B(setdiff(1:Node_Number,Leadings),Leadings)'*Lambda_Resiptory);
Lambda(setdiff(1:Node_Number,Leadings))=Lambda_Resiptory;

P_G=Fastvar(zeros(length(G),1));
P_G(find(Node_Type(G)==3))=P_G_Resiptory;
P_G(find(Node_Type(G)==2))=B(G(find(Node_Type(G)==2)),:)*Theta;



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
      

 
     

Ineq_Set=cell(1,Node_Number);
for i=1:Node_Number
        Ineq=[]; 
    if Node_Type(i)==3  && ismember(i,G)
    Ineq=[Ineq; P_G_Max(find(G==i))-P_G(find(G==i))];
    Ineq=[Ineq; P_G(find(G==i))-P_G_Min(find(G==i))];   
    Ineq=[Ineq; P_D_Max(find(D==i))-(P_G(find(G==i))-B(i,:)*Theta)];
    Ineq=[Ineq; P_G(find(G==i))-B(i,:)*Theta-P_D_Min(find(D==i))];
    Ineq=[Ineq; C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta];  %%%%  The  Vector C is replaced with C(,:) such that C([]) is a 0*1 dimension Matrix
    Ineq=[Ineq; C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta];
    Ineq=[Ineq; U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; Sigma(find(G==i))];
    Ineq=[Ineq; Sigma(find(G==i))+Lambda(i)-a(find(G==i))];    
    Ineq=[Ineq; Zeta(find(D==i))];
    Ineq=[Ineq; Zeta(find(D==i))-Lambda(i)+b(find(D==i))];
    Ineq=[Ineq; Phi(find(Link(:,1)==i))];
    Ineq=[Ineq; Phi(find(Link(:,2)==i))];
    Ineq=[Ineq; Psi(find(Link(:,1)==i))];
    Ineq=[Ineq; Psi(find(Link(:,2)==i))]; 
    end
    
    if Node_Type(i)==3  && ~ismember(i,G)
    Ineq=[Ineq; P_D_Max(find(D==i))-(-B(i,:)*Theta)];
    Ineq=[Ineq; -B(i,:)*Theta-P_D_Min(find(D==i))];
    Ineq=[Ineq; C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta];  %%%%  The  Vector C is replaced with C(,:) such that C([]) is a 0*1 dimension Matrix
    Ineq=[Ineq; C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta];
    Ineq=[Ineq; U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; Zeta(find(D==i))];
    Ineq=[Ineq; Zeta(find(D==i))-Lambda(i)+b(find(D==i))];
    Ineq=[Ineq; Phi(find(Link(:,1)==i))];
    Ineq=[Ineq; Phi(find(Link(:,2)==i))];
    Ineq=[Ineq; Psi(find(Link(:,1)==i))];
    Ineq=[Ineq; Psi(find(Link(:,2)==i))]; 
    end
    
     if Node_Type(i)==2
    Ineq=[Ineq; P_G_Max(find(G==i))-B(i,:)*Theta];
    Ineq=[Ineq; B(i,:)*Theta-P_G_Min(find(G==i))];   
    Ineq=[Ineq; C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta];  %%%%  The  Vector C is replaced with C(,:) such that C([]) is a 0*1 dimension Matrix
    Ineq=[Ineq; C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)-U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta];
    Ineq=[Ineq; U(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,1)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; U(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)*Theta+C(find(and(Link(:,2)==i,C<Infinite_Capacity)),:)];
    Ineq=[Ineq; Sigma(find(G==i))];
    Ineq=[Ineq; Sigma(find(G==i))+Lambda(i)-a(find(G==i))];    
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
    
    
    Ineq_Set{i}=Ineq;
    
end



Equl_Set=[];
Equl_Set=[Equl_Set; Sigma.*(P_G_Min-P_G)];
Equl_Set=[Equl_Set; (-a+ Lambda(G)+Sigma).*(P_G-P_G_Max)];

P_G_In_Node=[];
[Isin, Ind]=ismember(D,G);
for i=1:length(D)
    if  Isin(i)==1
        P_G_In_Node=[P_G_In_Node;P_G(Ind(i))];
    else
        P_G_In_Node=[P_G_In_Node;0];
    end  
end

Equl_Set=[Equl_Set; Zeta.*(P_D_Min-(P_G_In_Node-B(D,:)*Theta))];
Equl_Set=[Equl_Set; (b-Lambda(D)+Zeta).*((P_G_In_Node-B(D,:)*Theta)-P_D_Max)];
Equl_Set=[Equl_Set; Phi(C<Infinite_Capacity).*(C(C<Infinite_Capacity,:)+U(C<Infinite_Capacity,:)*Theta)];
Equl_Set=[Equl_Set; Psi(C<Infinite_Capacity).*(U(C<Infinite_Capacity,:)*Theta-C(C<Infinite_Capacity,:))];



Equl_SDP_Set=Equl_Set;
Ineq_SDP_Set=[];



for i=1:Node_Number
        Ineq_SDP_Set=[Ineq_SDP_Set;Ineq_Set{i}];
    for j=i:Node_Number
        Ineq_SDP_Set=[Ineq_SDP_Set;Expression_Product(Ineq_Set{i},Ineq_Set{j})];
    end
end


Objective=Lambda(G(Extract(G,G(Extract(G,S)))))'*P_G(Extract(G,G(Extract(G,S))))-c'*P_G(Extract(G,G(Extract(G,S)))) ;

% P_D=[];
% for i=1:length(D)
%     [Isin_Flage , Ind]=ismember(D(i),G);
%     if Isin_Flage
%     P_D=[P_D; P_G(Ind)-B(D(i),:)*Theta];
%     else
%     P_D=[P_D; -B(D(i),:)*Theta];
% 
%     end
% end
% 
% Delta=-a+Lambda(G)+Sigma;
% Xi=Zeta-Lambda(D)+b;
% 
% 
% Objective= -(a(Extract(G,S))')*P_G(Extract(G,S))+b'*P_D+ ...
%     Sigma(Extract(G,S))'*P_G_Min(Extract(G,S))-...
%     (Delta(Extract(G,S))')*P_G_Max(Extract(G,S))+...
%     Zeta'*P_D_Min- (Xi')*P_D_Max-(Phi')*C(C<Infinite_Capacity)-(Psi')*C(C<Infinite_Capacity)-...
%     (c(Extract(S,[])))'*P_G(Extract(G,G(Extract(G,S))));

Ineq_SDP_Overal=[Ineq_SDP_Overal,Ineq_SDP_Set];
Equl_SDP_Overal=[Equl_SDP_Overal,Equl_SDP_Set];
Objective_Overal=[Objective_Overal,Objective];


end

Ineq_SDP_Whole=cat(3,Ineq_SDP_Whole,Ineq_SDP_Overal);
Equl_SDP_Whole=cat(3,Equl_SDP_Whole,Equl_SDP_Overal);
Objective_Whole   =cat(3,Objective_Whole,Objective_Overal);

end





Constraints=[];
Len=Total_Number+1;
V=sdpvar(Len,Len,length(Scenario_Set),length(Time_Set));
Objective_Matrix=zeros(Len,Len);



for T=1:length(Time_Set)
for K=1:length(Scenario_Set)
      
    Objective_Matrix=Objective_Matrix+ShowMatrix(Objective_Whole(1,K,T))*V(:,:,K,T);

    Constraints=[Constraints;  V(1,1,K,T)==1];
    Constraints=[Constraints;  V(:,:,K,T)>=0];

    if K>=2
    Constraints=[Constraints;  V(1,ShowPosition(a_S),K,T)==V(1,ShowPosition(a_S),1,T)];
    end
   
    
    
    if T>=2
        
        for i=1:length(S)
            Constraints=[Constraints; -trace(ShowMatrix(P_G(find(ismember(G,S(i)))))*V(:,:,K,T))+trace(ShowMatrix(P_G(find(ismember(G,S(i)))))*V(:,:,K,T-1))+Gamma(i)];
        end
        
        for i=1:length(S)
            Constraints=[Constraints; trace(ShowMatrix(P_G(find(ismember(G,S(i)))))*V(:,:,K,T))-trace(ShowMatrix(P_G(find(ismember(G,S(i)))))*V(:,:,K,T-1))+Gamma(i)];
        end
        
    end
    
    
    
    Constraints=[Constraints;  ShowCompressMatrix(Ineq_SDP_Whole(:,K,T),'Regular')'* reshape(V(:,:,K,T),Len^2,1) >=0];
    Constraints=[Constraints;  ShowCompressMatrix(Equl_SDP_Whole(:,K,T),'Regular')'* reshape(V(:,:,K,T),Len^2,1) ==0];

end
end






Settings=sdpsettings('verbose',0,'solver','mosek','debug',1,'mosek.MSK_IPAR_NUM_THREADS',1);
fprintf(['IEEE ',num2str(IEEE_System),' Bus System is Passed to YALMIP\n'])
tic
Problem_Solved=optimize(Constraints,-trace(Objective_Matrix),Settings);
Time_Solver_SDP=toc;

if strcmp(Problem_Solved.info,'Unbounded objective function (MOSEK)')==1
    Optimal_Objective_SDP='Unbounded';
else
    Optimal_Objective_SDP=trace(value(Objective_Matrix))/length(Scenario_Set);
    V_Optimal=value(V);
end




