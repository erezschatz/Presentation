#!/usr/bin/perl

use strict;
use warnings;

use Dogs::Schema;

my $schema = Dogs::Schema->connect('dbi:SQLite:dogs.db');
#$schema->deploy;


=begin add new dog

$schema->resultset('Employee')->create( {
    name => 'Rexy',
    breed => {
        name => 'St. Bernard',
    },
    department => {
        name => 'Sales'
    },
    sex => 1,
} );

=cut

#get all dogs in a department

#$schema->resultset('Department')->search( {

#change department

$schema->resultset('Employee')->find( {
    name => 'Rexy',
    } )->department->update( {
        name => 'HR'
    },
);

#add vice

#remove vice

#show all mongrels

#show all mongrels named Rover

#punish all dalmatians
