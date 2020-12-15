% Mengjie, CSP (EE4/MSc), 2020, Imperial College.
% 23/12/2019

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Takes two M-Sequences of the same length and produces a gold sequence by
% adding a delay and performing modulo 2 addition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs
% mseq1 (Wx1 Integer) = First M-Sequence
% mseq2 (Wx1 Integer) = Second M-Sequence
% shift (Integer) = Number of chips to shift second M-Sequence to the right
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Outputs
% GoldSeq (Wx1 Integer) = W bits of 1's and 0's
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [GoldSeq]=fGoldSeq(mseq1,mseq2,shift)
x=19;
y=13;

%gives a balanced sequence 
for i=0:14 
    d_shift=1+mod(x+y,12)+i;
    if d_shift>=15
        d_shift=d_shift-15;
    end
    
    temp=circshift(mseq2',d_shift);
    temp=temp';
    newsequence=mod(temp+mseq1,2);
    balance=comparing(newsequence);
    if balance==1
        break;
    end
 
end

if shift==0
    goldsequence1=1-2*newsequence;
    GoldSeq=goldsequence1;

end 

if shift==1
    temp1=circshift(mseq2',d_shift+1);
    temp1=temp1';
    newsequence1=mod(temp1+mseq1,2);
    goldsequence1=1-2*newsequence1;

    GoldSeq=goldsequence1;
end

if shift==2
    temp2=circshift(mseq2',d_shift+2);
    temp2=temp2';
    newsequence2=mod(temp2+mseq1,2);
    goldsequence2=1-2*newsequence2;

    GoldSeq=goldsequence2;
end


   
end 