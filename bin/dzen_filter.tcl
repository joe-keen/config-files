#!/bin/sh
# the next line restarts using wish \
    exec tclsh "$0" ${1+"$@"}

proc every {ms body} {after $ms [info level 0]; eval $body}

#-- Formatting -------------------------------------------------------
proc c {fgcolor {bgcolor ""}} {return "^fg($fgcolor)^bg($bgcolor)"}
proc p {pixels} {return "^p($pixels)"}
proc pa {pixels} {return "^pa($pixels)"}

#-- Output -----------------------------------------------------------

proc add {chunk} {
    lappend ::dzen_output $chunk
}

proc output {} {
    puts [concat {*}$::dzen_output]
    flush stdout
}

#---------------------------------------------------------------------

proc xmonad_input {} {
    set ::active_workspace ""
    array set workspaces {0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0}

    # Workspace map:
    # 0 empty, unfocused
    # 1 has active windows
    # 2 active workspace on other head
    # 3 active workspace 
    
    foreach {activity workspace} \
            [concat {*}[regexp -all -inline {\^bg......... \d } [gets stdin]]] {
        if {[regexp {2b4f98} $activity]} {
            set workspaces($workspace) 3
        } elseif {[regexp {999999} $activity]} {
            set workspaces($workspace) 2
        } else {
            set workspaces($workspace) 1
        }
    }

    foreach w [lsort [array names workspaces]] {
        lappend ::active_workspace $w $workspaces($w)
    }

    update_dzen
}

proc clock_input {} {
    set ::current_time [clock format [clock seconds] -format "%a %m/%d %I:%M"]
    update_dzen
}

proc update_dzen {} {
    set ::dzen_output ""
    foreach {workspace activity_level} $::active_workspace {
        incr workspace
        if {$activity_level == 3} {
            add "[p 1][c #ffa800]$workspace "
        } elseif {$activity_level == 2} {
            add "[p 1][c #ffd500]$workspace "
        } elseif {$activity_level == 1} {
            add "[p 1][c white]$workspace "
        } else {
            add "[p 1][c #332f2f]$workspace "
        }
    }

    add "[pa 2400][c white]$::current_time"

    output
}

set ::active_workspace "0 2 1 0 3 0 4 0 5 0 6 0 7 0 8 0"
set ::current_time ""

clock_input

every 5000 clock_input

fileevent stdin readable xmonad_input

vwait forever
