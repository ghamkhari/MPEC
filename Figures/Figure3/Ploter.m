clc
close all

Figure_Number=3;
Joint=1;
Total_Simulation=24;



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

hold on
plot(Time_Solver_MILP_Set/60,'-ko')
plot(Time_Total_Set/60,'-b*')
ylabel('Computation Time (minutes)')
grid on
box on
axis([0,24,0,2500])
legend('MILP Approach in [1]','Proposed Approach','Location','northwest')
ax=gca;
ax.XTick=[0:4:24];
ax.XTickLabel=[0:4:24];
title('(a)')


ax1 = gca;
ax2 = axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','k','YColor','k');
set(ax2,'xlim',[0 10])% axes limit for zoom out,
set(ax2, 'Units', 'normalized', 'Position', [0.15 0.365 0.37 0.4])

hold on
plot(Time_Solver_MILP_Set/60,'-ko')
plot(Time_Total_Set/60,'-b*')
axis([0,24,0,25])



%figure('position', [360, 400, 560, 420/2])
figure

hold on
plot(Optimal_Objective_Partial_Set'./Optimal_Objective_MILP_Set','-b*')
%plot(1-abs(Optimal_Objective_SDP_Set-Optimal_Objective_MILP_Set)./Optimal_Objective_MILP_Set,'-k^')
xlabel('Scheduling  Horizon ')
ylabel('Optimality')
legend('Proposed Approach','Location','southwest')
grid on
box on
title('(b)')
axis([0,24,.95,1])
ax=gca;
ax.XTick=[0:4:24];
ax.XTickLabel=[0:4:24];

