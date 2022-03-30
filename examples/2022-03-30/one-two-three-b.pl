#!/usr/bin/env perl

use strict;
use warnings;

# This script will NOT compile

use Git::Helpers::CPAN ();

my $one = Git::Helpers::CPAN->new( name => 'Open::This' );

# Invoke Git::Helpers::CPAN with the :: suffix
my $two = Git::Helpers::CPAN::->new( name => 'Open::This' );

# Pass Open::This:: as value rather than the quoted 'Open::This'
my $three = Git::Helpers::CPAN::->new( name => Open::This:: );
