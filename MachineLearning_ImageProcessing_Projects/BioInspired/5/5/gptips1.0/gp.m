%GPDEMO1 GPTIPS demo of simple symbolic regression on Koza's quartic polynomial.
%   Also demonstrates some post run analysis functions such as SUMMARY,
%   RUNTREE and GPPRETTY to simplify expressions if the Symbolic Math Toolbox
%   is present.
%
%   (c) Dominic Searson 2009
%
%   v1.0
%
%   See also GPDEMO1_CONFIG, QUARTIC_FITFUN, GPDEMO2, GPDEMO3, GPDEMO4, GPREFORMAT, SUMMARY,
%   RUNTREE

gp=rungp('gp_config');
summary(gp);
runtree(gp,'best');

%The best individual

disp( gp.results.best.eval_individual{1});
disp(' ');

disp(['This expression has a tree depth of ' int2str( getdepth(gp.results.best.individual{1}))]);
disp(['It was found at generation ' int2str(gp.results.best.foundatgen)]);
disp(['and has fitness ' num2str(gp.results.best.fitness)]);





%If Symbolic Math toolbox is present
if license('test','symbolic_toolbox')
   
    
    disp(' ');
    disp('Using the symbolic math toolbox simplified versions of this');
    disp('expression can be found: ')
    disp('E.g. using the the GPPRETTY command on the best individual: ');
   
    disp('>>gppretty(gp,''best'') ')
    disp(' ');
    disp('Press a key to continue');
    disp(' ');
    pause;
    
    gppretty(gp,'best');
    disp(' ');
    disp('If you are lucky then this is the quartic polynomial used to');
    disp('generate the data.');
    disp('NOTE: In general, it is unusual for GP to evolve the exact form'); 
    disp('of the generative function.');
end

