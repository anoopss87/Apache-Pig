5)
divs = load 'NYSE_dividends' as (exchange, symbol, date, dividends); 
prices = load 'NYSE_daily' as (exchange, symbol, date, open, high, low, close, volume, adj_close);
grpd = COGROUP divs BY symbol, prices BY symbol;
nodiv = FILTER grpd BY COUNT(divs) == 0;
res = foreach nodiv generate group;
store res into 'Q5';