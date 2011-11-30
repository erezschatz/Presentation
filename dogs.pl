#!/usr/bin/perl

use strict;
use warnings;

use Dogs::Schema;

my $schema = Dogs::Schema->connect('dbi:SQLite:dogs.db');

#$schema->deploy;

=begin add new dog

$schema->resultset('Employee')->add_new_emp( 'Rexy', 'St. Bernard', 'Sales' ) ;

$schema->resultset('Employee')->create( {
    'name'       => 'Rexy',
    'dog_tag'    => rand,
    'breed'      => {
        'name' => 'St. Bernard',
    },
    'department' => {
        name => 'Sales'
    },
    'sex'        => 1,
    'timestamp'  => time,
} );

=cut

=begin get all dogs in a department

my @employees = $schema->resultset('Department')->employees_in_dept('Sales');

my @employees = $schema->resultset('Department')->find( {
    'me.name' => 'Sales'
})->search_related( 'employee' )->all;

print $_->name foreach @employees;

=cut

=begin change dept

$schema->resultset('Employee')->change_dept( 'Rexy', 'HR' );

$schema->resultset('Employee')->find( {
    'name' => 'Rexy',
    } )->department->update( {
        'name' => 'Sales'
    },
);

=cut

=begin add vice

$schema->resultset('Employee')->find({
    'name' => 'Rexy'
})->add_to_vices( {
    'type' => 'Drinking from toilet bowl'
});

#remove vice

my $vice_id = $schema->resultset('Vice')->find({
    'type' => 'Drinking from toilet bowl'
})->id;

$schema->resultset('Employee')->find({
    'name' => 'Rexy'
})->delete_related(
    'dog_vice' => {
        'vice_id' => $vice_id
    }
);

=cut

=begin show all mongrels

#$schema->resultset('Employee')->add_new_emp( 'Rover', 'Mongrel', 'IT' ) ;

my @employees = $schema->resultset('Employee')->search( {
    'breed.name' => 'Mongrel'
}, {
    'join' => 'breed'
} )->all;

#show all mongrels named Rover

@employees = $schema->resultset('Employee')->search( {
    'me.name'    => 'Rover',
    'breed.name' => 'Mongrel'
}, {
    'join' => 'breed'
} )->all;

print $_->name foreach @employees;

=cut
