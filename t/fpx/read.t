#!/usr/local/bin/perl
#
# Test reading FPX images
#
# Contributed by Bob Friesenhahn <bfriesen@simple.dallas.tx.us>
#

BEGIN { $| = 1; $test=1; print "1..5\n"; }
END {print "not ok $test\n" unless $loaded;}
use Image::Magick;
$loaded=1;

require 't/subroutines.pl';

chdir 't/fpx' || die 'Cd failed';

#
# 1) Test Black-and-white, bit_depth=1 FPX
# 
print( "1-bit grayscale FPX ...\n" );
testRead( 'input_bw.fpx',
  '7267c8145131668953243274f49ea42706fd8227479f2daf8567515a4f7e9ee2' );

#
# 2) Test grayscale FPX
# 
++$test;
print( "8-bit grayscale FPX ...\n" );
testRead( 'input_grayscale.fpx',
  '7194ec7209e3cf8bd5eaa10f03a59f7de2bfbc58c027a33fd9e9293b9819669c' );

#
# 3) Test 256 color pseudocolor FPX
# 
++$test;
print( "8-bit indexed-color FPX ...\n" );
testRead( 'input_256.fpx',
  '3afebff726f7e0b3479ba548cf587b288d370f377c493c32d3b8e73d5545acd8' );

#
# 4) Test TrueColor FPX
# 
++$test;
print( "24-bit Truecolor FPX ...\n" );
testRead( 'input_truecolor.fpx',
  '5a5f94a626ee1945ab1d4d2a621aeec4982cccb94e4d68afe4c784abece91b3e' );

#
# 5) Test JPEG FPX
# 
++$test;
print( "24-bit JPEG FPX ...\n" );
testRead( 'input_jpeg.fpx',
  '45a41e0ef7ad4b2ab890978457f1c51919139d6036bbf27f3e0adfb7732c0b48' );

