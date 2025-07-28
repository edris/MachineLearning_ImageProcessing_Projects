clc;
clear;
global data;
global fuzrules;
global fismat;
global inputSectors;

%%%%irisData is an m file containing the input output dataset
irisData;
%%%%fuzzy_rules is an m file containing the bnf and GE parameters
fuzzy_rules;

%%%%Fuzzy logic parameters
fuzrules = 10;   %Number of fuzzy rules
NumInput = 4;   %Number of inputs
inputSectors = 3;   %Number of membership fnctions  = 
                    %2 + inputSectors;
                    

%%%%Genetic Algorithm parameters
popsize = 100;  %population size
mutRate = 0.01; %Mutation rate
xfraction = 0.8;%Crossover fraction
ngen = 50;      %Nuber of generations




%%%%%%%%define fis matrix with membership functions
fismat = newfis('iris');
for inp = 1:NumInput
    inmin = min(data(:,inp));
    inmax = max(data(:,inp));
    inrange = inmax - inmin;
    defpoints = inmin +(inrange/inputSectors)*[-1:inputSectors+1];
    switch inp
        case 1
            fismat.input(inp).name = 'SepalLength';
        case 2
            fismat.input(inp).name = 'SepalWidth';
        case 3
            fismat.input(inp).name = 'PetalLength';
        case 4
            fismat.input(inp).name = 'PetalWidth';
    end
    fismat.input(inp).range=[inmin inmax];
    fismat.input(inp).NumMFs = inputSectors + 2;

    for memf = 1:inputSectors + 1
        switch memf
            case 1
                fismat.input(inp).mf(memf).name = 'Small';
            case 2
                fismat.input(inp).mf(memf).name = 'SmallMedium';
            case 3
                fismat.input(inp).mf(memf).name = 'MediumLarge';
            case 4
                fismat.input(inp).mf(memf).name = 'Large';
        end

        fismat.input(inp).mf(memf).type = 'trimf';
        fismat.input(inp).mf(memf).params = defpoints(memf:memf+2);
    end
    fismat.input(inp).mf(inputSectors+2).name = 'All';
    fismat.input(inp).mf(inputSectors+2).type = 'trimf';
    fismat.input(inp).mf(inputSectors+2).params = [-100 0 100];
end

fismat=addvar(fismat,'output','Class',[0 3.5]);
fismat=addmf(fismat,'output',1,'Setosa','trimf',[0 1 1.5]);
fismat=addmf(fismat,'output',1,'Versicolour','trimf',[1.5 2 2.5]);
fismat=addmf(fismat,'output',1,'Virginica','trimf',[2.5 3 3.5]);
%%%%%%%%End define fis matrix with membership functions

%Set Genetic algorithm parameters:
options = gaoptimset('PopulationType','bitstring','PopulationSize',popsize,...
    'EliteCount',2,'CrossoverFraction',xfraction,...
    'Generations',ngen,'FitnessLimit',0,...
    'StallGenLimit',20,'StallTimeLimit',200,...
    'CrossoverFcn',@ge_single_crossover,...
    'MutationFcn',{@mutationuniform, mutRate},...
    'PlotFcns',@gaplotbestf );

%Run Genetic algorithm
[x fval reason output] = ga(@fugrammar,5*codonSize*fuzrules,options);

%Create fismat from best ruleset
fugrammar(x);
fuzzy(fismat);

