clc
close all

Figure_Number=6;
Joint=1;
Total_Simulation=80;



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
set(0,'DefaultAxesFontSize', 10)

% Change default text fonts.
set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultTextFontSize', 10)

hold on
plot(Time_Solver_MILP_Set(30:10:80)/60,'-ko')
plot(Time_Total_Set(30:10:80)/60,'-b*')
ylabel('Computation Time (minutes)')
grid on
box on
%axis([0,24,0,1.5*10^5])
legend('MILP Approach in [1]','Proposed Approach','Location','northeast')
 axis([1,6,0,4000])
ax=gca;
ax.XTick=[1:1:6];
ax.XTickLabel=[30:10:80];


figure
hold on
plot(Optimal_Objective_Partial_Set(30:10:80)'./Optimal_Objective_MILP_Set(30:10:80)','-b*')
%plot(1-abs(Optimal_Objective_SDP_Set-Optimal_Objective_MILP_Set)./Optimal_Objective_MILP_Set,'-k^')
xlabel('Number of Nodes ')
ylabel('Optimality')
legend('Proposed Approach','Location','southeast')
grid on
box on
axis([1,6,.95,1])
ax=gca;
ax.XTick=[1:1:6];
ax.XTickLabel=[30:10:80];


