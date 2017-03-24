#!/bin/bash
clear screen 



Maximum_CPU_Server=28






############################# Contains function 

function contains() 

{   
    declare -a Set=("${!1}")
    declare -a Member=$2
      
    declare -a Flage=0
    for Element in ${Set[@]}
    do
     
     if  [ "$Element" -eq "$Member" ]
     then 
     Flage=1
     fi
    
    done
    echo $Flage
    
}

##################################### End of Contains function

##########################################  subtraction function 


function subtraction()
{

declare -a Subtracted
declare -a Set1=("${!1}")
declare -a Set2=("${!2}")


for Element in ${Set1[@]}
do

Flage=$(contains Set2[@]  $Element)
Zero=0

if   [[ "Flage" -eq "Zero" ]];
then
Subtracted+=($Element)
fi

done

echo  
for Element in ${Subtracted[@]}; do echo "$Element"; done 
echo 


}


######################################       end of subtraction function





############################################ function  free_finder

function  free_finder
{
unset CPU_Free
declare -a CPU_Free
declare -a CPU_Busy

All_CPU=$(eval  echo {0..$[$Maximum_CPU_Server-1]})

Count=0
for i in $(pidof MATLAB)
do 
Count=$[$Count+1]
done

Zero=0
if  [[ "$Count" -gt 0 ]]
then
CPU_Busy=$( ps -o pid,psr,comm -p $(pidof MATLAB) | awk '{print$2}' | tail -n +2)
fi


CPU_Free=$(subtraction All_CPU[@]  CPU_Busy[@] )

for Element in ${CPU_Free[@]} 
do
echo "$Element"
done

}




############################################ end of function free_finder


###########################################  function   queuer


function queuer
{
                     

  while true
  do         
               #CPU_Free=$(free_finder)
               #Flage=${#CPU_Free[@]}
               #Check=1
               Count=0
               for i in $(pidof MATLAB)
               do 
               Count=$[$Count+1]
               done
               
              #if   [[ "$Flage" -eq "$Check" ]] 
              if [[ "$Count" -lt "$Maximum_CPU_Server" ]] 
              then
                      break
              fi
              sleep 1
  done
  }
#################################################

#############################################  end of queuer function






############################################

function cpu_chooser 
{

declare -a CPU_Free=$(free_finder)


Min=$Maximum_CPU_Server

for Element in ${CPU_Free[@]}
do
if   [[ "$Element" -lt "$Min" ]];
then
  Min=$Element
fi
done

echo $Min

}


#######################################





exec > MatlabOutPut.txt

cd ../..




IEEE_System="30"
Number_Scenario="0"

while  [ $Number_Scenario -lt  1  ]
do

Number_Scenario=$[$Number_Scenario+1]
 
Time_Horizen="0"
Begin_Time="1"

while [ $Time_Horizen  -lt  5 ]
do

Time_Horizen=$[$Time_Horizen+1]

End_Time=$[$Begin_Time+$Time_Horizen-1]


#############################################  Begin of Our Approach
sleep 1
queuer


cd Recovery_October_5_Cleanup
matlab -nosplash -nodisplay -nodesktop << Matlab_Commands     &


 
clear all;
clc;
close all;
clear classes;





IEEE_System=$IEEE_System
Time_Set=[$Begin_Time:$End_Time];
Scenario_Set=1:$Number_Scenario;
Capacity_Coefficient=2;   
Gamma_Coefficient= 3; 
Conjestion_Number=1;    
Figure_Number=7;
Simulation_Total=5;
Simulation_Index=$Time_Horizen;
Joint=1;
Main;
quit;  
Matlab_Commands

Pid_Matlab=$!






CPU_Index=$(cpu_chooser)
taskset -cp $CPU_Index $Pid_Matlab

cd ..

################################################# Begin of Regular SDP
sleep 1
queuer


cd Regular
matlab -nosplash -nodisplay -nodesktop << Matlab_Commands     &


 
clear all;
clc;
close all;
clear classes;





IEEE_System=$IEEE_System
Time_Set=[$Begin_Time:$End_Time];
Scenario_Set=1:$Number_Scenario;
Capacity_Coefficient=2;   
Gamma_Coefficient= 3; 
Conjestion_Number=1;    
Figure_Number=7;
Simulation_Total=5;
Simulation_Index=$Time_Horizen;
Joint=1;
Main;
quit;  
Matlab_Commands

Pid_Matlab=$!






CPU_Index=$(cpu_chooser)
taskset -cp $CPU_Index $Pid_Matlab

cd ..

#################################################  Being of Fampa Approach
sleep 1
queuer


cd Fampa
matlab -nosplash -nodisplay -nodesktop << Matlab_Commands     &


 
clear all;
clc;
close all;
clear classes;





IEEE_System=$IEEE_System
Time_Set=[$Begin_Time:$End_Time];
Scenario_Set=1:$Number_Scenario;
Capacity_Coefficient=2;   
Gamma_Coefficient= 3; 
Conjestion_Number=1;    
Figure_Number=4;
Simulation_Total=5;
Simulation_Index=$Time_Horizen;
Joint=1;
Main;
quit;  
Matlab_Commands

Pid_Matlab=$!






CPU_Index=$(cpu_chooser)
taskset -cp $CPU_Index $Pid_Matlab

cd ..

#################################################  Begin og Haghighat 

sleep 1
queuer


cd Haghighat
matlab -nosplash -nodisplay -nodesktop << Matlab_Commands     &


 
clear all;
clc;
close all;
clear classes;





IEEE_System=$IEEE_System
Time_Set=[$Begin_Time:$End_Time];
Scenario_Set=1:$Number_Scenario;
Capacity_Coefficient=2;   
Gamma_Coefficient= 3; 
Conjestion_Number=1;    
Figure_Number=4;
Simulation_Total=5;
Simulation_Index=$Time_Horizen;
Joint=1;
Main;
quit;  
Matlab_Commands

Pid_Matlab=$!






CPU_Index=$(cpu_chooser)
taskset -cp $CPU_Index $Pid_Matlab

cd ..



#################################################  Begin of MILP
sleep 1
queuer

cd October_7_Flage
matlab -nosplash -nodisplay -nodesktop << Matlab_Commands     &



 
clear all;
clc;
close all;
clear classes;


IEEE_System=$IEEE_System
Time_Set=[$Begin_Time:$End_Time];
Scenario_Set=1:$Number_Scenario;
Capacity_Coefficient=2;   
Gamma_Coefficient= 3;   
Conjestion_Number=1;  
Figure_Number=4;
Simulation_Total=5;
Simulation_Index=$Time_Horizen;
Joint=1;
Main;
quit;  
Matlab_Commands

Pid_Matlab=$!






CPU_Index=$(cpu_chooser)
taskset -cp $CPU_Index $Pid_Matlab


cd ..





done 

done

cd Figures

exit                     
             

       



