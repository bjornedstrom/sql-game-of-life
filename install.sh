#!/bin/bash

createdb gameoflife
psql gameoflife < install.sql
