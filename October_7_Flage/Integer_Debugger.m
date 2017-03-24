load('R_Sigma_Trusted') 
load('R_Delta_Trusted')
load('R_Zeta_Trusted')
load('R_Xi_Trusted')
load('R_Phi_Trusted')
load('R_Psi_Trusted')
% load('R_Omega_Trusted')
%load('R_Nu_Trusted')

% R_Zeta_Trusted(15,1,1)=1;
% R_Zeta_Trusted(15,2,1)=1;
% R_Zeta_Trusted(15,3,1)=1;



for i=1:length(G)
    for T=1:length(Time_Set)
        
        for K=1:length(Scenario_Set)
            
            if R_Sigma_Trusted(i,K,T)==1 && R_Sigma_Value(i,K,T)==0
                error('Error')
            end
            
            if R_Sigma_Trusted(i,K,T)==0  && R_Sigma_Value(i,K,T)==1
                error('Error')
            end
        end
    end
    
end




for i=1:length(G)
    for T=1:length(Time_Set)
        
        for K=1:length(Scenario_Set)
            
            
            if R_Delta_Trusted(i,K,T)==1 && R_Delta_Value(i,K,T)==0
                error('Error')
            end
            
            if R_Delta_Trusted(i,K,T)==0  && R_Delta_Value(i,K,T)==1
                error('Error')
            end
        end
    end
    
end



for i=1:length(D)
    for T=1:length(Time_Set)
        
        for K=1:length(Scenario_Set)
            
            
            if R_Zeta_Trusted(i,K,T)==1 && R_Zeta_Value(i,K,T)==0
                error('Error')
            end
            
            if R_Zeta_Trusted(i,K,T)==0  && R_Zeta_Value(i,K,T)==1
                error('Error')
            end
        end
    end
    
end


for i=1:length(D)
    for T=1:length(Time_Set)
        
        for K=1:length(Scenario_Set)
            
            if R_Xi_Trusted(i,K,T)==1 && R_Xi_Value(i,K,T)==0
                error('Error')
            end
            
            if R_Xi_Trusted(i,K,T)==0  && R_Xi_Value(i,K,T)==1
                error('Error')
            end
            
        end
    end
    
end



for i=1:length(Phi)
    for T=1:length(Time_Set)
        for K=1:length(Scenario_Set)
            
            
            if R_Phi_Trusted(i,K,T)==1 && R_Phi_Value(i,K,T)==0
                error('Error')
            end
            
            if R_Phi_Trusted(i,K,T)==0  && R_Phi_Value(i,K,T)==1
                error('Error')
            end
        end
    end
    
end

for i=1:length(G)
    for T=1:length(Time_Set)
        for K=1:length(Scenario_Set)
            
            
            if R_Psi_Trusted(i,1,T)==1 && R_Psi_Value(i,1,T)==0
                error('Error')
            end
            
            if R_Psi_Trusted(i,1,T)==0  && R_Psi_Value(i,1,T)==1
                error('Error')
            end
        end
    end
    
end


% for i=1:length(G)
%     for T=1:length(Time_Set)
%         
%         if R_Omega_Trusted(i,1,T)==1 && R_Omega_Value(i,1,T)==0
%             error('Error')
%         end
%         
%         if R_Omega_Trusted(i,1,T)==0  && R_Omega_Value(i,1,T)==1
%             error('Error')
%         end
%     end
%     
% end
% 
% for i=1:length(G)
%     for T=1:length(Time_Set)
%         
%         if R_Nu_Trusted(i,1,T)==1 && R_Nu_Value(i,1,T)==0
%             error('Error')
%         end
%         
%         if R_Nu_Trusted(i,1,T)==0  && R_Nu_Value(i,1,T)==1
%             error('Error')
%         end
%     end
%     
% end