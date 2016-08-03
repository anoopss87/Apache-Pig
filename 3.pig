3)
divs = load 'NYSE_dividends' as (exchange, symbol, date, dividends); 
prices = load 'NYSE_daily' as (exchange, symbol, date, open, high, low, close, volume, adj_close);
divs_some = sample divs 0.1;
prices_some = sample prices 0.1;
jnd = join divs_some by symbol, prices_some by symbol;
grp = group jnd by prices_some::symbol;
average = foreach grp generate group, AVG(jnd.prices_some::open), AVG(jnd.divs_some::dividends);
store average into 'Q3';