global fuzrules;
global data;


codonSize = 8;          %8 bit codon
maxCodon = fuzrules * 5;%4 antecedent + 1 consequent per rule

%%%BNF:
rule(1,1).before = '<syntax>';
rule(1,1).after =[];
for i = 1:fuzrules
    rule(1,1).after = strcat(rule(1,1).after,'fismat.rule(' , num2str(i),').antecedent= [<ant1> <ant2> <ant3> <ant4>]; ', 'fismat.rule(' , num2str(i),  ').consequent= [<cons>]; ');
end
global inputSectors;
for j = 2:5
    for k = 1:inputSectors+2
        rule(j,k).before = strcat('<ant',num2str(j-1),'>');
        rule(j,k).after = num2str(k);
    end
end

rule(6,1).before = '<cons>';
rule(6,1).after = '1';
rule(6,2).before = '<cons>';
rule(6,2).after = '2';
rule(6,3).before = '<cons>';
rule(6,3).after = '3';

choice = [1;inputSectors+2;inputSectors+2;inputSectors+2;inputSectors+2;3];
nproductionRules = 6;

axiom = '<syntax>';
