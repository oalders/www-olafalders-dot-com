#!/usr/bin/env perl

use strict;
use warnings;

use Git::Helpers::CPAN ();
use Open::This         ();

my $one = Git::Helpers::CPAN->new( name => 'Open::This' );

# Invoke Git::Helpers::CPAN with the :: suffix
my $two = Git::Helpers::CPAN::->new( name => 'Open::This' );

# Also pass Open::This:: as the value rather than the quoted 'Open::This'
my $three = Git::Helpers::CPAN::->new( name => Open::This:: );
