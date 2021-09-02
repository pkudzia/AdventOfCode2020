clearvars;
fid = fopen('Day14.rtf');
C = textscan(fid, '%100s');

%% find mask locations 
 for i =1:numel(C{1,1})
     mask = strfind(C{1,1}{i,1},'mask'); % lets find where new groups start 
     mem = strfind(C{1,1}{i,1},'mem'); % lets find where new groups start 
     
     if mask>0
         maskLoction(i,1) =1;
     else
         maskLoction(i,1) =NaN;
     end
     
     if mem>0
         memLoction(i,1) =1;
     else
         memLoction(i,1) =NaN;
     end
 end 

numCodes = find(maskLoction==1); % mask index
memCodes = find(memLoction==1); % mask index
numCodes(end+1) = 1680;

for i=1:numel(numCodes)-1 % lets make a matarx that is 36 colums and the length of all the codes
    
    str = C{1,1}{numCodes(i)+2,1}; % lets find where new groups start 
    newStr =erase(str,'\'); 
    for k =1:length(newStr)
        if strfind(newStr(k),'X')
        stringMask(i,k) = NaN;
        elseif strfind(newStr(k),'1')
        stringMask(i,k) = 1;  
        else
        stringMask(i,k) = 0;  
        end   
    end
    
    numberOfCodes(i,1) =((numCodes(i+1))-(numCodes(i)+3))/3;
   
end

for i=1:numel(memCodes)
    
   temp1= str2double(regexp(C{1,1}{memCodes(i),1}, '\d*', 'match')); % take out and put into cells each letter 
   temp2 =str2double(regexp(C{1,1}{memCodes(i)+2,1}, '\d*', 'match'))
   memMatrix(i,1)= temp1;
   memMatrix(i,2)= temp2;
   clear temp1 temp2
end




%% Part 1
execute = 1;
count = 1;
start = 1;
finish = round(numberOfCodes(count));
while execute 
    
    for j = start:finish
        Mask = stringMask(count,:); % this is the mask of the current set
        try
        temp =dec2bin(memMatrix(j,2),36);
        catch
            return
        end
        
        for k =1:length(temp)
        if strfind(temp(k),'0')
            if Mask(1,k) ==0
                output(1,k) =0;
            elseif isnan(Mask(1,k))
                output(1,k) =0;
            else
                output(1,k) =1;
            end
       	
        elseif strfind(temp(k),'1')
             if Mask(1,k) ==0
                output(1,k) =0;
            elseif isnan(Mask(1,k))
                output(1,k) =1;
            else
                output(1,k) =1;
            end
        end
        
        end
        
        str_x = num2str(output);
        str_x(isspace(str_x)) = '';
        y = bin2dec(str_x)
        memMatrix(j,3) = y;

    end
    start = start+round(numberOfCodes(count));
    count = count+1;
    finish = start+round(numberOfCodes(count));
    
        

end 
