P_G_Max=P_G_Max(:,Scenario_Set,Time_Set);
P_G_Min=P_G_Min(:,Scenario_Set,Time_Set);
P_D_Max=P_D_Max(:,Scenario_Set,Time_Set);
P_D_Min=P_D_Min(:,Scenario_Set,Time_Set);
      a=a(:,Scenario_Set,Time_Set);
      b=b(:,Scenario_Set,Time_Set);
      
      



Gamma=.1*Gamma_Coefficient*Gamma;
c=c*4;

Conjestion_Candidate_Lines=[3;17;30];

for i=1:Conjestion_Number
C(Conjestion_Candidate_Lines(i))=.1*Capacity_Coefficient;
end