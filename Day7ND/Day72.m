A = importdata('Day7_txr.txt');

rules = struct;

for i = 1:length(A)
    words = strsplit(A{i},' '); % split up the thing into each word 
    bag_name = strcat(words{1},words{2}); % the first two words are the rule name
    
    if mod(numel(words),4) ~= 0
        rules.(bag_name) = 0;
    else
        
        s = struct;
        re = (numel(words)-4)/4;
        for k = 1:re
            ind = k*4+1;
            num_in = str2double(words{ind});
            bg_in = strcat(words{ind+1},words{ind+2});
            s.(bg_in) = num_in;
        end
        rules.(bag_name) = s;
    end
end

search = 'shinygold';
count = 0;

f = fieldnames(rules);
for i = 1:numel(f)
    m = find_container(rules,f{i},search,0);
    count = m + count;
end

% Part 1
% How many bag colors can eventually contain at least one shiny gold bag?
count

% Part 2
% How many bags are required inside a single shiny gold bag?


function m = find_container(ruleset,field,search_str,m)
k = ruleset.(field);
if class(k) ~= 'struct'
    return;
else
    c = fieldnames(k);
    if sum(contains(c,search_str)) >= 1
        m = 1;
        return
    else
        for i = 1:numel(c)
            m = find_container(ruleset,c{i},search_str,m);
        end
    end
end
end



%%
A = importdata('day7_input.txt');

rules = struct;

for i = 1:numel(A)
    r = strsplit(A{i},' ');
    bag_name = strcat(r{1},r{2});
    if mod(numel(r),4) ~= 0
        rules.(bag_name) = 0;
    else
        s = struct;
        re = (numel(r)-4)/4;
        for k = 1:re
            ind = k*4+1;
            num_in = str2double(r{ind});
            bg_in = strcat(r{ind+1},r{ind+2});
            s.(bg_in) = num_in;
        end
        rules.(bag_name) = s;
    end
end

search = 'shinygold';
count = 0;

f = fieldnames(rules);
for i = 1:numel(f)
    m = find_container(rules,f{i},search,0);
    count = m + count;
end

% Part 1
% How many bag colors can eventually contain at least one shiny gold bag?
count

% https://github.com/jholtom/advent-of-code-2020/blob/main/day7/day7.m

% Part 2
% How many bags are required inside a single shiny gold bag?
count2 = find_numbags(rules,search,0)

function m = find_container(ruleset,field,search_str,m)
k = ruleset.(field);
if class(k) ~= 'struct'
    return;
else
    c = fieldnames(k);
    if sum(contains(c,search_str)) >= 1
        m = 1;
        return
    else
        for i = 1:numel(c)
            m = find_container(ruleset,c{i},search_str,m);
        end
    end
end
end

function m = find_numbags(ruleset,field,m)
k = ruleset.(field);
if class(k) ~= 'struct'
    m = 0;
else
    c = fieldnames(k);   
    for i = 1:numel(c)
        sub_bags = find_numbags(ruleset,c{i},0);
        m = m + k.(c{i}) + k.(c{i})*sub_bags;
    end
end
end