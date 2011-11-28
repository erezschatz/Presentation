package Dogs::Schema::Result::Vice;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('vice');

__PACKAGE__->add_columns(
    id => {
        data_type      => 'integer',
        is_nullable    => 0,
        auto_increment => 1,
    },
    vice => {
        data_type      => 'varchar',
        is_nullable    => 0,
    },
    punishment => {
        data_type      => 'varchar',
        is_nullable    => 1,
    },
);

__PACKAGE__->set_primary_key('id');

1;
