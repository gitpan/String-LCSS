package String::LCSS;
use base ( 'Exporter' );

BEGIN
{
use strict;
use vars qw( $VERSION @EXPORT_OK);

	$VERSION = "0.12";

	@EXPORT_OK = qw( lcss );
}


sub lcss
{
my ($a, $b) = @_;
my (@x, @y);
my ($maxLength, $maxXi, $maxXk, $switch) = (0,0,0,0);
my $returnString;


	my $m = length ( $a );
	my $n = length ( $b );

	if ( $m > $n ) {
		( $m, $n ) = ( $n, $m );
		( $a, $b ) = ( $b, $a );
		$switch = 1;
	}

	@x = split ( //, $a );	
	@y = split ( //, $b );	

	#
	# declare varialbes outside of loops for a hair more speed.
	#
	my ( $i, $ii, $j, $k, $length, $xi, $xj );

	for ( $k = 0; $k < $n; $k++ ) {
		#
		# abort if the remainder of the string to check is
		# less than the common substring length already found
		#
		last if ( $maxLength >= ( $m - $k ) );

		( $xi, $length ) = ( 0, 0 );

		for ( $i = 0; $i < $m; $i++ ) {
			$j = $k;
			$length = 0;
			for ( $ii = 0; $ii < ($m-$i); $ii++ ) {
				if ( $x[$i+$ii] eq $y[$j] ) {
					$xi = $i+$ii unless ( $length );
					$xj = $j unless ( $length );
					$length++;
					$j++;
				}
				elsif ( $length ) {
					if ( $length > $maxLength ) {
						$maxLength = $length;
						$maxXi = $xi;
						$maxXk = $xj;
					}
					last;
				}
			}
		}
	}

	if ( $maxLength > 1 ) {
		for ($i = $maxXi; $i < $maxXi+$maxLength; $i++ ) {
			$returnString .= $x[$i];
		}
		($maxXi, $maxXk) = ($maxXk, $maxXi) if ( $switch );
	}

	( wantarray ) ? ( $returnString, $maxXi, $maxXk ) :  $returnString;
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

  my @result = String::LCSS::lcss ( "zyzxx", "abczyzefg" );
  print "$result[0] ($result[1],$result[2])\n";

=head1 DESCRIPTION

String::LCSS provides the function "lcss" to ferret out the longest common
substring shared by two strings passed as arguments.  C<undef> is returned
if the susbstring length is one char or less.

When used in an array context, lcss will returns the indexi of the match
root in the two args.

=head1 COPYRIGHT

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=head1 BUGS

None presently known.

=head1 AUTHOR

Daniel Yacob,  L<Yacob@EthiopiaOnline.Net|mailto:Yacob@EthiopiaOnline.Net>

=cut
