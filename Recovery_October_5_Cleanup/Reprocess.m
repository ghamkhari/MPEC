

Sigma_Whole=[];
Delta_Whole=[];
Zeta_Whole=[];
Xi_Whole=[];
P_G_Whole=[];
P_D_Whole=[];
Phi_Whole=[];
Psi_Whole=[];
Theta_Whole=[];
Lambda_Whole=[];
Omega_Whole=[];
Nu_Whole=[];
Omega_Next_Whole=[];
Nu_Next_Whole=[];
a_S_Whole=[];


R_Sigma_Whole=[];
R_Delta_Whole=[];
R_Zeta_Whole=[];
R_Xi_Whole=[];
R_Phi_Whole=[];
R_Psi_Whole=[];
R_Omega_Whole=[];
R_Nu_Whole=[];






for T=1:length(Time_Set)
    
Sigma_Overal=[];
Delta_Overal=[];
Zeta_Overal=[];
Xi_Overal=[];
P_G_Overal=[];
P_D_Overal=[];
Phi_Overal=[];
Psi_Overal=[];
Theta_Overal=[];
Lambda_Overal=[];
a_S_Overal=[];



R_Sigma_Overal=[];
R_Delta_Overal=[];
R_Zeta_Overal=[];
R_Xi_Overal=[];
R_Phi_Overal=[];
R_Psi_Overal=[];


    
for K=1:length(Scenario_Set)
    
    V=V_Optimal(:,:,K,T);
    Data
    Single
    Recover
    Integer_Analyzer
    

    Sigma_Overal=[Sigma_Overal, Sigma_Value];
    Delta_Overal=[Delta_Overal, Delta_Value ];
    Zeta_Overal=[Zeta_Overal, Zeta_Value];
    Xi_Overal=[Xi_Overal ,Xi_Value];
    P_G_Overal=[P_G_Overal ,P_G_Value];
    P_D_Overal=[P_D_Overal ,P_D_Value];
    Phi_Overal=[Phi_Overal Phi_Value];
    Psi_Overal=[Psi_Overal , Psi_Value];
    Theta_Overal=[Theta_Overal , Theta_Value];
    Lambda_Overal=[Lambda_Overal, Lambda_Value];
    
    
    a_S_Overal= a_S_Value; 
    
    
R_Sigma_Overal=[R_Sigma_Overal, R_Sigma];
R_Delta_Overal=[R_Delta_Overal, R_Delta];
R_Zeta_Overal=[R_Zeta_Overal, R_Zeta];
R_Xi_Overal=[R_Xi_Overal, R_Xi];
R_Phi_Overal=[R_Phi_Overal, R_Phi];
R_Psi_Overal=[R_Psi_Overal, R_Psi];

    
end



Sigma_Whole=cat(3,Sigma_Whole,Sigma_Overal);
Delta_Whole=cat(3,Delta_Whole,Delta_Overal);
Zeta_Whole=cat(3,Zeta_Whole,Zeta_Overal);
Xi_Whole=cat(3,Xi_Whole,Xi_Overal);
P_G_Whole=cat(3,P_G_Whole,P_G_Overal);
P_D_Whole=cat(3,P_D_Whole,P_D_Overal);
Phi_Whole=cat(3,Phi_Whole,Phi_Overal);
Psi_Whole=cat(3,Psi_Whole,Psi_Overal);
Theta_Whole=cat(3,Theta_Whole,Theta_Overal);
Lambda_Whole=cat(3,Lambda_Whole,Lambda_Overal);
a_S_Whole=cat(3,a_S_Whole,a_S_Overal);





R_Sigma_Whole=cat(3,R_Sigma_Whole,R_Sigma_Overal);
R_Delta_Whole=cat(3,R_Delta_Whole,R_Delta_Overal);
R_Zeta_Whole=cat(3,R_Zeta_Whole,R_Zeta_Overal);
R_Xi_Whole=cat(3,R_Xi_Whole,R_Xi_Overal);
R_Phi_Whole=cat(3,R_Phi_Whole,R_Phi_Overal);
R_Psi_Whole=cat(3,R_Psi_Whole,R_Psi_Overal);




end



R_Sigma_Trusted=R_Sigma_Whole;
R_Delta_Trusted=R_Delta_Whole;
R_Zeta_Trusted=R_Zeta_Whole;
R_Xi_Trusted=R_Xi_Whole;
R_Phi_Trusted=R_Phi_Whole;
R_Psi_Trusted=R_Psi_Whole;




