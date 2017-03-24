The files in this repository are the simulation codes for the below paper:

********************************

[1] M. Ghamkhari, A. S. Mobarakeh, H. Mohsenian-Rad, “Strategic Bidding for
Producers in Nodal Electricity Markets: A Convex Relaxation Approach,”
Accepted for Publication in IEEE Transactions on Power Systems, July 2016.

******************************** 

In what follows, the instruction for 
regenerating all the figures in the above paper is explained. We assume that Matlab is already installed on your machine and you have access to a multi-core Linux server. 



1- Jsonlab toolbox should be installed on Matlab:

https://www.mathworks.com/matlabcentral/fileexchange/33381-jsonlab--a-toolbox-to-encode-decode-json-files

2- Gurobi,  Mosek and Yalmip should be installed on the Linux server. The path to Gurobi,  Mosek and Yalmip should be added to the top part of the "Main.m" files in the following directories:

/Rercovery_October_5_Cleanup
/October_7_Flage
/Haghighat
/Regular
/Fampa

3- Suppose that we want to derive Figure 2. We need to navigate to the following directory

Figures/Figure2

4- At top part of "Figure2.sh" file, the number of existing CPUs of Linux server should be assigned to the variable "Maximum_CPU_Server".  

5- Then, the following command should be issued on terminal of server 

    ./   Figure2.sh

6- The simulation results can be seen by running the "ploter.m" file that is included in the directory listed in item 3. 

7- It is extremely important that, someone make sure that the script "./Figure2.sh" is completely executed and exited, before deriving another figure. Executing multiple ".sh" files results in inaccurate reports of computation time. 
