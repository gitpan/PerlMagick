#!/usr/local/bin/perl
#
# Test writing FPX images
#
# Contributed by Bob Friesenhahn <bfriesen@simple.dallas.tx.us>
#
BEGIN { $| = 1; $test=1; print "1..4\n"; }
END {print "not ok $test\n" unless $loaded;}

use Image::Magick;
$loaded=1;

require 't/subroutines.pl';

chdir 't/fpx' || die 'Cd failed';

#
# 1) Test Black-and-white, bit_depth=1 FPX
# 
print( "1-bit grayscale FPX ...\n" );
testReadWrite( 'input_bw.fpx', 'output_bw.fpx', q/quality=>95/,
   'f0b05472b44ffe3e59a83310a340cbf4d1688cb786413f2e96df65710dd97457');

#
# 2) Test monochrome image
#
++$test;
print( "8-bit grayscale FPX ...\n" );
testReadWrite( 'input_mono.fpx',
   'output_mono.fpx', '',
   'f0b05472b44ffe3e59a83310a340cbf4d1688cb786413f2e96df65710dd97457');
#
# 3) Test pseudocolor image
#
++$test;
print( "8-bit indexed-color FPX ...\n" );
testReadWrite( 'input_256.fpx',
   'output_256.fpx',
   q/quality=>54/,
   '282a5994e2f7a67b055df158876d3d3e46a0589c5052a6842be8262a67dba222' );
#
# 4) Test truecolor image
#
++$test;
print( "24-bit Truecolor FPX ...\n" );
testReadWrite( 'input_truecolor.fpx',
   'output_truecolor.fpx',
   q/quality=>55/,
   'a5d122b2b7a0944d835243afd4a81815bbea5bc1ae6c3a6ba79301662b4474a1' );
