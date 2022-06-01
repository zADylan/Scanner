#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket::INET;

  my $length = scalar(@ARGV);
  
  if ( $length != 3 && $length != 10 )
  {
    print "\n[>>ip<<] [>>Comienzo<<] [>>Termino<<]
  ♥__♥     ♥__♥
 ♥     ♥ ♥     ♥
 ♥      ♥      ♥
  ♥     /      ♥
   ♥    \     ♥
    ♥   /   ♥
      ♥ \ ♥
        ♥
 Ejemplo: perl Scanner.pl 45.35.1.114 1 65535\n";
    exit;
  }
  
  my $host = $ARGV[0];
  my $start = $ARGV[1];
  my $end = $ARGV[2];
  my $timeout = 0.5;
  
  if ( $ARGV[3] )
  {
    $timeout = $ARGV[3];
  }
  
  print "\nConexion a ".$host." - Tiempo ".$timeout."\n\n";
  my $response;
  my $port;
  
  for ( $port = $start ; $port <= $end ; $port++ )
  {
    $response = IO::Socket::INET->new(
    PeerAddr => $host,
    PeerPort => $port,
    Proto => "tcp",
    Timeout => $timeout
    );
    
    if ( $response )
    {
      print "Puerto ".$port." : <-- #####[Vulnerable]#####\n";
    }
    else
    {
      print "Puerto ".$port." : <-- [Cerrado] D:\n";
    }
}