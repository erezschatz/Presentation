#!/usr/bin/perl

use strict;
use warnings;

use Dogs::Schema;

my $schema = Dogs::Schema->connect('dbi:SQLite:dogs.db');
#$schema->deploy;

#add new dog

#get all dogs in a department

#change department

#add vice

#remove vice

#show all mongrels

#show all mongrels named Rover

#punish all dalmatians

