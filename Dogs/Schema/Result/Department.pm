package Dogs::Schema::Result::Department;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('department');

__PACKAGE__->add_columns(
    id => {
        data_type      => 'integer',
        is_nullable    => 0,
        auto_increment => 1,
    },
    department => {
        data_type      => 'varchar',
        is_nullable    => 0,
    },
    is_top_dog => {
        data_type      => 'boolean',
        is_nullable    => 1,
    },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->has_many(
    employee => 'Dogs::Schema::Result::Employee' => {
        'foreign.dept_id' => 'self.id'
    }
);

1;
