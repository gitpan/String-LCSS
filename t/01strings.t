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

my $needle = "i pushed the lazy dog into a creek, the quick brown fox told me to";
my $haystack = "the quick brown fox jumps over the lazy dog";

$longest = String::LCSS::lcss ( $needle, $haystack );
is ( $longest, "the quick brown fox ", "the quick brown fox" );

$longest = String::LCSS::lcss ( $haystack, $needle );
is ( $longest, "the quick brown fox ", "the quick brown fox (reverse args)" );
