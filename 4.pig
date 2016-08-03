4)
players = load 'baseball' as (name:chararray, team:chararray,position:bag{t:(p:chararray)}, bat:map[]);
pos = foreach players generate name, flatten(position) as position;
bypos = group pos by position;
cnt = foreach bypos generate group, COUNT(pos.name) as count;
srt = order cnt by count desc;
store srt into 'Q4';