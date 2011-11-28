#!/usr/bin/perl

use strict;
use warnings;

use Dogs::Schema;

my $schema = Dogs::Schema->connect('dbi:SQLite:dogs.db');
