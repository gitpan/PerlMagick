#!/usr/local/bin/perl
#
# Test reading Radiance file format
#
# Whenever a new test is added/removed, be sure to update the
# 1..n ouput.
#
BEGIN { $| = 1; $test=1; print "1..1\n"; }
END {print "not ok $test\n" unless $loaded;}
use Image::Magick;
$loaded=1;

require 't/subroutines.pl';

chdir 't/rad' || die 'Cd failed';

testRead( 'RAD:input.rad',
  '1277e217f62ef66d77b8afb79ff0b9e4204a47ccd7663057f27a5255ebb0640c');
