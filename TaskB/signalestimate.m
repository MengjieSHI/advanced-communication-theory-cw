
%estimate signal delays according to the orthogonality of m-sequence  
function [estimate_delay]=signalestimate(symbolsOut,goldenSeq1)
cross_correlation=zeros(1,15);
symbolsOut=symbolsOut';%size 1800015*1

goldenSeqnew=zeros(1,1800000);
for i=1:15:1799986
    goldenSeqnew(i:i+14)=goldenSeq1;  
end 

for k=0:14
    
    a_padding=[zeros(1,k),goldenSeqnew(1:1800000),zeros(1,15-k)];
    cross_correlation(k+1)=abs(a_padding*symbolsOut);
    
    
end

[~,delay]=max(cross_correlation);%find the maximum value
estimate_delay=delay-1;% the location of the maximum value-1 is the estimated delay

end