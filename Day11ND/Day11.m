clearvars;
%%
Data = importdata('Ex11.txt');

for i = 1:numel(Data)
    AllLetter{i,:}= regexp(Data{i,1}, '\D', 'match'); % take out and put into cells each letter 
end

for i = 1:numel(Data)
    for j = 1:numel(AllLetter{1,1})
        AllGrid{1,1}{i,j}= AllLetter{i,1}{1,j};
    end
end

%% Lets make a number grid 
% 0 is emptyseat | 1 is filled seat | Nan is floor 
gridNumber = zeros(size(AllGrid{1,1},1),size(AllGrid{1,1},2));

for i = 1:numel(Data)
    for j = 1:numel(AllLetter{1,1})
        
        floor = strfind(AllGrid{1,1}{i,j},'.'); %
        empty = strfind(AllGrid{1,1}{i,j},'L'); %
        occupied = strfind(AllGrid{1,1}{i,j},'#'); %
     
            if floor ==1
                 gridNumber(i,j)= NaN;
            elseif empty ==1
                gridNumber(i,j)= 0;
            elseif occupied ==1
                gridNumber(i,j)= 1;
            end
   
    end
end

%% Padding 
% to not deal with edges 
gridNumberPad= padarray(gridNumber,[1,1],9,'both');

%% Part 1 Answer
if 0
newGridOld = gridNumberPad;
[numRow,numCol] = size(gridNumberPad);
loop=1;
update=1;
while update 
    
    newGridUpdated = RuleUpdatePart1(newGridOld,numRow,numCol);
    check(loop) = numel(find(newGridUpdated==1)); 
    
    if loop>2
        if (check(loop-1))==check(loop)
            update=0;
        end
    end
    loop=loop+1;
    newGridOld=newGridUpdated;
    
    
end
Answer = check(end);
end
%% Part 2 
newGridOld = gridNumberPad;
[numRow,numCol] = size(gridNumberPad);
 newGridUpdated = RuleUpdatePart2(newGridOld,numRow,numCol);

%%

% rule one if there are no occupied seats adjacent to it the seat is filled
function [newGrid] = RuleUpdatePart2(gridNumberPad,numRow,numCol)
tempGrid = gridNumberPad;
for i = 2:numRow-1
%      M = zeros(size(gridNumberPad));
    for j =2:numCol-1
        M = zeros(size(gridNumberPad));
        output=[];
        counter=[];
        M(i,j) = 1;
        output =gridNumberPad(conv2(M,[1,1,1;1,0,1;1,1,1],'same')>0); 
        % find occupany 
        seatCurrent =gridNumberPad(i,j);
        
        if seatCurrent==0
            counter = numel(find(output==1));
            if counter==0
                tempGrid(i,j) = 1;
            end
            
        elseif seatCurrent==1
            counter = numel(find(output==1));
            
            if counter >=5
                tempGrid(i,j) = 0;
            end
        end  
    end
end

newGrid = tempGrid;

end
%% 
% rule one if there are no occupied seats adjacent to it the seat is filled
function [newGrid] = RuleUpdatePart1(gridNumberPad,numRow,numCol)
tempGrid = gridNumberPad;
for i = 2:numRow-1
%      M = zeros(size(gridNumberPad));
    for j =2:numCol-1
        M = zeros(size(gridNumberPad));
        output=[];
        counter=[];
        M(i,j) = 1;
        output =gridNumberPad(conv2(M,[1,1,1;1,0,1;1,1,1],'same')>0); 
        % find occupany 
        seatCurrent =gridNumberPad(i,j);
        
        if seatCurrent==0
            counter = numel(find(output==1));
            if counter==0
                tempGrid(i,j) = 1;
            end
            
        elseif seatCurrent==1
            counter = numel(find(output==1));
            
            if counter >=4
                tempGrid(i,j) = 0;
            end
        end  
    end
end

newGrid = tempGrid;

end

