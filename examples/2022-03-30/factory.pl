#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say signatures );
no warnings qw( experimental::signatures );

use Git::Helpers::CPAN ();

sub object_factory ( $class, $name ) {
    return $class->new( name => $name );
}

my $module = object_factory( 'Git::Helpers::CPAN', 'Open::This' );
say $module->repository->{url};
