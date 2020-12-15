%delay the signal according to the estimated delay 
function [symbolsdelay]=signaldelay(symbolsIn1,delay,coeff)
 symbolsIn1=symbolsIn1';
 temp1=reshape(symbolsIn1,[],1);
 add_before=zeros(delay,1);
 add_after=zeros(15-delay,1);
 symbolsOut1=[add_before;temp1;add_after];
 symbolsdelay=coeff*symbolsOut1;

end