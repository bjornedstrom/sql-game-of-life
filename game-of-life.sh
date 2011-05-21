#!/bin/bash

psql gameoflife < game-of-life.sql > /dev/null && psql gameoflife -c "select x, y from cells;" -t --no-align -F' ' | ./showgrid
