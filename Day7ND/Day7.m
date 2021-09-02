clearvars;
%%
fid = fopen('Day7Test.rtf');
C = textscan(fid, '%100s');
% letter='a':'z';

% we need to extract the word and then the number 
%     AllLetter{i,:} = regexp(C{1,1}{i,1}, '\d', 'match'); % take out and put each number into a cell 

    iter = 1;
    iterBag =1;
    
for i = 1:length(C{1,1})
        backslash = strfind(C{1,1}{i,1},'\'); % lets find where new groups start 
        bag = strfind(C{1,1}{i,1},'bags'); % lets find where new groups start 
    
        if isempty(bag)
            bag = strfind(C{1,1}{i,1},'bag'); % lets find where new groups start 
        end

        if backslash>1
            rulesNumbers(iter,1) = i;
            iter = iter+1;
        end 

        if bag>0
            bagLocation(iterBag,1) = i;
            iterBag= iterBag+1;
        end
end 

start =1;
for i = 1:length(rulesNumbers)
    ruleLocation = rulesNumbers(i); 
    
    a = find(bagLocation==ruleLocation);
    rules = length(start:ruleLocation)/4;
    for k =1:round(rules)
        if rules ==3
        if k ==1
        bagRule{i,1}{k,1}= C{1,1}{bagLocation(a-2)-2,1} ;
        bagRule{i,1}{k,2}= C{1,1}{bagLocation(a-2)-1,1} ;
        bagRule{i,1}{k,3}= num2str(0);
        elseif k==2
        bagRule{i,1}{k,1}= C{1,1}{bagLocation(a-1)-2,1} ;
        bagRule{i,1}{k,2}= C{1,1}{bagLocation(a-1)-1,1} ;
        bagRule{i,1}{k,3}= C{1,1}{bagLocation(a-1)-3,1};
        
        else
        bagRule{i,1}{k,1}= C{1,1}{bagLocation(a)-2,1} ;
        bagRule{i,1}{k,2}= C{1,1}{bagLocation(a)-1,1} ;
        bagRule{i,1}{k,3}= C{1,1}{bagLocation(a)-3,1};
           
        end
        
        else
        if k ==1
        bagRule{i,1}{k,1}= C{1,1}{bagLocation(a-1)-2,1} ;
        bagRule{i,1}{k,2}= C{1,1}{bagLocation(a-1)-1,1} ;
        bagRule{i,1}{k,3}= num2str(0);
        else
        bagRule{i,1}{k,1}= C{1,1}{bagLocation(a)-2,1} ;
        bagRule{i,1}{k,2}= C{1,1}{bagLocation(a)-1,1} ;
        
            if isinteger(rules)
                bagRule{i,1}{k,3}= C{1,1}{bagLocation(a)-3,1};
            else
                bagRule{i,1}{k,3}= num2str(0);    
            end
        end
            
        end
            
    end
    
    start = bagLocation(a)+1;
    
end
% Now i have all the rules in so sort of logical order ...

for i = 1:length(bagRule)
    
    bag = bagRule{i,1}; 
    for k = size(bag,1)
        
    end
end


