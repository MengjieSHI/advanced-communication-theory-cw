% Mengjie, CSP (EE4/MSc), 2020, Imperial College.
% 23/12/2019

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Perform DS-QPSK Modulation on a vector of bits using a gold sequence
% with channel symbols set by a phase phi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs
% bitsIn (Px1 Integers) = P bits of 1's and 0's to be modulated
% goldseq (Wx1 Integers) = W bits of 1's and 0's representing the gold
% sequence to be used in the modulation process
% phi (Integer) = Angle index in degrees of the QPSK constellation points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Outputs
% symbolsOut (Rx1 Complex) = R channel symbol chips after DS-QPSK Modulation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% I dont think golden sequence is useful so I delete it 
function [symbolsOut]=fDSQPSKModulator(bitsIn,phi)
% what if m is not a integer?
[m n]=size(bitsIn);
symbol=m/2;
d=zeros(symbol,1); %r*1
for k=1:symbol
    a=bitsIn(2*k);
    b=bitsIn(2*k-1);
    if a==0&&b==0
        d(k)=(cos(phi)+1i*sin(phi))*sqrt(2);
    end 
    if a==0&&b==1
        d(k)=(cos(phi)-1i*sin(phi))*sqrt(2);
    end
    if a==1&&b==1
        d(k)=(-cos(phi)-1i*sin(phi))*sqrt(2);
    end 
    if a==1&&b==0
        d(k)=(-cos(phi)+1i*sin(phi))*sqrt(2);
    end
        
end
symbolsOut=d;
end

