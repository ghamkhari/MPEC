




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





Result_Cleaner
Data
Network
Result_Saver






