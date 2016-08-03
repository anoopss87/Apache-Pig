2)
divs = load 'data/NYSE_dividends' as (exchange, symbol, date, dividends);
grp = group divs by symbol;
max = foreach grp generate group, MAX(divs.dividends) as max;
store max into 'Q2';