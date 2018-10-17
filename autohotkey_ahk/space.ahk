#SingleInstance force

;================================== | space |========================================
$Space::
	Send,{space}
	return

$^Space::
	Send,^{space}
	return

$!Space::
	Send,!{space}
	return

esc & Space::
	Send,{Enter}
	return
	
Space & BackSpace::
	Send,{delete}
	return

;================================== | hjkl |========================================
space & h::
	Send,+{Left}
	return
	
space & j::
	Send ,+{Down}
	return

space & l::
	Send,+{right}
	return

space & k::
	Send, +{up}
	return
;==================================| word skips shift|========================================

space & o::
	Send , +^{Right}
	return 
	
space & u::
	Send , +^{Left}
	return
	
;==================================| top end |========================================
Space & y::
	Send,^{PGUP}
	return
	
Space & b::
	Send,^{PGDN}
	return
	


space & `;::
	Send, +{End}
	return

space & p::
	Send, +{home}
	return


