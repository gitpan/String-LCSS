# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

use Test::More qw(no_plan);
use strict;

require String::LCSS;

is ( 1, 1, "loaded." );

my $longest = String::LCSS::lcss ( "xyzzx", "abcxyzefg" );
is ( $longest, "xyz", "xyzzx vs abcxyzefg" );

$longest = String::LCSS::lcss ( "abcxyzzx", "abcxyzefg" );
is ( $longest, "abcxyz", "abcxyzzx vs abcxyzefg" );

$longest = String::LCSS::lcss ( "foobar", "abcxyzefg" );
is ( $longest, undef, "foobar vs abcxyzefg" );
