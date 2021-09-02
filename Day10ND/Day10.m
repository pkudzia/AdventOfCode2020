clearvars;
%%
Data = importdata('Day10.txt');
IncreaseLoad = 3; % 3 holt increase for each adpater;

MyBagMax = max(Data)+IncreaseLoad;
sortedBag = sort(A);
allocatedBag = [0; sortedBag; MyBagMax];

JoltDiff = diff(C);

%% Part 1
[~,~,ix] = unique(JoltDiff); % find the number of occurances from the Differences 
F = accumarray(JoltDiff,1).'; % accumluate the occurances now so we know 1 vs 3 

answerPart1 = F(1)*F(2); 

%% Part 2
% Find number of possible arrangements
% Build adjacency matrix
A = [0; A];
ADJ = zeros(max(A)+1,max(A)+1);
for i = 0:max(A)
    for j = 0:max(A)
        if ismember(i,A) && ismember(j,A)
            k = j-i;
            if (k < 4) && (k > 0)
                ADJ(i+1,j+1) = 1;
            end
        end
    end
end
% S = (I-ADJ)^1
S = inv(eye(size(ADJ))-ADJ);
% Solution S(1,end)
S(1,end)
