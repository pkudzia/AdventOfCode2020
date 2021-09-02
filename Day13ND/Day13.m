clearvars;
%%

execute =1;
% Data = importdata('Day13.txt');
fid = fopen('Day13.rtf');
C = textscan(fid, '%100s');
%% Rearrange stuff 
for i =1:3
Letters{i,1}= regexp(C{1,1}{i,1}, '\D', 'match'); % take out and put into cells each letter 
Numbers{i,1}= regexp(C{1,1}{i,1}, '\d*', 'match'); % matches numbers of consecutive digits 
end

% earliest time 
time = str2double(Numbers{1,1});
len = time+10000;
matrixOfTime=zeros((time+10000),9);

numbers = [19,37,523,13,23,29,547,41,17];

for j =1:9
   num = numbers(j);
    
for i=num:num:len
    
matrixOfTime(j,i)=NaN;


end

end
