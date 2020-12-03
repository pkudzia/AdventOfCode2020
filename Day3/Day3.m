
%% Day 3 

fid = fopen('Puzzle3.rtf');
C = textscan(fid, '%100s', 325);
%get each line in the file and run WHILE loop until you read the line with
%'cells_QC'
% lets first import everything and make a matrix of the data
for i= 1:323
    for j = 1:31
    dots = strfind(C{1,1}{i,1},'.');
    amper = strfind(C{1,1}{i,1},'#');

    if sum(dots==j)
     outputMatrix(i,j) =0;
    else
     outputMatrix(i,j) =NaN;
    end   
  
    end
end
% Alright now that we made the matrix lets copy it a bunch of times

outputMatrix(324,:) = 1; % this will be the boardr 
for i= 1:150 % Lets copy the matrix over and over 
    outputMatrix(:,end+1:(end+1+30)) =outputMatrix(:,1:31);
end

outputMatrix(324:500,:) = 1; % this will be the boardr 

% Now find the pattern 
% 3 right one down 
row = 1;
col = 1;
for i = 1:500
    row = row+2;
    col = col+1;
    
    totalTree(i) = isnan(outputMatrix(row,col));
    
    if outputMatrix(row,col) ==1
        break
    end
end
% slope 1 (88)
% Slope 2 (145) 
% Slope  (71) 
% Slope 4 (90)
% Slope 5 (42)
%totla number of trees 
Trees = sum(totalTree)%;
