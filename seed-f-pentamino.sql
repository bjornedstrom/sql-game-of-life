begin;

truncate cells;

insert into cells (x, y, state) values (0, 1, 'L');
insert into cells (x, y, state) values (0, 2, 'L');
insert into cells (x, y, state) values (1, 0, 'L');
insert into cells (x, y, state) values (1, 1, 'L');
insert into cells (x, y, state) values (2, 1, 'L');

commit;
