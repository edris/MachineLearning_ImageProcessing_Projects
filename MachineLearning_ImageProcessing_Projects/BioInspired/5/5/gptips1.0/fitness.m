function [fitness,gp]=fitness(evalstr,gp)

% Extract x and y data from GP struct
x1=gp.userdata.x;
y=gp.userdata.y;

% Evaluate the tree (assuming only 1 gene is suppled in this case - if the
% user specified multigene config then only the first gene encountered will
%be used)
eval(['out=' evalstr{1} ';']);

% Fitness is sum of absolute differences between actual and predicted y
fitness=sum(abs(out-y));

% If this is a post run call to this function then plot graphs
if gp.state.run_completed
    figure
    plot(x1,y,'o-');hold on;
    plot(x1,out,'rx-');
    legend('y','predicted y');
    title('Prediction of polynomial over range [-10 10]');
    hold off;
end

    
