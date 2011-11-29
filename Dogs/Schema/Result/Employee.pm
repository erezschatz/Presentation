package Dogs::Schema::Result::Employee;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('employee');
__PACKAGE__->load_components(qw/InflateColumn::DateTime/);

__PACKAGE__->add_columns(
    id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_auto_increment => 1,
    },
    name => {
        data_type         => 'varchar',
        is_nullable       => 0,
        default_value     => 'Rover',
    },
    sex => {
        data_type         => 'varchar',
        is_nullable       => 0,
    },
    breed_id => {
        data_type         => 'integer',
        is_nullable       => 0,
    },
    dept_id => {
        data_type         => 'integer',
        is_nullable       => 0,
    },
    timestamp => {
        data_type         => 'datetime',
        is_nullable       => 0,
        set_on_create     => 1,
        set_on_update     => 1,
    },
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint( [ qw/breed_id/ ] );
__PACKAGE__->add_unique_constraint( [ qw/dept_id/ ] );

__PACKAGE__->belongs_to(
    'department'  => 'Dogs::Schema::Result::Department' => {
        'foreign.id' => 'self.dept_id'
    }
);

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

1;
