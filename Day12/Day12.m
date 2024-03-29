clearvars;
execute =1;
Data = importdata('Day12.txt');
%% Rearrange stuff 
Letters= regexp(Data, '\D', 'match'); % take out and put into cells each letter 
temp= regexp(Data, '\d*', 'match'); % matches numbers of consecutive digits 

for i=1:numel(temp)
    Numbers(i,1) = str2double(temp{i,1});
end

%% Part 1 
FacingPostion ='E'; % this is the starting postion of the ship facing east 
currentPosition = [0,0];
count =1;

while execute 
    
    Corr = Letters{count,1};
    posChange=Numbers(count); 
    
    [newPosition,FacingPostionUpdated] = positionChange(Corr,posChange,FacingPostion,currentPosition);
    
    FacingPostion = FacingPostionUpdated;
    currentPosition = newPosition; 
    
    if count==numel(Letters)
        execute = 0;
    end
    
    count= count+1;
  
end 

answer1= sum(abs(currentPosition));
%% Part 2

WayPointPosition = [1,10]; % 1 north and 10 east 
currentPosition = [0,0];
count =1;
execute =1;

while execute 
    
    Corr = Letters{count,1};
    posChange=Numbers(count); 
    
    [newPosition,WayPointPositionUpdated] = waypointChange(Corr,posChange,WayPointPosition,currentPosition);
    
    WayPointPosition = WayPointPositionUpdated;
    currentPosition = newPosition; 
    
    if count==numel(Letters)
        execute = 0;
    end
    
    count= count+1;
  
end 

answer2= sum(abs(currentPosition));

%%


function [newPosition,newWayPointPosition] = waypointChange(inputLetter,inputPosChange,WayPointPosition,currentPosition)


    if contains(inputLetter,'N') %north 

        newWayPointPosition(1,1) = WayPointPosition(1,1)+inputPosChange; % no change
        newWayPointPosition(1,2) = WayPointPosition(1,2); % no change
        newPosition = currentPosition; 
    
    elseif contains(inputLetter,'S') %south 
        newPosition = currentPosition; 
        newWayPointPosition(1,1) = WayPointPosition(1,1)-inputPosChange; % no change
        newWayPointPosition(1,2) = WayPointPosition(1,2); % no change

    elseif contains(inputLetter,'E') %east 
        newPosition = currentPosition; 
        newWayPointPosition(1,1) = WayPointPosition(1,1); % no change
        newWayPointPosition(1,2) = WayPointPosition(1,2)+inputPosChange; % no change

    elseif contains(inputLetter,'W') %west
        newPosition = currentPosition; 
        newWayPointPosition(1,1) = WayPointPosition(1,1); % no change
        newWayPointPosition(1,2) = WayPointPosition(1,2)-inputPosChange; % no change

    elseif contains(inputLetter,'R') %left
            if inputPosChange ==90
                newWayPointPosition(1,1) = -WayPointPosition(1,2);
                newWayPointPosition(1,2) = WayPointPosition(1,1);
            elseif inputPosChange ==180
                newWayPointPosition(1,1) = -WayPointPosition(1,1);
                newWayPointPosition(1,2) = -WayPointPosition(1,2);
            elseif inputPosChange ==270
                newWayPointPosition(1,1) = WayPointPosition(1,2);
                newWayPointPosition(1,2) = -WayPointPosition(1,1);
            else
                newWayPointPosition(1,1) = WayPointPosition(1,1);
                newWayPointPosition(1,2) = WayPointPosition(1,2);
            end
             newPosition = currentPosition; 
              
    elseif contains(inputLetter,'L') %right 
        
            if inputPosChange ==90
                newWayPointPosition(1,1) = WayPointPosition(1,2);
                newWayPointPosition(1,2) = -WayPointPosition(1,1);
            elseif inputPosChange ==180
                newWayPointPosition(1,1) = -WayPointPosition(1,1);
                newWayPointPosition(1,2) = -WayPointPosition(1,2);
            elseif inputPosChange ==270
                newWayPointPosition(1,1) = -WayPointPosition(1,2);
                newWayPointPosition(1,2) = WayPointPosition(1,1);
            else
                newWayPointPosition(1,1) = WayPointPosition(1,1);
                newWayPointPosition(1,2) = WayPointPosition(1,2);
            end
            
             newPosition = currentPosition; 

    elseif contains(inputLetter,'F') %forward
        
        newPosition(1,1) = currentPosition(1,1)+(WayPointPosition(1,1)*inputPosChange); 
        newPosition(1,2) = currentPosition(1,2)+(WayPointPosition(1,2)*inputPosChange); 
        
        newWayPointPosition = WayPointPosition;

    end

         
      

end





%%

