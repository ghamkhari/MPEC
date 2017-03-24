clc

load('V_MILP')
for i=1:length(Ineq_SDP_Whole)
    
    if trace(ShowMatrix(Ineq_SDP_Whole(i))*V_MILP)<=-10^-12
        i
        error('Inequality: ')
        
        
        
    end
end


for i=1:length(Equl_SDP_Whole)
    
    if abs(trace(ShowMatrix(Equl_SDP_Whole(i))*V_MILP))>=10^-12
        i
        error('Equality:') 
        
        
    end
end
trace(ShowMatrix(sum(sum(Objective_Whole)))*V_MILP)

