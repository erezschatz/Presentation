package Dogs::Schema::Result::DogVice;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('dogs_vices');

__PACKAGE__->add_columns(
    employee_id => {
        data_type      => 'integer',
        is_nullable    => 0,
    },
    vice_id => {
        data_type      => 'varchar',
        is_nullable    => 0,
    },
);

__PACKAGE__->set_primary_key(qw/ employee_id vice_id /);

__PACKAGE__->belongs_to(
    employee => 'Dogs::Schema::Result::Employee' => {
        'foreign.id' => 'self.employee_id'
    }
);

__PACKAGE__->belongs_to(
    vice => 'Dogs::Schema::Result::Vice' => {
        'foreign.id' => 'self.vice_id'
    }
);


1;
