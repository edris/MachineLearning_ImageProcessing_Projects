% Robert C. Green II
% Biologically Inspired Computing
% Assignment #5
% Script File

for i=1:20
    
    %
    % Begin Timing
    %
    tic;
    
    %
    % Setup and run program
    %
    gp=rungp('gp_config');
    summary(gp);
    runtree(gp,'best');
    myTime = toc;
    
    %
    % Display Data
    %
    disp( gp.results.best.eval_individual{1});
    disp(' ');

    disp(['This expression has a tree depth of ' int2str( getdepth(gp.results.best.individual{1}))]);
    disp(['It was found at generation ' int2str(gp.results.best.foundatgen)]);
    disp(['and has fitness ' num2str(gp.results.best.fitness)]);

    %
    % Display data for easy evaluation
    %
    expression  = gp.results.best.eval_individual{1};
    depth       = getdepth(gp.results.best.individual{1});
    size        = 0;
    fitness     = gp.results.best.fitness;
    evals       = gp.results.best.foundatgen;
    avgFitness  = gp.state.meanfitness;


    str = sprintf('%i,%i,%f,%i,%f,%f', depth, size, fitness, evals, avgFitness, myTime);
    disp(expression);
    disp(str);
end
