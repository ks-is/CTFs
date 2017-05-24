#!/usr/bin/perl -w

use strict;
use warnings;
use MIME::Base64;

my $file = "Crypto03.txt";
my $i = 0;
open(my $INPUT, '<', $file)
	or die "[-] Could not open file '$file' $!\n";
while (my $row = <$INPUT>) {
	$row =~ s/^\s|\s$//g;
	for(;;) {
		if ($row =~ m/^[a-zA-Z0-9]+={0,2}$/g) {
			$row = decode_base64($row);
			$row =~ s/([a-fA-F0-9][a-fA-F0-9])/chr(hex($1))/eg;
		} else {
			last;
		}
	}
	print "$row\n";
}
close $INPUT;