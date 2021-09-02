clearvars;

input = '0,8,15,2,12,1,4'; %My puzzle input

i = cellfun(@str2double,strsplit(input,','));
num = 2020;
history = zeros(1,num+1);
history(1:numel(i)) = i;
for i = numel(i):num
    k = find(history(1:i-1) == history(i),1,'last');
    if isempty(k)

    else
        age = i - k;
        history(i+1) = age;
    end
end
% Part 1
history(end-1)

% Part 2 = part 1 but longer lol
num = 30000000;
history = zeros(1,num+1);
history(1:numel(i)) = i;
for i = numel(i):num
    k = find(history(1:i-1) == history(i),1,'last');
    if isempty(k)

    else
        age = i - k;
        history(i+1) = age;
    end
end
history(end-1)