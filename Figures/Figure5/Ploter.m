clc
close all

Figure_Number=5;
Joint=1;
Total_Simulation=10;



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






figure(1)
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize', 11)

% Change default text fonts.
set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultTextFontSize', 11)

hold on
plot(.1:.1:1,Time_Solver_MILP_Set(1:end)/60,'-ko')
plot(.1:.1:1,Time_Total_Set(1:end)/60,'-b*')
ylabel('Computation Time (minutes)')
axis([.1,.5,0,200])
grid on
box 
title('(a)')
legend('MILP Approach in [1]','Proposed Approach')
ax=gca;



%figure('position', [360, 400, 560, 420/2])
figure

hold on
plot(.1:.1:1,Optimal_Objective_Partial_Set(1:end)./Optimal_Objective_MILP_Set(1:end),'-b*')
%plot(.2:.1:1,1-abs(Optimal_Objective_SDP_Set(2:end)-Optimal_Objective_MILP_Set(2:end))./Optimal_Objective_MILP_Set(2:end),'-k^')

xlabel('Ramp Prameter \Gamma')
ylabel('Optimality')
legend('Proposed Approach','Location','southeast')
axis([.1,.5,.95,1])

grid on
box on
title('(b)')

