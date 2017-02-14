# TR4: Doesn't our logo look cool ?

use strict;
use warnings;

my $file = 'lib/logo.txt';
my $content = "";

open(my $f, '<'.$file) or die "[+] Could not open file $file: $!";
while (my $line = <$f>) {
	chomp $line;
	$content .= "$line\n";
}

$content =~ s/[^0-9A-Za-z_\{\}]//ig;

print "[+] Flag is: $content\n";