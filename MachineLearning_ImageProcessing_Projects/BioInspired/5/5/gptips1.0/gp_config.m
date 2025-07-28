% Robert C. Green II
% Biologically Inspired Computing
% Assignment #5
% Config file

function [gp]=gp_config(gp);
% Main run control parameters
% ---------------------------
gp.runcontrol.pop_size  =50;			
gp.runcontrol.num_gen   =50;			
gp.runcontrol.verbose   =0;           

% Selection method options
% -------------------------
gp.selection.tournament.size    =2;        
gp.selection.elite_fraction     =0.02;      

% Fitness function and optimisation specification 
% ------------------------------------------------
gp.fitness.fitfun           =@fitness;          
gp.fitness.minimisation     =true;               
gp.fitness.terminate        =true;                   
gp.fitness.terminate_value  =1e-3;

% User data specification (sets up quartic polynomial data)  
% ----------------------------------------------------------------
x=[-10:10];
gp.userdata.x = x;
gp.userdata.y = [153 120 91 66 45 28 15 6 1 0 3 10 21 36 55 78 105 136 171 210 253];

% Input configuration
% -------------------- 
gp.nodes.inputs.num_inp = 1; 		         

% Constants
% ---------
gp.nodes.const.use_matlab_format    = false;     
gp.nodes.const.num_dec_places       = 0;  
gp.nodes.const.range                = [0 5];             

% When building a tree this is % the probability with which a constant will
% be selected instead of a terminal.
% [1=all ERCs, 0.5=1/2 ERCs 1/2 inputs, 0=no ERCs]
gp.nodes.const.p_ERC = 0.5;		


% Tree build options
% -------------------
             
% Maximum depth of trees 
gp.treedef.max_depth = 4; 
 	              
% Maximum depth of sub-trees created by mutation operator
gp.treedef.max_mutate_depth = 4;

% Define function nodes
% ---------------------

gp.nodes.functions.name{1}  = 'times';
gp.nodes.functions.name{2}  = 'plus';



