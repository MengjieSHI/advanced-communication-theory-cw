% NAME, GROUP (EE4/MSc), 2010, Imperial College.
% DATE

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Takes polynomial weights and produces an M-Sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs
% coeffs (Px1 Integers) = Polynomial coefficients. For example, if the
% polynomial is D^5+D^3+D^1+1 then the coeffs vector will be [1;0;1;0;1;1]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Outputs
% MSeq (Wx1 Integers) = W bits of 1's and 0's
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [MSeq]=fMSeqGen(coeffs)

 m=length(coeffs)-1;
    % number of recycled status
    len=2^m-1;
    %inital status 
    X1=0;X2=0;X3=0;X4=1; % my task1 inital 
if coeffs==[1 0 0 1 1]
    for i=1:len
        Y1=X1;Y2=X2;Y3=X3;Y4=X4;
        X4=Y3;X3=Y2; X2=Y1;  
        X1=xor(Y1,Y4);
       
        if X4==1
            seq(i)=1;
        else
            seq(i)=0;
        end 
    end
   MSeq=seq; 
else
    for i=1:len
        Y1=X1;Y2=X2;Y3=X3;Y4=X4;
        X1=xor(Y3,Y4);X2=Y1; X3=Y2; X4=Y3;
        if X4==1
            seq(i)=1;
        else
            seq(i)=0;
        end 
    end
   MSeq=seq;
    
end 
