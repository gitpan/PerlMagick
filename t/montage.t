#!/usr/local/bin/perl
#
# Test montage method.
#
# Contributed by Bob Friesenhahn <bfriesen@simple.dallas.tx.us>
#
BEGIN { $| = 1; $test=1, print "1..19\n"; }
END {print "not ok 1\n" unless $loaded;}
use Image::Magick;
$loaded=1;

require 't/subroutines.pl';

chdir 't' || die 'Cd failed';

#
# 1) Test montage defaults (except no label that requires an exact font)
#
testMontage( q//,
  q/background=>'#696e7e', label=>''/,
  '54276cda8971bcb5a16625ccd406cb3cd36f54e328be39c29de6fdf197e52bb4');

#
# 2) Test Center gravity
#    Image should be centered in frame
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', geometry=>'90x80+5+5>', gravity=>'Center'/,
  'a1d7da5474ef2620fe5ecd48865db96c03089856f2f59e58fcaab141caacb9e3');

#
# 3) Test NorthWest gravity
#    Image should be at top-left in frame
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', geometry=>'90x80+5+5>', gravity=>'NorthWest'/,
  'de8e3ea5416787b269c1244a240ab57dbc64b5cdbdc2039de045d11d222b24ac');

#
# 4) Test North gravity
#    Image should be at top-center of frame
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', geometry=>'90x80+5+5>', gravity=>'North'/,
  '4309283a879e7dbf967848c4550f93d877a6bc26c721203aadf2812f56aa798c');

#
# 5) Test NorthEast gravity
#    Image should be at top-right of frame
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', geometry=>'90x80+5+5>', gravity=>'NorthEast'/,
  'd6ee493b206d493fa2c14a037b56d180c9894677bbcc390ed4f0e2244e106cd7');

#
# 6) Test West gravity
#    Image should be at left-center of frame
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', geometry=>'90x80+5+5>', gravity=>'West'/,
  '0869c4c7fda245c38fb2edaa1b777958d045f3cd6ad08c932efa7f5f42f9d2c4');

#
# 7) Test East gravity
#    Image should be at right-center of frame.
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', geometry=>'90x80+5+5>', gravity=>'East'/,
  'ba46e2687647ca67cfa68e82656338e42be9d05034f22a653d3dc3b18dd74078');

#
# 8) Test SouthWest gravity
#    Image should be at bottom-left of frame
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', geometry=>'90x80+5+5>', gravity=>'SouthWest'/,
  '1a604be81140ea226ae74fd9f9d9a75c566cc9b5c8404d3322557a92b363dbc1');

#
# 9) Test South gravity
#    Image should be at bottom of frame
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', geometry=>'90x80+5+5>', gravity=>'South'/,
  'caca511b3b8ee70eb1f030ce1e013e62152a7bc98204f9340479d3f5f140adb4');

#
# 10) Test SouthEast gravity
#     Image should be at bottom-right of frame.
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', geometry=>'90x80+5+5>', gravity=>'SouthEast'/,
  '4053414da05c9fd4f86850f8da3b9880a1dea880471cf6fa079dc65cbd496cc4');

#
# 11) Test Framed Montage
#
# Image border color 'bordercolor' controls frame background color
# Image matte color 'mattecolor' controls frame color
# Image pen color 'pen' controls label text foreground color
++$test;
testMontage( q/bordercolor=>'blue', mattecolor=>'red'/, 
  q/background=>'#696e7e', label=>'', tile=>'4x4', geometry=>'90x80+3+3>', frame=>'8x10',
  borderwidth=>'0', gravity=>'Center', background=>'gray'/,
  'b8f575e35a0730873e88f4b6b289e517d4e2f1b76a6916cab9626fe268fefff7',
  'b8f575e35a0730873e88f4b6b289e517d4e2f1b76a6916cab9626fe268fefff7',
  'e08c0e6c19ed24b2d0d2fe96e8b8cdf99e0102e6ade368bc0f328443aaed1f18');

