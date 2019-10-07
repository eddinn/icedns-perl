#!/usr/bin/perl

# IceDNS Version 0.1 - $date 09.07.07
# Ber saman iptölur á móti íslenskum ipnetum hjá RIX
# Notkun: icedns iptala (t.d: icedns 12.34.56.78)
# Edvin Dunaway :: edvin@eddinn.net

use warnings;
use strict;

my $ip = $ARGV[0];
	if (! $ARGV[0]) {
	die "\nNotkun: icedns iptala\n\n";
} else {
	chomp ($ip);
	my @rev = split(/\./, $ip);
	@rev = reverse @rev;
	my $revip = join(".", @rev);
	my $out = `exec host ${revip}.iceland.rix.is`;
		if ($out =~ /.*127.1.0.1*./) {
		print "$ip er .is iptala!\n"; 
	} else {
		print "$ip er ekki .is iptala!\n";
	}
}
