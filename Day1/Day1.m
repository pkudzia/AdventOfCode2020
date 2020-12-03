clear all ; clc; close all;
%% Puzzle 1 
if 0
load('Puzzle1.mat')

% Find entries that sum up to 2020
%
for i = 1:length(Puzzle1)
    Ent1 = Puzzle1(i);
    
    for j = 1:length(Puzzle1)
        Ent2 = Puzzle1(j);
        
        for y = 1:length(Puzzle1)
            Ent3 = Puzzle1(y);
            
        if j ==i % this is to prevent addtion of same entry
             PuzzleAnswer =0;
        else
            PuzzleAnswer = Ent1+Ent2+Ent3;
        end
        
        if PuzzleAnswer ==2020
           input1 = j;
           input2 = i;
           input3 = y;
           
           Answer = Puzzle1(input1).* Puzzle1(input2)* Puzzle1(input3);
          
        end
        end
        
    end
    
    
end
end