#
# 12) Test Framed Montage with drop-shadows
#
++$test;
testMontage( q/bordercolor=>'blue', mattecolor=>'red'/, 
  q/background=>'#696e7e', label=>'', tile=>'4x4', geometry=>'90x80+6+6>', frame=>'8x10',
  borderwidth=>'0', gravity=>'Center', shadow=>'True',background=>'gray'/,
  '8092a0d66e8856f8ecbff43c534b93eca21942468956ca238bdcc4fc74d3cb24',
  'a686625ee84345193f2a5cb4a16e49bf8b9ea44a842b7484b2a34e5e646eb010',
  '3ff5c584e7f22134ee49c9082d2b60aadecabd1020671b76b94703dc0cffe553');

#
# 13) Test Framed Montage with drop-shadows and background texture
#
++$test;
testMontage( q/bordercolor=>'blue', mattecolor=>'red'/, 
  q/background=>'#696e7e', label=>'', tile=>'4x4', geometry=>'90x80+6+6>', frame=>'8x10',
  borderwidth=>'0', gravity=>'Center', shadow=>'True', texture=>'granite:'/,
  '36aab8cdbf0dd787d73ef780295df9b350694189fe61f06bbcccce57c57c61b1',
  '12972173aef9e114f4f011cf16b6a279ab93ba3469bf6460f8ede896e402d881',
  '0548e1a350e783f3352da96d0367cff352593fc1b30b4692316bbb34475351c3');

#
# 14) Test Un-bordered, Un-framed Montage
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', tile=>'4x4', geometry=>'90x80+6+6>', mode=>'Unframe',
  borderwidth=>'0', gravity=>'Center', background=>'gray'/,
  '407e153c5a2348f7860c9d70f3b9951b020e338f3cd86845f79334fb875c5196');

#
# 15) Test Bordered, Un-framed Montage (mode=>'Unframe')
#
++$test;
testMontage( q/bordercolor=>'red'/, 
  q/background=>'#696e7e', label=>'', tile=>'4x4', geometry=>'90x80+6+6>', mode=>'Unframe',
  borderwidth=>'5', gravity=>'Center', background=>'gray'/,
  '380f416d496c68516b54e02ecf44d1c232f8b47427528db176eef3bd046bc2b8');

#
# 16) Test Bordered, Un-framed Montage (mode=>'UnFrame')
#
++$test;
testMontage( q/bordercolor=>'red'/, 
  q/label=>'', tile=>'4x4', geometry=>'90x80+6+6>', mode=>'UnFrame',
  borderwidth=>'5', gravity=>'Center', background=>'gray'/,
  '380f416d496c68516b54e02ecf44d1c232f8b47427528db176eef3bd046bc2b8');

#
# 17) Test Un-bordered, Un-framed Montage with 16x1 tile
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', tile=>'16x1', geometry=>'90x80+0+0>', mode=>'Unframe',
  borderwidth=>'0', gravity=>'Center', background=>'gray'/,
  'f384e3db0dd52e7420239be24e25c1cf438b6d08550a5a55137838bf329a0433');

#
# 18) Test concatenated thumbnail Montage (concatenated via special Concatenate mode)
#     Thumbnails should be compacted tightly together in a grid
#
++$test;
testMontage( q//,
  q/background=>'#696e7e', label=>'', tile=>'4x4', geometry=>'90x80>', mode=>'Concatenate'/,
  '06db877ef6a9842d12f4f604940d23622826884333c32f169ce795af10d7a2ea');
#
# 19) Test concatenated thumbnail Montage (concatentated by setting params to zero)
#     Thumbnails should be compacted tightly together in a grid
#
++$test;
testMontage( q//, 
  q/background=>'#696e7e', label=>'', tile=>'4x4', geometry=>'+0+0', mode=>'Unframe', shadow=>'False',
  borderwidth=>'0', background=>'gray'/,
  '06db877ef6a9842d12f4f604940d23622826884333c32f169ce795af10d7a2ea');
