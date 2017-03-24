


if Joint==1
    
            Optimal_Objective_PsatzNoSparse_Set=nan*ones(Total_Simulation,1);
            Time_Solver_PsatzNoSparse_Set=nan*ones(Total_Simulation,1);
    
    for Simulation_Index=1:Total_Simulation
        if exist([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index)],'file')==2
            Jsn=loadjson([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index)]);
            
            Optimal_Objective_PsatzNoSparse_Set(Simulation_Index)=Jsn.Optimal_Objective_PsatzNoSparse;
            Time_Solver_PsatzNoSparse_Set(Simulation_Index)=Jsn.Time_Solver_PsatzNoSparse;
        end
    end
end




if Joint==0
    
            Optimal_Objective_PsatzNoSparse_Set=nan*ones(Total_Simulation,24/Time_Horizon);
            Time_Solver_PsatzNoSparse_Set=nan*ones(Total_Simulation,24/Time_Horizon);
    
    for Time_Index=1:Single_Time_Last
        for Simulation_Index=1:Total_Simulation
            if exist([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index),'_Time_Slot_',num2str(Time_Index)],'file')==2
                Jsn=loadjson([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index),'_Time_Slot_',num2str(Time_Index)]);
                Optimal_Objective_PsatzNoSparse_Set(Simulation_Index,Time_Index)=Jsn.Optimal_Objective_PsatzNoSparse;
                Time_Solver_PsatzNoSparse_Set(Simulation_Index,Time_Index)=Jsn.Time_Solver_PsatzNoSparse;
            end
        end
    end
end

