clearvars;
%%
fid = fopen('Day6.rtf');
C = textscan(fid, '%100s');
letter='a':'z';

% first seperate into groups
iter = 1;
letterMatrix=zeros(length(C{1,1})+1,length(letter));

 for i =1:length(C{1,1})
     
     backslash = strfind(C{1,1}{i,1},'\');
     
     newStr =erase(C{1,1}{i,1},'\');
     AllLetter{i,:} = regexp(C{1,1}{i,1}, '\D', 'match');
     
     for j =1:length(letter)
         
         for k = 1:length(AllLetter{i,:})
             
             str = strfind(AllLetter{i,1}{1,k},letter(j));
             if str==1
                  letterMatrix(i,j) =1; % mark 1 if this letter is there
             end
           
         end
     end
         
     if backslash==1
         
      groups(iter,1) =  i;
      iter = iter+1;
     end
    
 end 
 
%% Part 1 
start = 1;
groups(end+1) = length((C{1,1}))+1;
grouptotal= zeros(length(groups),1);
for i =1:length(groups)
    
        for j = 1:length(letter)
            
            temp = sum(letterMatrix(start:groups(i),j));
            
            if temp>1
                temp =1;
            end
            
            grouptotal(i,1) =temp+grouptotal(i,1);
        end
            start = groups(i)+1;
   
end
        
 
%% Part 2
start = 1;
grouptotal= zeros(length(groups),1);
for i =1:length(groups)

        for j = 1:length(letter)
            
            temp = sum(letterMatrix(start:groups(i),j));
            
            if temp==(length(start:groups(i))-1)
                temp =1;
            else
                temp =0;
            end
            
            grouptotal(i,1) =temp+grouptotal(i,1);
        end
            start = groups(i)+1;

end
 
    
