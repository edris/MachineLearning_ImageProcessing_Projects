function sum_err = fugrammar(x);

global fismat;
global data;
fuzzy_rules;

presentCodon = 0;
index = 1;

%This while loop converts a binary string to a set of fuzzy rule using the
%grammar specified in fuzzy_rules
while ((index ~=0))


    index = 0;
    %find first nonterminal in string
    found = ones(nproductionRules,1);
    found(:,:) = NaN;
    for i=1:nproductionRules
        hit = domfind(axiom, rule(i,1).before);
        if (hit>0)
            found(i,1) = hit;
        end
    end
    [theMin,index] = min(found(:,1));
    if isnan(theMin);
        index = 0;
    end
    if (index ~=0)
        %read codon
        presentCodon = presentCodon +1;
        %wrap around
        if presentCodon > maxCodon
            presentCodon = 1;
        end
        codon = x(1,(codonSize*presentCodon-codonSize+1):codonSize*presentCodon);

        intvalue = 0;
        for i = 1:codonSize
            intvalue = intvalue + codon(1,i)*2^(codonSize-i);
        end

        TheRule = mod(intvalue,choice(index,1))+1;

        % no codon needs to be read if there is only one choice
        if (choice(index,1)<2)
            presentCodon = presentCodon -1;
            %take care of wrap around
            if presentCodon ==0
                presentCodon = maxCodon;
            end
        end
        tempaxiom = [axiom(1:theMin-1),rule(index,TheRule).after];
        if (theMin+length(rule(index,TheRule).before)-1 < length(axiom))
            tempaxiom = [tempaxiom,axiom((theMin+length(rule(index,TheRule).before)):length(axiom))];
        end
        axiom = tempaxiom;
    end
end

%We now build the rules for the fis matrix
fismat.rule = [];
eval(axiom);
for i = 1:fuzrules
    fismat.rule(i).weight =1;
    fismat.rule(i).connection = 1;
end
output = evalfis(data(:,1:size(data,2)-1),fismat);

sum_err = 0;
for i = 1:size(output,1)
    if (round(output(i))~= data(i,size(data,2)))
        sum_err = sum_err +1;
    end
end

%%Label for the graph
hold on;
ylabel('# of misclassifications (out of 150)','interp','none');
hold off;