% counting the number of -1s(1s) and 1s(0s) and comparing them

function [difference]=comparing(msequence)

numof_1s=0;
numof1s=0;

for k=1:15
    if msequence(k)==1
        numof_1s=numof_1s+1;%calculate the number of -1s
    else %0 changes to 1
        numof1s=numof1s+1;%calculate the number of 1s
    end
    
end

difference=numof_1s-numof1s;
