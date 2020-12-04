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
indentMatrixP2 = zeros(passNum,length(keywords));

startIndex = 1;
passportIndex = 1;

for k = 1:passNum
    
        for j = 1:length(keywords)
            
            for i = startIndex:passID(passportIndex)
                word = strfind(C{1,1}{i,1},keywords(j));
                
                if word ==1
                    
                    if j ==1 % byr rule
%                         word = strfind(C{1,1}{i,1},keywords(j));
                        newStr = erase(C{1,1}{i,1},keywords(j));
                        newStr = erase(newStr,'\');
                        newStr = erase(newStr,'}');
                        newStr = erase(newStr,':');
                        number = str2num(newStr);

                        
                        if number>=1920 && number <=2002
                          indentMatrixP2(passportIndex,j)=1;

                        end
                        
                    elseif j==2 % iyr 
                        
                        newStr = erase(C{1,1}{i,1},keywords(j));
                        newStr = erase(newStr,'\');
                        newStr = erase(newStr,':');
                        number = str2num(newStr);
                        
                        if number>=2010 && number <=2020
                          indentMatrixP2(passportIndex,j)=1;
                        end
                        
                        
                    elseif j==3 % eyr {'byr';'iyr';'eyr';'hgt';'hcl';'ecl';'pid';'cid'}; % note cid is final element 
                        
                        newStr = erase(C{1,1}{i,1},keywords(j));
                        newStr = erase(newStr,'\');
                        newStr = erase(newStr,':');
                        number = str2num(newStr);
                        
                        if number>=2020 && number <=2030
                          
                          indentMatrixP2(passportIndex,j)=1;
                        end
                        
                    elseif j==4 % hgt
                            newStr = erase(C{1,1}{i,1},keywords(j));
                            newStr = erase(newStr,'\');
                            newStr = erase(newStr,':');


                            if  strfind(C{1,1}{i,1},'cm') % cm 
                                newStr = erase(newStr,'cm');
                                number = str2num(newStr);
                             
                                if number>=150 && number <=193
                                  indentMatrixP2(passportIndex,j)=1;
                                end


                            elseif  strfind(C{1,1}{i,1},'in') % in 
                                newStr = erase(newStr,'in');
                                number = str2num(newStr);

                                if number>=59 && number <=76
                                  indentMatrixP2(passportIndex,j)=1;
                                end


                            else 
                                
                            end
                        
                    elseif j==5 % hcl
                        
                        newStr = erase(C{1,1}{i,1},keywords(j));
                        newStr = erase(newStr,'\');
                        newStr = erase(newStr,':');
                        
                        if contains(newStr,'#')
                         
                           newStr = erase(newStr,'#');
                            numbers= regexp(newStr, '\d', 'match');
                            letters = regexp(newStr, '\D', 'match');
                            
                            output = zeros(1,length(letters));
                            
                            if length(numbers)+length(letters) ==6                             
                                legalLetters = {'a';'b';'c';'d';'e';'f'};
                                
                                for f = 1:length(letters) % scan through the letter 
                                    for r = 1:length(legalLetters)
                                        
                                        test = strfind(letters(f),legalLetters(r)); % cm 
                                        if cell2mat(test) ==1
                                             output(1,f) =1;
                                        end
                                    end
                                   
                                end
                                
                                if sum(output) ==length(letters)
                                    indentMatrixP2(passportIndex,j)=1;  
                                end
                                
                                
                            end

                           
                            
                            
                        end
                        
                        
                        
                    elseif j==6 %ecl 
                        newStr = erase(C{1,1}{i,1},keywords(j));
                        newStr = erase(newStr,'\');
                        newStr = erase(newStr,':');
                        
                        color = {'amb'; 'blu'; 'brn'; 'gry'; 'grn'; 'hzl'; 'oth'};
                        for t = 1:length(color)
                            checkColor = strfind(newStr,color(t));
                            
                            if checkColor ==1
                                indentMatrixP2(passportIndex,j)=1;
                            end
                            
                        end
                        
                        
                    elseif j==7 %pid
                        
                        newStr = erase(C{1,1}{i,1},keywords(j));
                        newStr = erase(newStr,'\');
                        newStr = erase(newStr,':');  
                        
                        if numel(newStr) ==9
                            indentMatrixP2(passportIndex,j)=1;  
                        end
                       
                        
                        
                    else
                            
                    end
                   
                   
                   
                end
            end
            
        end 
            
        
        startIndex = passID(passportIndex)+1;
        passportIndex =passportIndex+1;
      
end

% Q1. How many valid entries are there ? 
valid = 0;
for i =1:size(indentMatrixP2,1)
    
    S = sum(indentMatrixP2(i,1:7)); % last column doesnt matter
    
    if S ==7
        valid= valid+1;
    end
    
end
