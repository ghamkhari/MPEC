Unbounded_Count_Fampa=0;


if Joint==1
    
            Optimal_Objective_Fampa_Set=nan*ones(Total_Simulation,1);
            Time_Solver_Fampa_Set=nan*ones(Total_Simulation,1);
    
    for Simulation_Index=1:Total_Simulation
        if exist([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index)],'file')==2
            Jsn=loadjson([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index)]);
            
                if strcmp(Jsn.Optimal_Objective_Fampa,'Unbounded')==1
                Optimal_Objective_Fampa_Set(Simulation_Index)=nan;
                Time_Solver_Fampa_Set(Simulation_Index)=nan;
                Unbounded_Count_Fampa=Unbounded_Count_Fampa+1;
                else
            
            Optimal_Objective_Fampa_Set(Simulation_Index)=Jsn.Optimal_Objective_Fampa;
            Time_Solver_Fampa_Set(Simulation_Index)=Jsn.Time_Solver_Fampa;
                end
        end
    end
end




if Joint==0
    
            Optimal_Objective_Fampa_Set=nan*ones(Total_Simulation,24/Time_Horizon);
            Time_Solver_Fampa_Set=nan*ones(Total_Simulation,24/Time_Horizon);
    
    for Time_Index=1:(24/Time_Horizon)
        for Simulation_Index=1:Total_Simulation
            if exist([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index),'_Time_Interval_',num2str(Time_Index)],'file')==2
                Jsn=loadjson([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index),'_Time_Interval_',num2str(Time_Index)]);
                
                if strcmp(Jsn.Optimal_Objective_Fampa,'Unbounded')==1
                Optimal_Objective_Fampa_Set(Simulation_Index,Time_Index)=nan;
                Time_Solver_Fampa_Set(Simulation_Index,Time_Index)=nan;
                Unbounded_Count_Fampa=Unbounded_Count_Fampa+1;
                else
                Optimal_Objective_Fampa_Set(Simulation_Index,Time_Index)=Jsn.Optimal_Objective_Fampa;
                Time_Solver_Fampa_Set(Simulation_Index,Time_Index)=Jsn.Time_Solver_Fampa;
                end
            end
        end
    end
end

