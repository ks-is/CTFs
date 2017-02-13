use strict;
use warnings;

my @buf = ( 0x24,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x05,0x00,0x00,
0x00,0x36,0x00,0x00,0x00,0x65,0x00,0x00,0x00,0x07,0x00,
0x00,0x00,0x27,0x00,0x00,0x00,0x26,0x00,0x00,0x00,0x2d,
0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x0d,0x00,0x00,0x00,0x56,0x00,0x00,
0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x65,0x00,
0x00,0x00,0x03,0x00,0x00,0x00,0x2d,0x00,0x00,0x00,0x16,
0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x15,0x00,0x00,0x00,
0x03,0x00,0x00,0x00,0x65,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x29,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x44,0x00,
0x00,0x00,0x01,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x2b,
0x00,0x00,0x00 );
my $string = "L3t_ME_T3ll_Y0u_S0m3th1ng_1mp0rtant_A_{FL4G}_W0nt_b3_3X4ctly_th4t_345y_t0_c4ptur3_H0wev3r_1T_w1ll_b3_C00l_1F_Y0u_g0t_1t";
my $flag = "";

for(my $i=0; $i<scalar(@buf); $i+=4) {
	$flag .= substr($string, $buf[$i], 1);
}
print $flag;