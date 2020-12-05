clearvars;
%%
fid = fopen('Day5.rtf');
C = textscan(fid, '%100s');


for i = 1:length(C{1,1}) % sort everything 
    
        newStr = C{1,1}{i,1};
        newStr =erase(newStr,'\');
        newStr =erase(newStr,'}');
    
        letters{i,:} = regexp(newStr, '\D', 'match');

end

for i = 1:length(letters)
    rowLeft = 0;
    rowRight = 127;
%     letterTest =regexp('BBFFBBFRLL', '\D', 'match'); 
    for j= 1:10
       var = letters{i,1}{1,j};
       if j ==1
           value = strfind(var,'F'); % Low half 
           
           if value==1
               rowLeft = rowLeft;
               rowRight = floor(rowRight/2);
           else
               rowLeft = round((rowRight-rowLeft)/2);
               rowRight = rowRight;   
           end
           
       elseif j ==2
            value = strfind(var,'F'); % Low half 
           if value==1
               rowLeft = rowLeft;
               rowRight = rowLeft+floor((rowRight-rowLeft)/2);
           else
               rowLeft = rowLeft+ round((rowRight-rowLeft)/2);
               rowRight = rowRight;   
           end
           
       elseif j ==3
            value = strfind(var,'F'); % Low half 
           if value==1
               rowLeft = rowLeft;
               rowRight = rowLeft+floor((rowRight-rowLeft)/2);
           else
               rowLeft = rowLeft+ round((rowRight-rowLeft)/2);
               rowRight = rowRight;   
           end
           
       elseif j==4
           value = strfind(var,'F'); % Low half 
           if value==1
               rowLeft = rowLeft;
               rowRight = rowLeft+floor((rowRight-rowLeft)/2);
           else
               rowLeft = rowLeft+ round((rowRight-rowLeft)/2);
               rowRight = rowRight;   
           end
           
       elseif j==5
            value = strfind(var,'F'); % Low half 
           if value==1
               rowLeft = rowLeft;
               rowRight = rowLeft+floor((rowRight-rowLeft)/2);
           else
               rowLeft = rowLeft+ round((rowRight-rowLeft)/2);
               rowRight = rowRight;   
           end
           
       elseif j==6
            value = strfind(var,'F'); % Low half 
           if value==1
               rowLeft = rowLeft;
               rowRight = rowLeft+floor((rowRight-rowLeft)/2);
           else
               rowLeft = rowLeft+ round((rowRight-rowLeft)/2);
               rowRight = rowRight;   
           end
           
       elseif j==7
        value = strfind(var,'F'); % Low half 
           if value==1
                finalRow= rowLeft;
           else
               finalRow= rowRight;  
           end
           
       elseif j==8
         value = strfind(var,'L'); % Low half 
         rowLeft = 0;
         rowRight = 7;
         
           if value==1
               rowLeft = rowLeft;
               rowRight = floor(rowRight/2);
           else
               rowLeft = round((rowRight-rowLeft)/2);
               rowRight = rowRight;   
           end
         

         
       elseif j==9
         value = strfind(var,'L'); % Low half 

           if value==1
               rowLeft = rowLeft;
               rowRight = rowLeft+floor((rowRight-rowLeft)/2);
           else
               rowLeft = rowLeft+ round((rowRight-rowLeft)/2);
               rowRight = rowRight;   
           end
           
        elseif j==10
          value = strfind(var,'L'); % Low half 
           if value==1
                finalSeat= rowLeft;
           else
               finalSeat= rowRight;  
           end
           
       end
        
        
    end
    id(i) = (finalRow*8)+finalSeat;
    

end

% Q1 
answer = max(id);

%Q2 (lame ;) ) 
answer = sort(id)'; 
check = diff(answer);


