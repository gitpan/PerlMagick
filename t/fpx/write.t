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
   '7267c8145131668953243274f49ea42706fd8227479f2daf8567515a4f7e9ee2');

#
# 2) Test grayscale image
#
++$test;
print( "8-bit grayscale FPX ...\n" );
testReadWrite( 'input_grayscale.fpx',
   'output_grayscale.fpx', '',
   '7194ec7209e3cf8bd5eaa10f03a59f7de2bfbc58c027a33fd9e9293b9819669c');
#
# 3) Test pseudocolor image
#
++$test;
print( "8-bit indexed-color FPX ...\n" );
testReadWrite( 'input_256.fpx',
   'output_256.fpx',
   q/quality=>54/,
   '3afebff726f7e0b3479ba548cf587b288d370f377c493c32d3b8e73d5545acd8' );
#
# 4) Test truecolor image
#
++$test;
print( "24-bit Truecolor FPX ...\n" );
testReadWrite( 'input_truecolor.fpx',
   'output_truecolor.fpx',
   q/quality=>55/,
   '975cdb03f0fa923936f1cecf7b8a49a917493393a0eb098828ab710295195584' );
