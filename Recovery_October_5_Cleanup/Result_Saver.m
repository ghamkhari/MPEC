%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if  exist('Figures', 'dir') == 7
    cd Figures 
else
    mkdir('Figures')
    cd Figures   
    
end



if exist(['Figure_Results_',num2str(Figure_Number)], 'dir') == 7
    cd  (['Figure_Results_',num2str(Figure_Number)]) 
else
    mkdir(['Figure_Results_',num2str(Figure_Number)])
    cd   (['Figure_Results_',num2str(Figure_Number)])
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if Joint==1
    
Result_Point.Optimal_Objective_SDP=Optimal_Objective_SDP;
Result_Point.Criteria=Criteria_Node;
Result_Point.Optimal_Objective_Partial=Optimal_Objective_Partial;
Result_Point.Optimal_Objective_Raw=Optimal_Objective_Raw;
Result_Point.Time_Solver_Partial=Time_Solver_Partial;
Result_Point.Time_Solver_SDP=Time_Solver_SDP;
Result_Point.Time_Yalmip_SDP=Time_Yalmip_SDP;
Result_Point.Time_Total=Time_Total;



savejson('',Result_Point,['Result_Point_Simulation_Index_',num2str(Simulation_Index)]);

end



if Joint==0
    

Result_Point.Optimal_Objective_SDP=Optimal_Objective_SDP;
Result_Point.Criteria=Criteria_Node;
Result_Point.Optimal_Objective_Partial=Optimal_Objective_Partial;
Result_Point.Optimal_Objective_Raw=Optimal_Objective_Raw;
Result_Point.Time_Solver_Partial=Time_Solver_Partial;
Result_Point.Time_Solver_SDP=Time_Solver_SDP;
Result_Point.Time_Yalmip_SDP=Time_Yalmip_SDP;
Result_Point.Time_Total=Time_Total;
    
    

savejson('',Result_Point,['Result_Point_Simulation_Index_',num2str(Simulation_Index),'_Time_Interval_',num2str(Time_Interval)]);

    
end

cd ../..
