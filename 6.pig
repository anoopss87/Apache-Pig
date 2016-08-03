crawl = load 'webcrawl' as (url:chararray, num:int, pageid:bag{t:(p:chararray)});
id = foreach crawl generate url, flatten(pageid) as pid;
byid = group id by pid;
byurl = group id by url;
inlink_count = foreach byid {
	uniq_url = DISTINCT id.url;
	generate group, COUNT(uniq_url) as icount;
};
outlink_count = foreach byurl {
	uniq_pid = DISTINCT id.pid;
	generate group, COUNT(uniq_pid) as ocount;
};
jnd = join outlink_count by group, inlink_count by group;
res = foreach jnd generate $0, $1, $3;
store res into 'Q6';