package Dogs::Schema::Result::Breed;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('breed');

__PACKAGE__->add_columns(
    id => {
        data_type      => 'integer',
        is_nullable    => 0,
        auto_increment => 1,
    },
    breed => {
        data_type      => 'varchar',
        is_nullable    => 0,
        default_value  => 'Mongrel',
    },
);

__PACKAGE__->set_primary_key('id');

1;
