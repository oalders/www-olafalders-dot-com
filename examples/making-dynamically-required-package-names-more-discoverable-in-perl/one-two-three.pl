#!/usr/bin/env perl

use strict;
use warnings;

use Git::Helpers::CPAN ();
use Open::This         ();

my $one   = Git::Helpers::CPAN->new( name => 'Open::This' );
my $two   = Git::Helpers::CPAN::->new( name => 'Open::This' );
my $three = Git::Helpers::CPAN::->new( name => Open::This:: );
