
P_G_Value=Res.sol.int.xx(P_G_Resiptory.ShowPosition);
R_Sigma_Value=Res.sol.int.xx(R_Sigma_Resiptory.ShowPosition);
R_Delta_Value=Res.sol.int.xx(R_Delta_Resiptory.ShowPosition);
R_Zeta_Value=Res.sol.int.xx(R_Zeta_Resiptory.ShowPosition);
R_Xi_Value=Res.sol.int.xx(R_Xi_Resiptory.ShowPosition);
Theta_Value=Res.sol.int.xx(Theta_Resiptory.ShowPosition);
Lambda_Value=Res.sol.int.xx(Lambda_Resiptory.ShowPosition);
P_D_Value=Res.sol.int.xx(P_D_Resiptory.ShowPosition);
Sigma_Value=Res.sol.int.xx(Sigma_Resiptory.ShowPosition);
Delta_Value=Res.sol.int.xx(Delta_Resiptory.ShowPosition);
Zeta_Value=Res.sol.int.xx(Zeta_Resiptory.ShowPosition);
Xi_Value=Res.sol.int.xx(Xi_Resiptory.ShowPosition);
a_S_Value=Res.sol.int.xx(a_S.ShowPosition);

Phi_Value=zeros(size(Link,1),length(Scenario_Set),length(Time_Set));
Phi_Value(C<Infinite_Capacity,:,:)=Res.sol.int.xx(reshape(Phi_Resiptory.ShowPosition,sum(C<Infinite_Capacity),length(Scenario_Set),length(Time_Set)));

Psi_Value=zeros(size(Link,1),length(Scenario_Set),length(Time_Set));
Psi_Value(C<Infinite_Capacity,:,:)=Res.sol.int.xx(reshape(Psi_Resiptory.ShowPosition,sum(C<Infinite_Capacity),length(Scenario_Set),length(Time_Set)));

R_Phi_Value=ones(size(Link,1),length(Scenario_Set),length(Time_Set));
R_Phi_Value(C<Infinite_Capacity,:,:)=Res.sol.int.xx(reshape(R_Phi_Resiptory.ShowPosition,sum(C<Infinite_Capacity),length(Scenario_Set),length(Time_Set)));

R_Psi_Value=ones(size(Link,1),length(Scenario_Set),length(Time_Set));
R_Psi_Value(C<Infinite_Capacity,:,:)=Res.sol.int.xx(reshape(R_Psi_Resiptory.ShowPosition,sum(C<Infinite_Capacity),length(Scenario_Set),length(Time_Set)));






