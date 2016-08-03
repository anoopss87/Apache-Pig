8)
bball = load 'baseball' as (name:chararray, team:chararray, position:bag{t:(p:chararray)}, bat:map[]);
grp = group bball by team;
cnt = foreach grp generate group, COUNT(bball.name) as counter;
srt = order cnt by counter desc;
top5 = limit srt 5;
store top5 into 'Q8';