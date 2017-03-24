


if strcmp(computer,'MACI64')
addpath(genpath('/Users/Mahdi/Drive/Lab/matlabs/MPEC/SOS/yalmip'))
addpath(genpath('/Users/Mahdi/Drive/Lab/matlabs/MPEC/SOS/mosek/7/toolbox/r2013a'))
addpath('/Library/gurobi651/mac64/matlab')
addpath('../Jsonlab')
addpath('../Data_File')
end


if strcmp(computer,'GLNXA64')
addpath(genpath('/home/eegrad/ghamkhari/Yalmip/yalmip'))
addpath(genpath('/home/eegrad/ghamkhari/mosek/mosek/7/toolbox/r2013a'))
addpath('/home/eegrad/ghamkhari/Gurobi/gurobi651/linux64/matlab')
addpath('../Jsonlab')
addpath('../Data_File')
end





Infinite_Capacity=2;  %%%%%%%%%%  Infinite line capacity

Large=1000;           %%%%% Parameter for MILP (Partial) part.     



Threshold_Node=1;   %%%%%%%%%%  Threshold is Delta in algorithm 1
Threshold_Line=1;
Criteria_Node=.11;   %%%%%%%%%%%   Criteria is epsilon in algorithm 1
Criteria_Line=.11;
Partial_Feasible_Flage=0;
Time_Solver_Partial=0;



Result_Cleaner
Result_Saver
Data
Network
Showed_Positioner






Result_Saver





while (Partial_Feasible_Flage==0) && (Criteria_Node>=.01) && (Criteria_Line>=.01)

    
Criteria_Node=Criteria_Node-.01;
Criteria_Line=Criteria_Line-.01;


Reprocess

Data
Partial
Partial_Recovery


 
 if  strcmp(Res.sol.int.prosta,'PRIMAL_FEASIBLE')
     Partial_Feasible_Flage=1;
 end


end

Time_Solver_Partial=Time_Solver_Partial+Time_Solver_Partial_Instance;
Time_Total=Time_Solver_Partial+Time_Solver_SDP;
%%%%%%%%%%%%%%%% nan
Time_Yalmip_SDP=nan;
Optimal_Objective_Raw=nan;
%%%%%%%%%%%%%%%%%%% end of nan
Result_Saver



% Time_Total
% Optimal_Objective_SDP
% Optimal_Objective_Partial




 %a_S=a_S_Whole;
 %Stochastic_Check
% Optimal_Objective_Raw_Set;
 %Result_Saver




