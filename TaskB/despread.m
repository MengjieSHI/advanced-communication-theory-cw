function [symbolsOut]=despread(snew,goldseq1)
snew=reshape(snew,15,[]);%size 15*120000
symbolsOut=(goldseq1*snew)';%use gold sequence to despread
end