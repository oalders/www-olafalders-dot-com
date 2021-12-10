package Local::Antler;

use Moose;

has some_date => (
    is      => 'ro',
    isa     => DateTime::,
    lazy    => 1,
    default => sub { DateTime->now },
);

__PACKAGE__->meta->make_immutable;
1;

package main;

sub do_something {
    my $a = Local::Antler->new;
    print $a->some_date;
}
