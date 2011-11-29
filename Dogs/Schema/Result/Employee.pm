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
    sex => {
        data_type      => 'varchar',
        is_nullable    => 0,
    },
    breed_id => {
        data_type      => 'integer',
        is_nullable    => 0,
    },
    dept_id => {
        data_type      => 'integer',
        is_nullable    => 0,
    },
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint( [ qw/breed_id/ ] );

__PACKAGE__->has_one(
    'breed'  => 'Dogs::Schema::Result::Breed' => {
        'foreign.id' => 'self.breed_id'
    }
);

__PACKAGE__->has_many(
    'dog_vice'  => 'Dogs::Schema::Result::DogVice' => {
        'foreign.dog_id' => 'self.id'
    }
);

__PACKAGE__->many_to_many(
    'vices' => 'dog_vice' => 'vice'
);

__PACKAGE__->belongs_to(
    'department'  => 'Dogs::Schema::Result::Department' => {
        'foreign.id' => 'self.dept_id'
    }
);

1;
