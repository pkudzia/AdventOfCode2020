clearvars; 
%% 
fid = fopen('Day4.rtf');
C = textscan(fid, '%100s');

keywords = {'byr';'iyr';'eyr';'hgt';'hcl';'ecl';'pid';'cid'}; % note cid is final element 

% lets scan through the file to find identifers between different passports
passNum =1;
for i= 1:length(C{1,1})   
        backslash = strfind(C{1,1}{i,1},'\');
       
        if backslash ==1
            passID(passNum) = i;
            passNum = passNum+1;
        end 
end
% now that we hae the passport slots lets solve the puzzle
passID(end+1) = length(C{1,1});
indentMatrix = zeros(passNum,length(keywords));

startIndex = 1;
passportIndex = 1;

for k = 1:passNum
    
        for j = 1:length(keywords)
            
            for i = startIndex:passID(passportIndex)
                word = strfind(C{1,1}{i,1},keywords(j));
                if word ==1
                   indentMatrix(passportIndex,j)=1;
                end
            end
            
        end 
            
        
        startIndex = passID(passportIndex)+1;
        passportIndex =passportIndex+1;
      
end


% Q1. How many valid entries are there ? 
valid = 0;
for i =1:size(indentMatrix,1)
    
    S = sum(indentMatrix(i,1:7)); % last column doesnt matter
    
    if S ==7
        valid= valid+1;
    end
    
end

%%  Part 2 

