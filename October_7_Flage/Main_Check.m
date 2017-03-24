clc
close all
clear all
clear classes

% a_S=[  13.3082
%    13.8494
%    10.1000
%    14.3805];

load('a_S')



if strcmp(computer,'MACI64')
addpath(genpath('/Users/Mahdi/Copy/Lab/matlabs/MPEC/SOS/yalmip'))
addpath(genpath('/Users/Mahdi/Copy/Lab/matlabs/MPEC/SOS/mosek/7/toolbox/r2013a'))
addpath('../Data_File')
end

if strcmp(computer,'GLNXA64')
addpath(genpath('/home/eegrad/ghamkhari/Yalmip/yalmip'))
addpath(genpath('/home/eegrad/ghamkhari/mosek/mosek/7/toolbox/r2013a'))
addpath('/home/eegrad/ghamkhari/Gurobi/gurobi651/linux64/matlab/m')
addpath('../Data_File')
end




Time_Set=[1:8];
Scenario_Set=1;
Capacity_Coefficient=1;   %%%%% For obtaining figures and is used by Data_modifier file
Gamma_Coefficient= .3;    %%%%% For obtaining figures and is used by Data_modifier file
Conjestion_Number=1;
Figure_Number=2;
Simulation_Total=10;
Simulation_Index=length(Time_Set);
Joint=0;            %%%%% Joint=0 is for time decoupled optimization; Joint=1 is for time coupled optimzation



Infinite_Capacity=2;
Large=1000;





Data
Stochastic_Check

Prob.c*Res.sol.int.xx