clearvars;
%%
Data = importdata('Day9.txt');
% Data= importdata('Day9_Example.txt');

pream(1) = 1;
pream(2) = 25;


for i = 26:1000
    
    number = Data(i) ;
    exit = 1;
    numSpace = Data(pream(1):pream(2));
    counterFirst=1;
    counterSecond=1;
        
    while exit
        
        FirstNum =numSpace(counterFirst);
        SecondNum=numSpace(counterSecond);
        
        if (FirstNum+SecondNum)==number && counterFirst~=counterSecond
            exit =0;
        end
        
            counterSecond=counterSecond+1;
            
            if counterSecond>25
                counterFirst =counterFirst+1;
                counterSecond = 1;
            end
     
    end
    
    pream(1)=pream(1)+1;
    pream(2) = pream(2)+1;

 
end
    
    
%% 
invalid = 1124361034;
for i=1:1000
    exit = 1;
    
    while exit 
        
        for j = (i+1):1000
            
               answer = sum(Data(i:j)); 
               
            if (answer==invalid)
                a =0;
                return
            end
        end
        
        exit =0;
        
        
        
    end

end
    
    
list = Data(i:j);

answerPart2 = min(list) +max(list);

