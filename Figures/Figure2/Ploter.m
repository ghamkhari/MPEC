clc
close all
clear all

Figure_Number=2;
Joint=0;
Total_Simulation=10;
Time_Horizon=4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd ../..


cd(['Recovery_October_5_Cleanup/Figures/Figure_Results_',num2str(Figure_Number)])

addpath('../../../Result_Gatherers')


Result_Gatherer_SDP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd ../../..
cd October_7_Flage
cd (['Figures/Figure_Results_',num2str(Figure_Number)])

Result_Gatherer_MILP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd (['../../../Figures/Figure',num2str(Figure_Number)])






figure
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize', 11)

% Change default text fonts.
set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultTextFontSize', 11)



Time_Solver_MILP_Set_Mean=mean(Time_Solver_MILP_Set');
Time_Total_Set_Mean=mean(Time_Total_Set');

figure(1)
hold on
plot(Time_Solver_MILP_Set_Mean/60,'-ko')
plot(Time_Total_Set_Mean(1:end)/60,'-b*')
ylabel('Average Compution Time (minutes)')
grid on
box on
title('(a)')
legend('MILP Approach in [1]','Proposed Approach','Location','southwest')
axis([0,10,0,700])

% ax=gca;
% ax.XTick=[0:2:30];
% ax.XTickLabel=[0:2:30];

ax1 = gca;
ax2 = axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','k','YColor','k');
set(ax2,'xlim',[0 10])% axes limit for zoom out,
set(ax2, 'Units', 'normalized', 'Position', [0.195 0.41 0.4 0.4])

hold on
plot(Time_Solver_MILP_Set_Mean/60,'-ko')
plot(Time_Total_Set_Mean(1:end)/60,'-b*')
axis([0,10,0,16])
ax2.YTick=[0:4:16];
ax2.YTickLabel=[0:4:16];




%figure('position', [360, 400, 560, 420])
%figure('position', [360, 400, 560, 420/2])
figure 
hold on
plot(mean(Optimal_Objective_Partial_Set')./mean(Optimal_Objective_MILP_Set'),'-b*')
%plot(mean(Optimal_Objective_SDP_Set')./mean(Optimal_Objective_MILP_Set'),'-k^')
xlabel('Number of Scenarios')
ylabel({'Average Optimality'})
legend('Proposed Approach','Location','southwest')
axis([0,10,0.95,1])
grid on
box on
title('(b)')

Percent_of_cases_with_one_loop_Run_of_Algorithm1=sum(sum((Criteria_Set(1:1:end,:)==0.1)))/(Total_Simulation*(24/Time_Horizon))
Percent_of_cases_with_ten_loop_Run_of_Algorithm1=sum(sum((Criteria_Set(1:1:end,:)<0.01)))/(Total_Simulation*(24/Time_Horizon))

% ax=gca;
% ax.XTick=[0:2:20];
% ax.XTickLabel=[0:2:20];
% 


