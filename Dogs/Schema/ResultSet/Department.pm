package Dogs::Schema::ResultSet::Department;
use base qw/DBIx::Class::ResultSet/;

sub employees_in_dept {
    my $self = shift;
    my $name = shift;
    return $self->search( {
        'me.name' => $name
    }, {
        'join' => 'employee'
    })->all;

}

1;
