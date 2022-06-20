#!/usr/bin/env perl
use strict;
use warnings;

my $file = shift @ARGV || usage ();
open (IN, $file) || die "can't open $file: $!";
$/=undef;
my @result = <IN> =~ /((?:\/\*(?:[^*]|(?:\*+[^*\/]))*\*+\/)|(?:\/\/.*))/g;
foreach my $line (@result) {
    $line =~ s/\t//g;
    print "$line\n";
}

sub usage {
    print "$0 finds C Style comments in a given file\n";
    print "Usage: $0 <file>\n";
    exit 1;
}
