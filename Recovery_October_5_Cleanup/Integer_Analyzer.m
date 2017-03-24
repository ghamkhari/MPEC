



R_Sigma=0.5*ones(length(G),1);
R_Delta=0.5*ones(length(G),1);
R_Zeta=0.5*ones(length(D),1);
R_Xi=0.5*ones(length(D),1);
R_Psi=0.5*ones(size(Link,1),1);
R_Phi=0.5*ones(size(Link,1),1);







   R_Sigma( and(Sigma_Value>=Threshold_Node,P_G_Value-P_G_Min<=Criteria_Node))=0;
   R_Sigma( and(P_G_Value-P_G_Min>=Threshold_Node,Sigma_Value<=Criteria_Node))=1;
   %R_Sigma(find(ismember(G,S)),:)=1;
   %R_Sigma(find(ismember(G,S)),:)=.5;

   
   R_Delta( and(Delta_Value>=Threshold_Node,P_G_Max-P_G_Value<=Criteria_Node))=0;
   R_Delta( and(P_G_Max-P_G_Value>=Threshold_Node,Delta_Value<=Criteria_Node))=1;
   %R_Delta(find(ismember(G,S)),:)=0;
   %R_Delta(find(ismember(G,S)),:)=.5;
   
   
  
   R_Zeta( and(Zeta_Value>=Threshold_Node,P_D_Value-P_D_Min<=Criteria_Node))=0;
   R_Zeta( and(P_D_Value-P_D_Min>=Threshold_Node,Zeta_Value<=Criteria_Node))=1;
   
   R_Xi( and(Xi_Value>=Threshold_Node,P_D_Max-P_D_Value<=Criteria_Node))=0;
   R_Xi( and(P_D_Max-P_D_Value>=Threshold_Node,Xi_Value<=Criteria_Node))=1;
   
   R_Psi(and(Psi_Value>=Threshold_Line,C-U*Theta_Value <= Criteria_Line))=0;
   R_Psi(and(C-U*Theta_Value >= Threshold_Line,Psi_Value<=Criteria_Line))=1;  
   R_Psi(~(C<Infinite_Capacity),ones(1,length(Scenario_Set),length(Time_Set)))=1;

   
   R_Phi(and(Phi_Value>=Threshold_Line,C+U*Theta_Value <= Criteria_Line))=0;
   R_Phi(and(C+U*Theta_Value >= Threshold_Line,Phi_Value<=Criteria_Line))=1; 
   R_Phi(~(C<Infinite_Capacity),ones(1,length(Scenario_Set),length(Time_Set)))=1;
