clc 
clear 
%sources 
P=100*100*3*8;% bitsOut:P*1
[bitsOut1,a1,b1]=fImageSource('bear.png',P);
[bitsOut2,a2,b2]=fImageSource('annie1.png',P);
[bitsOut3,a3,b3]=fImageSource('house.png',P);
%QPSK modulation 
x=19; %smj
y=13;
phi=pi*((x+2*y)/180);
[symbolsOut1]=fDSQPSKModulator(bitsOut1,phi); 
[symbolsOut2]=fDSQPSKModulator(bitsOut2,phi);
[symbolsOut3]=fDSQPSKModulator(bitsOut3,phi);
%generate golden sequence 
coeffs1=[1 0 0 1 1]; %1st
coeffs2=[1 1 0 0 1];
mseq1=fMSeqGen(coeffs1); 
mseq2=fMSeqGen(coeffs2);
[GoldSeq1]=fGoldSeq(mseq1,mseq2,0);
[GoldSeq2]=fGoldSeq(mseq1,mseq2,1); 
[GoldSeq3]=fGoldSeq(mseq1,mseq2,2);

%spread  signals
symbolsIn1=symbolsOut1*GoldSeq1;
symbolsIn2=symbolsOut2*GoldSeq2;
symbolsIn3=symbolsOut3*GoldSeq3;


%channel
%SNR=0;
SNR=40;
[symbolsOut]=fChannel(symbolsIn1,symbolsIn2,symbolsIn3,SNR);

%estimate delay R1 
[estimatedelay]=signalestimate(symbolsOut,GoldSeq1);
desired_sym=symbolsOut(estimatedelay+1:1800015-(15-estimatedelay));
%despread signals
symbolsdelay1=reshape(desired_sym',15,[]);
receivedQPSK=GoldSeq1*symbolsdelay1;
receivedQPSK=receivedQPSK';

%OPSK demodulation 
[bitsOut]=fDSQPSKDemodulator(receivedQPSK,GoldSeq1,phi);
%display desired signals 
Q=100*100*3*8;
x=100;
y=100;
img=fImageSink(bitsOut,Q,x,y);
figure,subplot(2,2,1),imshow(imread('bear.png')),title('photo-1');
subplot(2,2,2),imshow(imread('annie1.png')),title('photo-2');
subplot(2,2,3),imshow(imread('house.png')),title('photo-3');
subplot(2,2,4),imshow(img),title(['Recovered photo-1 SNR=' num2str(SNR)]);









