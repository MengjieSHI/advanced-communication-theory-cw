% Mengjie, CSP (EE4/MSc), 2020, Imperial College.
% 23/12/2019

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Perform demodulation of the received data using <INSERT TYPE OF RECEIVER>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs
% symbolsIn (Fx1 Integers) = R channel symbol chips received
% goldseq (Wx1 Integers) = W bits of 1's and 0's representing the gold
% sequence of the desired signal to be used in the demodulation process
% phi (Integer) = Angle index in degrees of the QPSK constellation points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Outputs
% bitsOut (Px1 Integers) = P demodulated bits of 1's and 0's
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [bitsOut]=fDSQPSKDemodulator(symbolsIn,GoldSeq,phi)
[m,n]=size(symbolsIn);
bitsnumber=m*2;
bitsOut=zeros(bitsnumber,1);
for k=1:m
    
    if real(symbolsIn(k))>0 && imag(symbolsIn(k))>0
        bitsOut(2*k-1:2*k)=[0;0];

    elseif real(symbolsIn(k))>0 && imag(symbolsIn(k))<0
        bitsOut(2*k-1:2*k)=[1;0];

    elseif real(symbolsIn(k))<0 && imag(symbolsIn(k))<0
        bitsOut(2*k-1:2*k)=[1;1];

    else 
        bitsOut(2*k-1:2*k)=[0;1];
    end 
    
    
end 
end
