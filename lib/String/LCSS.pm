package String::LCSS;

BEGIN
{
use strict;
use vars qw( $VERSION );

	$VERSION = "0.11";
}


sub lcss
{
my ($a, $b) = @_;
my (@x, @y);
my ($maxLength, $maxXi) = (0,0);
my $returnString;


	my $m = length ( $a );
	my $n = length ( $b );

	if ( $m > $n ) {
		( $m, $n ) = ( $n, $m );
		( $a, $b ) = ( $b, $a );
	}

	@x = split ( //, $a );	
	@y = split ( //, $b );	

	for ( my $k = 0; $k < $n; $k++ ) {
		last if ( $maxLength >= ( $m - $k ) );

		my ( $xi, $length ) = ( 0, 0 );

		for ( my $i = 0; $i < $m; $i++ ) {
			my $j = $k;
					$length = 0;
			for ( my $ii = 0; $ii < ($m-$i); $ii++ ) {
				if ( $x[$i+$ii] eq $y[$j] ) {
					$xi = $i unless ( $length );
					$length++;
					$j++;
				}
				elsif ( $length ) {
					if ( $length > $maxLength ) {
						$maxLength = $length;
						$maxXi = $xi;
					}
					last;
				}
			}
		}
	}

	if ( $maxLength > 1 ) {
		for (my $i = $maxXi; $i < $maxXi+$maxLength; $i++ ) {
			$returnString .= $x[$i];
		}
	}

	$returnString;
}



#########################################################
# Do not change this, Do not put anything below this.
# File must return "true" value at termination
1;
##########################################################

__END__



=head1 NAME

String::LCSS - Find The Longest Common Substring of Two Strings.

=head1 SYNOPSIS

  require String::LCSS;
  my $longest = String::LCSS::lcss ( "zyzxx", "abczyzefg" );
  print $longest, "\n";


=head1 DESCRIPTION

String::LCSS provides the function "lcss" to ferret out the longest common
substring shared by two strings passed as arguments.  C<undef> is returned
if the susbstring length is one char or less.

=head1 COPYRIGHT

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=head1 BUGS

None presently known.

=head1 AUTHOR

Daniel Yacob,  L<Yacob@EthiopiaOnline.Net|mailto:Yacob@EthiopiaOnline.Net>

=cut
