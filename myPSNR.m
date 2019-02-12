function [ratio_d]=myPSNR(RGB,New)
[M, N]=size(New);

original_d=double(RGB);

bot_d=sum(sum(abs((original_d-New)*(original_d-New))))/(M*N);

top_d=max(max(New.*New));

ratio_d=10*log10(top_d/bot_d);

end