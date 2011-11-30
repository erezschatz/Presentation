package Dogs::Schema::ResultSet::Department;
use base qw/DBIx::Class::ResultSet/;

sub employees_in_dept {
    my $self = shift;
    my $name = shift;

    return $self->find( {
        'me.name' => $name
    } )->search_related( 'employee' )->all;

}

1;
