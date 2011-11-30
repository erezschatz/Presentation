#!/usr/bin/perl

use strict;
use warnings;

use Dogs::Schema;

my $schema = Dogs::Schema->connect('dbi:SQLite:dogs.db');
#$schema->deploy;

=begin add new dog

$schema->resultset('Employee')->add_new_emp( 'Rexy', 'St. Bernard', 'Sales' ) ;

or

$schema->resultset('Employee')->create( {
    'name'       => 'Rexy',
    'breed'      => {
        'name' => 'St. Bernard',
    },
    'department' => {
        name => 'Sales'
    },
    'sex'        => 1,
    'timestamp'  => '\now()',
} );

=cut

=begin get all dogs in a department

my @employees = $schema->resultset('Department')->employees_in_dept('Sales');

or


my @employees = $schema->resultset('Department')->search( {
    'me.name' => 'Sales'
}, {
    'join' => 'employee'
})->all;

print $_->name foreach @employees;

=cut

=begin change department

$schema->resultset('Employee')->change_dept( 'Rexy, 'HR' );

$schema->resultset('Employee')->find( {
    'name' => 'Rexy',
    } )->department->update( {
        'name' => 'HR'
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

$schema->resultset('Employee')->find({
    'name' => 'Rexy'
})->delete_related(
    'vices' => {
        'type' => 'Drinking from toilet bowl'
    }
);

=cut

#show all mongrels

$schema->resultset('Employee')->add_new_emp( 'Rover', 'Mongrel', 'IT' ) ;
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
