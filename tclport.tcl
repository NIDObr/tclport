#!/usr/bin/tclsh
#-------------------------------------------------------------------------------------
# Author: NidoBr
# E-mail: < coqecoisa@gmail.com >
# Github: < https://github.com/NIDObr >
# License: BSD 3-Clause "New" or "Revised" License
# Port scaner
#-------------------------------------------------------------------------------------

puts "Start..."

proc scaner { ip porta } {
	catch {
		set conexao [ socket $ip $porta ]
		close $conexao
		incr porta
	}
}
if { !$argc } {
	puts "Uso:\n ./tclport.tcl <IP>"
	exit
}
set ip $argv
set porta 1
while { $porta != 65000 } {
	set resultado [ scaner $ip $porta ]
	if { $resultado == 0 } {
		puts "IP: $ip PORTA: $porta"
	}
	incr porta
}
