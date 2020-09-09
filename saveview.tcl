#! /bin/vmd

# Use this script to dump or load current view.

set current_view {
    { { 1 0 0 0 } { 0 1 0 0 } { 0 0 1 0 } { 0 0 0 1 } }
    { { 1 0 0 0 } { 0 1 0 0 } { 0 0 1 0 } { 0 0 0 1 } }
    { { 0.322699 0 0 0 } { 0 0.322699 0 0 } { 0 0 0.322699 0 } { 0 0 0 1 } }
}

proc dump_view {} {
    global current_view
    set current_view [molinfo top get {center_matrix rotate_matrix scale_matrix}]
    puts $current_view
}
proc load_view {} {
    global current_view
    molinfo top set {center_matrix rotate_matrix scale_matrix} $current_view
}

