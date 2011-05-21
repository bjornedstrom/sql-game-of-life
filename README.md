sql-game-of-life
================

Dirty hack for running Game of Life in PostgreSQL. I take no responsibility for pain caused when reading the code, it was the absolutely first that crossed my mind. Efficient? No. Beautiful? No. Does it work? Yes!

License: public domain

Install
-------

You need PostgreSQL installed. Then run install.sh

Usage
-----

First seed the database by

`$ psql gameoflife < $SEEDFILE`

Where `$SEEDFILE` is the seed for the game. You can use the provided `seed-f-pentamino.sql` or `seed-glider.sql` to get started. Check out the SQL to write your own.

Then just:

`$ ./game-of-life.sh`

Or even better:

`$ watch -n 1 ./game-of-life.sh`

Why?
----

It's Saturday. I hurt my back. I can do what I want to do.

-- Björn Edström <be@bjrn.se> 2011.
