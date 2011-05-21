sql-game-of-life
================

Quick and dirty implementation of Game of Life in SQL (requires PostgreSQL as-is, but can most likely be adapted easily to other systems). I make no claims that this is a very good implementation, it was simply the first that I got working and I stopped at that. Efficient? No. Beautiful? No. Does it work? Yes!

License: public domain.

Install
-------

You need PostgreSQL installed. Then run `install.sh`.

Usage
-----

First seed the database by

`$ psql gameoflife < $SEEDFILE`

Where `$SEEDFILE` is the seed for the game. You can use the provided `seed-f-pentamino.sql` or `seed-glider.sql` to get started. Check out the SQL to write your own.

Then just:

`$ ./game-of-life.sh`

Or even better:

`$ watch -n 0.1 ./game-of-life.sh`

Why?
----

It's Saturday. I hurt my back. I can't do what I'd rather be doing. :)

-- Björn Edström <be@bjrn.se> 2011.
