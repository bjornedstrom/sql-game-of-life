begin;

truncate cells;

insert into cells (x, y, state) values (0, 1, 'L');
insert into cells (x, y, state) values (1, 2, 'L');
insert into cells (x, y, state) values (2, 0, 'L');
insert into cells (x, y, state) values (2, 1, 'L');
insert into cells (x, y, state) values (2, 2, 'L');

commit;
