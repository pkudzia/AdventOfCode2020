% 
clear all ; clc; close all;

%% Day 2
% figure out input data
fid = fopen('Puzzle2.rtf');
C = textscan(fid, '%100s', 5000);

row = 1;
for i= 1:3000
    
    str = C{1,1}{row,1};
    numberDIFF = str2num(str);
    newStr = erase(str,"-");
    number = str2num(newStr);
    Ndigits = dec2base(number,10) - '0'; 
    
    if length(Ndigits) ==3 % we need to check if there are more then 3 digits
        
        FirstNumber = Ndigits(1);
        SecondNumber = Ndigits(1)+abs(numberDIFF);

        digitMatrix(i,1) = FirstNumber;
        digitMatrix(i,2) = SecondNumber;
         
    elseif length(Ndigits)==4 % if there are four digits then two and two 

        str = sprintf('%d%d', Ndigits(1,1), Ndigits(1,2)); 
        FirstNumber= str2double(str); 
        
        str = sprintf('%d%d', Ndigits(1,3), Ndigits(1,4)); 
        SecondNumber= str2double(str) % If you want a double.

        digitMatrix(i,1) = FirstNumber;
        digitMatrix(i,2) = SecondNumber;
        
    else
        
        digitMatrix(i,1) = Ndigits(1,1);
        digitMatrix(i,2) = Ndigits(1,2);
    end
    

    row = row+3;
    if row>3000
        break % jump out 
    end

end

row = 2;
for i= 1:3000
    
    str = C{1,1}{row,1};
    newStr = erase(str,":");
    StringMatrix(i,1) = newStr;

    row = row+3;
    if row>3000
        break
    end

end

row = 3;
for i= 1:3000
    
    str = C{1,1}{row,1};
    found = strfind(str,StringMatrix(i));
    PatternMatrix(i,1) = length(found);

    row = row+3;
    if row>3000
        break
    end
    
    clear found

end

% MOD for part 2
if 0
row = 3;
for i= 1:3000
    
    str = C{1,1}{row,1};
    found = strfind(str,StringMatrix(i));
    
    matchPolicy(i,1) = sum(found==digitMatrix(i,1));
    matchPolicy(i,2) = sum(found==digitMatrix(i,2));

    row = row+3;
    if row>3000
        break
    end
    
    clear found

end
valid = 0;
for i =1:1000
    data = matchPolicy(i,1)+matchPolicy(i,2);
    
    if data ==1
    valid = valid+1;
    else
    end
end
    
end


% solve the puzzle 
valid = 0;
for i =1:1000
    MIN = digitMatrix(i,1);
    MAX = digitMatrix(i,2);
    
    number = PatternMatrix(i,1); 
    
    if number>MAX || number<MIN
    else
        valid = valid +1;       
    end  
end



