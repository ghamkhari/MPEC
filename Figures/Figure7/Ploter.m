clc
close all
clear all

Figure_Number=7;
Joint=1;
Total_Simulation=5;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd ../..


cd(['Recovery_October_5_Cleanup/Figures/Figure_Results_',num2str(Figure_Number)])

addpath('../../../Result_Gatherers')


Result_Gatherer_SDP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ../../..

cd(['Regular/Figures/Figure_Results_',num2str(Figure_Number)])

addpath('../../../Result_Gatherers')


Result_Gatherer_Regular
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ../../..

cd(['Fampa/Figures/Figure_Results_',num2str(Figure_Number)])

addpath('../../../Result_Gatherers')


Result_Gatherer_Fampa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ../../..

cd(['Haghighat/Figures/Figure_Results_',num2str(Figure_Number)])

addpath('../../../Result_Gatherers')


Result_Gatherer_Haghighat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ../../..
 
cd (['October_7_Flage/Figures/Figure_Results_',num2str(Figure_Number)])

Result_Gatherer_MILP

addpath('../../../Result_Gatherers')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd (['../../../Figures/Figure',num2str(Figure_Number)])



Optimal_Objective_Fampa_Set
Optimal_Objective_Regular_Set
Optimal_Objective_Haghighat_Set
Optimal_Objective_MILP_Set
Optimal_Objective_SDP_Set


% % % % % 
% % % % % figure
% % % % % set(0,'DefaultAxesFontName', 'Times New Roman')
% % % % % set(0,'DefaultAxesFontSize', 10)
% % % % % 
% % % % % % Change default text fonts.
% % % % % set(0,'DefaultTextFontname', 'Times New Roman')
% % % % % set(0,'DefaultTextFontSize', 10)
% % % % % 
% % % % % subplot(2,1,1)
% % % % % hold on
% % % % % plot(Time_Solver_SDP_Set,'-b*')
% % % % % plot(Time_Solver_Regular_Set,'--r+')
% % % % % plot(Time_Solver_Fampa_Set,'-r^')
% % % % % plot(Time_Solver_Haghighat_Set,'-gv')
% % % % % %plot(Time_Solver_MILP_Set,'-ko')
% % % % % ylabel('Computation Time (seconds)')
% % % % % grid on
% % % % % box on
% % % % % %axis([0,Total_Simulation,0,2000])
% % % % % legend('Proposed Approach','SDP Relaxation','The Approach in [12]','The Approach in [13]','Location','northeast')
% % % % % % ax=gca;
% % % % % % ax.XTick=[0:1:Total_Simulation];
% % % % % % ax.XTickLabel=[0:1:Total_Simulation];
% % % % % 
% % % % % subplot(2,1,2)
% % % % % hold on
% % % % % plot(abs(Optimal_Objective_SDP_Set'./Optimal_Objective_MILP_Set'-1),'-b*')
% % % % % plot(abs(Optimal_Objective_Regular_Set'./Optimal_Objective_MILP_Set'-1),'--r+')
% % % % % plot(abs(Optimal_Objective_Fampa_Set'./Optimal_Objective_MILP_Set'-1),'-r^')
% % % % % plot(abs(Optimal_Objective_Haghighat_Set'./Optimal_Objective_MILP_Set'-1),'-gv')
% % % % % 
% % % % % %plot(1-abs(Optimal_Objective_SDP_Set-Optimal_Objective_MILP_Set)./Optimal_Objective_MILP_Set,'-k^')
% % % % % xlabel('Scheduling  Horizon ')
% % % % % ylabel({'Relative Error in', 'Relaxation Gap'})
% % % % % legend('Proposed Approach','SDP Relaxation','The Approach in [12]','The Approach in [13]','Location','northeast')
% % % % % grid on
% % % % % box on
% % % % % %axis([0,Total_Simulation,.96,1])
% % % % % % ax=gca;
% % % % % % ax.XTick=[0:1:Total_Simulation];
% % % % % % ax.XTickLabel=[0:1:Total_Simulation];
% % % % % 
