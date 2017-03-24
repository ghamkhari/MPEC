clc

Solution=nan*ones(Total_Number+1,1);
Solution(1)=1;

for T=1:length(Time_Set)
    
    Solution(ShowPosition(P_G_Resiptory(:,1,T)))=P_G_Cvx(:,1,T);
    Solution(ShowPosition(P_D_Resiptory(:,1,T)))=P_D_Cvx(:,1,T);
    Solution(ShowPosition(Theta_Resiptory(:,1,T)))=Theta_Cvx(:,1,T);
    Solution(ShowPosition(Lambda_Resiptory(:,1,T)))=[Lambda_Cvx{:,1,T}]';
    Solution(ShowPosition(Phi_Resiptory(:,1,T)))=Phi_Cvx{1,T}(C<Infinite_Capacity);
    Solution(ShowPosition(Psi_Resiptory(:,1,T)))=Psi_Cvx{1,T}(C<Infinite_Capacity);
    Solution(ShowPosition(Sigma_Resiptory(:,1,T)))=[Sigma_Cvx{:,1,T}]';
    Solution(ShowPosition(Delta_Resiptory(:,1,T)))=[Delta_Cvx{:,1,T}]';
    Solution(ShowPosition(Zeta_Resiptory(:,1,T)))=[Zeta_Cvx{:,1,T}]';
    Solution(ShowPosition(Xi_Resiptory(:,1,T)))=[Xi_Cvx{:,1,T}]';
    
    Solution(ShowPosition(R_Phi_Resiptory(:,1,T)))=~(Phi_Cvx{1,T}(C<Infinite_Capacity)>=.0001);
    Solution(ShowPosition(R_Psi_Resiptory(:,1,T)))=~(Psi_Cvx{1,T}(C<Infinite_Capacity)>=.0001);
    Solution(ShowPosition(R_Sigma_Resiptory(:,1,T)))=~([Sigma_Cvx{:,1,T}]'>=.0001);
    Solution(ShowPosition(R_Delta_Resiptory(:,1,T)))=~([Delta_Cvx{:,1,T}]'>=.0001);
    Solution(ShowPosition(R_Zeta_Resiptory(:,1,T)))=~([Zeta_Cvx{:,1,T}]'>=.0001);
    Solution(ShowPosition(R_Xi_Resiptory(:,1,T)))=~([Xi_Cvx{:,1,T}]'>=.0001);
    Solution(ShowPosition(a_S_Resiptory(:,1,T)))=300*ones(length(S),1);
    
    
    

    
end




