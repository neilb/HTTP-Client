#!/usr/bin/perl

use HTTP::Client;
use strict;

$^W = 1; # -w
$|  = 1; # autoflush

sub test;

sub client_test {
   my $client = HTTP::Client->new("Bot/1.0");
   my $site = $client->get("http://www.cpan.org");
   return 1 if ($client->status_message =~ /200 OK/);
}
   
   
   
   
test (1, "loading", sub { use HTTP::Client; 1; });
test (2, "checking that get works", \&client_test);

sub test {
   my ($number, $purpose, $test) = (shift, shift, shift);

   print "Test $number ($purpose)...";
   print &$test () ? "ok\n" : "not ok\n";
}
