1)
prices = load 'NYSE_daily' as (exchange, symbol, date, open, high, low, close, volume, adj_close);
grp = group prices by symbol;
avg = foreach grp generate group, AVG(prices.close) as average;
store avg into 'Q1';