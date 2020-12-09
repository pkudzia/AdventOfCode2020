
clearvars;
%%
Data = importdata('Day8.txt');

rules = struct;

% acc inceases by value 
% jump you swtich 
% nop does nothing conitnue forwards 
encoderData = zeros(654,1);
Accumulator = 0; 
% Data.textdata{654,1} ='nop';

%%
start=1;
boom = 0;
while 1
        
     ValueUp = strfind(Data.textdata{start,1},'acc'); % lets find where new groups start 
     Position= strfind(Data.textdata{start,1},'jmp'); % lets find where new groups start 
     nothing= strfind(Data.textdata{start,1},'nop'); % lets find where new groups start 
     
     if ValueUp == 1  
         if  encoderData(start)==1 
         end
         Accumulator =Accumulator+Data.data(start); 
         encoderData(start) = encoderData(start)+1;
   
         start=start+1;         
        
     elseif nothing ==1
         if  encoderData(start)==1
         end
         encoderData(start) = encoderData(start)+1;
         start=start+1;
         
     elseif Position ==1
         if  encoderData(start)==1
         end
         encoderData(start) = encoderData(start)+1;
         start=start+Data.data(start);    
     end   
end
    
%% find the postion of the encouder
ind = 1;
for i =1:numel(encoderData)
    
    if encoderData(i)>1
        P= strfind(Data.textdata(i),'jmp'); % lets find where new groups start 
        N= strfind(Data.textdata(i),'nop'); % lets find where new groups start
        if P{1,1}>0 | N{1,1}>0
        index(ind) = i;
        ind = ind+1;
        else
        
        end
            P{1,1} =0;
            N{1,1}=0;
    end
    
end


%%  basicly just run this until you get an error and then you have your answer 
encoderData = zeros(654,1);
Accumulator = 0; 
exitloop = 10000;
exit=1;

for i= 1:numel(index)
    Data = importdata('Day8.txt');
    encoderData = zeros(654,1);
    Accumulator = 0; 
    exit=1;
    start = 1;
    
        P= strfind(Data.textdata{index(i),1},'jmp'); % lets find where new groups start 
%          N= strfind(Data.textdata{index(i),1},'nop'); % lets find where new groups start 
        if P>0
           Data.textdata{index(i),1} ='nop';  
        else
           Data.textdata{index(i),1} ='jmp';  
        end
        
while exit 
        
     ValueUp = strfind(Data.textdata{start,1},'acc'); % lets find where new groups start 
     Position= strfind(Data.textdata{start,1},'jmp'); % lets find where new groups start 
     nothing= strfind(Data.textdata{start,1},'nop'); % lets find where new groups start 
     
     if ValueUp == 1  
         if  encoderData(start)>exitloop 
             exit = 0;
         end
         Accumulator =Accumulator+Data.data(start); 
         encoderData(start) = encoderData(start)+1;
   
         start=start+1;         
        
     elseif nothing ==1
         if  encoderData(start)>exitloop 
             exit = 0;
         end
         encoderData(start) = encoderData(start)+1;
         start=start+1;
         
     elseif Position ==1
         if  encoderData(start)>exitloop 
             exit = 0;
         end
         encoderData(start) = encoderData(start)+1;
         start=start+Data.data(start);    
     end  
     
   
end

 
end