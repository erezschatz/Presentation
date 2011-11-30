package Dogs::Schema::ResultSet::Employee;
use base qw/DBIx::Class::ResultSet/;

sub add_new_emp {
    my $self  = shift;
    my ( $name, $breed, $dept ) = @_;
    return $self->create( {
        'name' => $name,
        'breed' => {
            'name' => $breed,
        },
        'department' => {
            'name' => $dept
        },
        'sex' => 1,
        'timestamp' => '\now()'
    } );
}

sub change_dept {
    my $self = shift;
    my ( $name, $dept ) = @_;
    return $self->find( {
        'name' => $name,
    } )->department->update( {
        'name' => $dept
    } );
}

1;
