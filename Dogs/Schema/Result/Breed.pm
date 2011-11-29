package Dogs::Schema::Result::Breed;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('breed');

__PACKAGE__->add_columns(
    id => {
        data_type      => 'integer',
        is_nullable    => 0,
        auto_increment => 1,
    },
    name => {
        data_type      => 'varchar',
        is_nullable    => 0,
    },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->belongs_to(
    employee => 'Dogs::Schema::Result::Employee' => {
        'foreign.breed_id' => 'self.id'
    }
);


1;
