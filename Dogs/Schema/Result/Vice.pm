package Dogs::Schema::Result::Vice;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('vice');

__PACKAGE__->add_columns(
    id => {
        data_type      => 'integer',
        is_nullable    => 0,
        auto_increment => 1,
    },
    type => {
        data_type      => 'varchar',
        is_nullable    => 0,
    },
    punishment => {
        data_type      => 'varchar',
        is_nullable    => 1,
        default_value  => 'Paper roll',
    },
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint( [ qw/ type / ] );


__PACKAGE__->has_many(
    'dog_vice'  => 'Dogs::Schema::Result::DogVice' => {
        'foreign.vice_id' => 'self.id'
    }
);

__PACKAGE__->many_to_many(
    'employees' => 'dog_vice' => 'employee'
);


1;
