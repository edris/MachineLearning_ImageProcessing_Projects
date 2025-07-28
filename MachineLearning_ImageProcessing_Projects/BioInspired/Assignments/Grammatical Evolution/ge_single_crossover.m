function xoverKids  = ge_single_crossover(parents,options,GenomeLength,FitnessFcn,unused,thisPopulation)
%Single point crossover at codon boundries

% How many children?
nKids = length(parents)/2;

% Allocate space for the kids
xoverKids = zeros(nKids,GenomeLength);

index = 1;

%  get data from rules file
fuzzy_rules;

for i=1:nKids
    % get parents
    parent1 = thisPopulation(parents(index),:);
    index = index + 1;
    parent2 = thisPopulation(parents(index),:);
    index = index + 1;
    % cut point is AFTER this index.
    % cut at codon boundraries
    xOverPoint = codonSize*ceil(rand * (GenomeLength/codonSize- 1));
    % make one child
    xoverKids(i,:) = [ parent1(1:xOverPoint),parent2(( xOverPoint + 1 ):  end )  ];
end
