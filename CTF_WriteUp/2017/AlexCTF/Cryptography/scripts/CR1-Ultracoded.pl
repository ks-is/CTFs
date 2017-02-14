# CR1: Ultracoded
# Fady didn't understand well the difference between encryption and encoding, so instead of encrypting some secret message to pass to his friend, he encoded it!
# Hint: Fady's encoding doens't handly any special character

use strict;
use warnings;
use MIME::Base64;
use Text::Morse;

my $file = 'lib/zero_one';
my $content = "";

open(my $f, '<'.$file) or die "[+] Could not open file $file: $!";
while (my $line = <$f>) {
	chomp $line;
	$content .= "$line\n";
}

# Get Binary string.
$content =~ s/ONE/1/ig;
$content =~ s/ZERO/0/ig;
$content =~ s/\s//ig;
my @content_array = split(/(.{8})/, $content);

# Convert Binary to ASCII, get Base64 encode.
my @string = map { pack("B*", $_); } @content_array;
my $string = join("", @string);

# Decode base64, get Morse code
my $b64_decode = decode_base64($string);

# Decode Morse code, get plain text
my $morse = new Text::Morse;
my $flag = scalar($morse->Decode($b64_decode));

# Clear plain text
$flag =~ s/O/\_/ig;
$flag =~ s/ALEXCTF/ALEXCTF\{/;
$flag = $flag . "}";

print "[+] Flag is: $flag\n";