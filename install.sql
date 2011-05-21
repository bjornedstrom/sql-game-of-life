-- x: x position
-- y: y position
-- state: "L"ive, "D"ead or "N"ew (see game-of-life.sql for meaning)
-- neighbors: number of living neighbors

create table cells (x integer, y integer, state char, neighbors int);
