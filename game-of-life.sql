begin;

-- Insert all dead neighbors for the living cells.
insert into cells select x-1, y-1, 'D' from cells as c where state = 'L' and not exists (select 1 from cells where x = c.x-1 and y = c.y-1);
insert into cells select x  , y-1, 'D' from cells as c where state = 'L' and not exists (select 1 from cells where x = c.x   and y = c.y-1);
insert into cells select x+1, y-1, 'D' from cells as c where state = 'L' and not exists (select 1 from cells where x = c.x+1 and y = c.y-1);
insert into cells select x-1, y  , 'D' from cells as c where state = 'L' and not exists (select 1 from cells where x = c.x-1 and y = c.y  );
insert into cells select x+1, y  , 'D' from cells as c where state = 'L' and not exists (select 1 from cells where x = c.x+1 and y = c.y  );
insert into cells select x-1, y+1, 'D' from cells as c where state = 'L' and not exists (select 1 from cells where x = c.x-1 and y = c.y+1);
insert into cells select x  , y+1, 'D' from cells as c where state = 'L' and not exists (select 1 from cells where x = c.x   and y = c.y+1);
insert into cells select x+1, y+1, 'D' from cells as c where state = 'L' and not exists (select 1 from cells where x = c.x+1 and y = c.y+1);

-- Count the number of neighbors for all cells.
update cells as outer_cells set neighbors = case when (select 1 from cells where outer_cells.x-1 = x and outer_cells.y-1 = y and state = 'L') = 1 then 1 else 0 end +
       case when (select 1 from cells where outer_cells.x   = x and outer_cells.y-1 = y and state = 'L') = 1 then 1 else 0 end +
       case when (select 1 from cells where outer_cells.x+1 = x and outer_cells.y-1 = y and state = 'L') = 1 then 1 else 0 end +
       case when (select 1 from cells where outer_cells.x-1 = x and outer_cells.y   = y and state = 'L') = 1 then 1 else 0 end +
       case when (select 1 from cells where outer_cells.x+1 = x and outer_cells.y   = y and state = 'L') = 1 then 1 else 0 end +
       case when (select 1 from cells where outer_cells.x-1 = x and outer_cells.y+1 = y and state = 'L') = 1 then 1 else 0 end +
       case when (select 1 from cells where outer_cells.x   = x and outer_cells.y+1 = y and state = 'L') = 1 then 1 else 0 end +
       case when (select 1 from cells where outer_cells.x+1 = x and outer_cells.y+1 = y and state = 'L') = 1 then 1 else 0 end;

-- By the rules of the game, add the cells that should exist the next
-- iteration. We give these the "N"ew state instead of the "L"ive
-- state to differentate between the new and previous iterations.
insert into cells select x, y, 'N' from cells where state = 'L' and neighbors = 2 or neighbors = 3 union select x, y, 'N' from cells where state = 'D' and neighbors = 3;

-- Delete the old state and reset to "L".
delete from cells where state = 'D' or state = 'L';
update cells set state = 'L', neighbors = NULL;

commit;