function [newPosition,newFacingPostion] = positionChange(inputLetter,inputPosChange,inputFacing,currentPosition)


    if contains(inputLetter,'N') %north 
        newPosition(1,1) = currentPosition(1,1)+inputPosChange;
        newPosition(1,2) = currentPosition(1,2);
        newFacingPostion = inputFacing; % no change
    
    elseif contains(inputLetter,'S') %south 
        newPosition(1,1) = currentPosition(1,1)-inputPosChange;
        newPosition(1,2) = currentPosition(1,2);
        newFacingPostion = inputFacing;% no change

    elseif contains(inputLetter,'E') %east 
        newPosition(1,1) = currentPosition(1,1);
        newPosition(1,2) = currentPosition(1,2)+inputPosChange;
        newFacingPostion = inputFacing;% no change

    elseif contains(inputLetter,'W') %west
        newPosition(1,1) = currentPosition(1,1);
        newPosition(1,2) = currentPosition(1,2)-inputPosChange;
        newFacingPostion = inputFacing;% no change

    elseif contains(inputLetter,'L') %left
        
        if contains(inputFacing,'E')
            
            if inputPosChange ==90
                newFacingPostion = 'N';% 
            elseif inputPosChange ==180
                newFacingPostion = 'W';% 
            elseif inputPosChange ==270
                newFacingPostion = 'S';% 
            else
                newFacingPostion =inputFacing;
            end
             newPosition = currentPosition;    
                
            
        elseif contains(inputFacing,'W')
            
            if inputPosChange ==90
                newFacingPostion = 'S';% 
            elseif inputPosChange ==180
                newFacingPostion = 'E';% 
            elseif inputPosChange ==270
                newFacingPostion = 'N';% 
            else
                newFacingPostion =inputFacing;
            end
            
             newPosition = currentPosition;    
            
        elseif contains(inputFacing,'S')
            if inputPosChange ==90
                newFacingPostion = 'E';% 
            elseif inputPosChange ==180
                newFacingPostion = 'N';% 
            elseif inputPosChange ==270
                newFacingPostion = 'W';% 
            else
                newFacingPostion =inputFacing;
            end
            
             newPosition = currentPosition;   
            
        elseif contains(inputFacing,'N')
            
            if inputPosChange ==90
                newFacingPostion = 'W';% 
            elseif inputPosChange ==180
                newFacingPostion = 'S';% 
            elseif inputPosChange ==270
                newFacingPostion = 'E';% 
            else
                newFacingPostion =inputFacing;
            end
            
             newPosition = currentPosition;  
            
        end
        

    elseif contains(inputLetter,'R') %right 
        
        if contains(inputFacing,'E')
            
            if inputPosChange ==90
                newFacingPostion = 'S';% 
            elseif inputPosChange ==180
                newFacingPostion = 'W';% 
            elseif inputPosChange ==270
                newFacingPostion = 'N';% 
            else
                newFacingPostion =inputFacing;
            end
             newPosition = currentPosition;    
                
            
        elseif contains(inputFacing,'W')
            
            if inputPosChange ==90
                newFacingPostion = 'N';% 
            elseif inputPosChange ==180
                newFacingPostion = 'E';% 
            elseif inputPosChange ==270
                newFacingPostion = 'S';% 
            else
                newFacingPostion =inputFacing;
            end
            
             newPosition = currentPosition;    
            
        elseif contains(inputFacing,'S')
            if inputPosChange ==90
                newFacingPostion = 'W';% 
            elseif inputPosChange ==180
                newFacingPostion = 'N';% 
            elseif inputPosChange ==270
                newFacingPostion = 'E';% 
            else
                newFacingPostion =inputFacing;
            end
            
             newPosition = currentPosition;   
            
        elseif contains(inputFacing,'N')
            
            if inputPosChange ==90
                newFacingPostion = 'E';% 
            elseif inputPosChange ==180
                newFacingPostion = 'S';% 
            elseif inputPosChange ==270
                newFacingPostion = 'W';% 
            else
                newFacingPostion =inputFacing;
            end
            
             newPosition = currentPosition;  
            
        end

    elseif contains(inputLetter,'F') %forward
        
         if contains(inputFacing,'N')
            newPosition(1,1) = currentPosition(1,1)+inputPosChange;
            newPosition(1,2) = currentPosition(1,2);
            
         elseif contains(inputFacing,'S')
            newPosition(1,1) = currentPosition(1,1)-inputPosChange;
            newPosition(1,2) = currentPosition(1,2);
             
         elseif contains(inputFacing,'E')
            newPosition(1,1) = currentPosition(1,1);
            newPosition(1,2) = currentPosition(1,2)+inputPosChange;
             
         elseif contains(inputFacing,'W')
            newPosition(1,1) = currentPosition(1,1);
            newPosition(1,2) = currentPosition(1,2)-inputPosChange;             
         end
         
         newFacingPostion =inputFacing;

    end

end
