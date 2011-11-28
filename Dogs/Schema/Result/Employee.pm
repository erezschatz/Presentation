package Dogs::Schema::Result::Employee;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('employee');

__PACKAGE__->add_columns(
    id => {
        data_type      => 'integer',
        is_nullable    => 0,
        auto_increment => 1,
    },
    name => {
        data_type      => 'varchar',
        is_nullable    => 0,
        default_value  => 'Rover',
    },
);

__PACKAGE__->set_primary_key('id');

1;
