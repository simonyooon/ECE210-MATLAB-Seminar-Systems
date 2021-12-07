% Simon Yoon ECE210AHW5
clc
clear 
close all
%%
A = importdata("StocksAll.csv")

stocksarr = A.textdata(1,2:7);
datearr = A.textdata(2:end, 1);

for i = 503
    datecellarr(i) = {Date(datearr(i+1))};
end

for i = 1:6
    closingpricearr = A.data(:,i);
    graph = Stock(stocksarr(i), datecellarr, closingpricearr);
    graph.stockplot;
end