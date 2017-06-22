# Voice commands for chrome

#Gmail macros
compose = {c} ;
compose in new window = {shift+c} ;
search = {/} ;
newer = {k} ;
older = {j} ;
next message = {n} ;
previous message = {p} ;
open = {o} ;
return to list = {u} ;
(archive|"remove star"|"remove label") = {y} ;
select = {x} ;
delete = {d} ;
label <_anything> = {l} Wait(10) $1  {Enter};
star that = {s} ;
report spam = {!} ;
reply = {r} ;
reply all = {a} ;
forward = {f} ;
send [message] = {Tab + enter} ; 
archive and next = {y}{o} ;
go to all mail = {g}{a} ;
go to starred [messages] = {g}{s} ;
go to contacts = {g}{c} ;
go to drafts = {g}{d} ;
go to inbox = {g}{i} ;
My gmail = "mollymking@gmail.com" ;
My Stanford email = "kingmo@stanford.edu" ;
best Signature = {Enter}"Best,"{Enter}Molly;

Code block = {```} {Enter} {Enter} "```" {Enter} {Up_2};
empty toggle = {Space} {Backspace};

# Calendar commands
previous week = {j};
next week = {n};
create event = {c};
save event = {s>};
event details = {e};


# Generic commands
open new window = {Ctrl+n};

Previous tab = {Ctrl+Shift+Tab};
next tab = {Ctrl+Tab};
tab [1..9] = {Ctrl+$1};
previous page = {Alt+Left};
next page = {Alt+Right};

#Debugging
debug next = {F10};
debug next 1..10 = {F10_$1};
debug step = {F11};
debug continue = {F8};


repeat command = {Up} {Enter};

