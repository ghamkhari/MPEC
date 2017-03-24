


if Joint==1
    
            Optimal_Objective_Partial_Set=nan*ones(Total_Simulation,1);
            Optimal_Objective_SDP_Set=nan*ones(Total_Simulation,1);
            Time_Total_Set=nan*ones(Total_Simulation,1);
            Time_Solver_Partial_Set=nan*ones(Total_Simulation,1);
            Time_Solver_SDP_Set=nan*ones(Total_Simulation,1);
            Criteria_Set=nan*ones(Total_Simulation,1);
    
    for Simulation_Index=1:Total_Simulation
        if exist([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index)],'file')==2
            Jsn=loadjson([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index)]);
            
            Optimal_Objective_Partial_Set(Simulation_Index)=Jsn.Optimal_Objective_Partial;
            Optimal_Objective_SDP_Set(Simulation_Index)=Jsn.Optimal_Objective_SDP;
            Time_Total_Set(Simulation_Index)=Jsn.Time_Total;
            Time_Solver_Partial_Set(Simulation_Index)=Jsn.Time_Solver_Partial;
            Time_Solver_SDP_Set(Simulation_Index)=Jsn.Time_Solver_SDP;
            Criteria_Set(Simulation_Index)=Jsn.Criteria;
        end
    end
end




if Joint==0
    
            Optimal_Objective_Partial_Set=nan*ones(Total_Simulation,24/Time_Horizon);
            Optimal_Objective_SDP_Set=nan*ones(Total_Simulation,24/Time_Horizon);
            Time_Total_Set=nan*ones(Total_Simulation,24/Time_Horizon);
            Time_Solver_Partial_Set=nan*ones(Total_Simulation,24/Time_Horizon);
            Time_Solver_SDP_Set=nan*ones(Total_Simulation,24/Time_Horizon);
            Criteria_Set=nan*ones(Total_Simulation,24/Time_Horizon);
    
    for Time_Index=1:(24/Time_Horizon)
        for Simulation_Index=1:Total_Simulation
            if exist([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index),'_Time_Interval_',num2str(Time_Index)],'file')==2
                Jsn=loadjson([pwd filesep 'Result_Point_Simulation_Index_',num2str(Simulation_Index),'_Time_Interval_',num2str(Time_Index)]);
                Optimal_Objective_Partial_Set(Simulation_Index,Time_Index)=Jsn.Optimal_Objective_Partial;
                Optimal_Objective_SDP_Set(Simulation_Index,Time_Index)=Jsn.Optimal_Objective_SDP;
                Time_Total_Set(Simulation_Index,Time_Index)=Jsn.Time_Total;
                Time_Solver_Partial_Set(Simulation_Index,Time_Index)=Jsn.Time_Solver_Partial;
                Time_Solver_SDP_Set(Simulation_Index,Time_Index)=Jsn.Time_Solver_SDP;
                Criteria_Set(Simulation_Index,Time_Index)=Jsn.Criteria;
            end
        end
    end
end

