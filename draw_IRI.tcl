# VMD for WIN64, version 1.9.4 (October 4, 2020)
# use all *_IRI.cub files in current folder
set allfile [glob -nocomplain *_IRI.cub]
color scale method BGR
color Display Background white
axes location Off
display depthcue of
display rendermode GLSL
set viewset {
    {
    	{ 1 0 0 0 } { 0 1 0 0 } { 0 0 1 0 } { 0 0 0 1 }
    } 
    {
    	{ 1 0 0 0 } { 0 1 0 0 } { 0 0 1 0 } { 0 0 0 1 }
    } 
    {
    	{ 0.322699 0 0 0 } { 0 0.322699 0 0 } { 0 0 0.322699 0 } { 0 0 0 1 }
    }
}
foreach fname $allfile {
    set bname [string range $fname 0 end-8] 
    puts "Dealing with $bname ..."
    mol new "${bname}_IRI.cub" type {cube}
    mol addfile "${bname}_sl2r.cub" type {cube}
    animate delete beg 0 end 0 top
    animate goto start
    mol modstyle 0 top CPK 0.8 0.3 22 22
    # mol modstyle 0 top Licorice 0.2 22 22
    mol modmaterial 0 top Glossy
    mol addrep top
    mol modstyle 1 top Isosurface 1.0 0 0 0 1 1
    mol modcolor 1 top Volume 1
    mol scaleminmax top 1 -0.04 0.02
    molinfo top set {center_matrix rotate_matrix scale_matrix} $viewset
    render Tachyon "${bname}.dat"
    # render snapshot "${bname}.bmp"
    mol delete top
}
exit
# VMD for WIN32, version 1.9.3 (November 30, 2016)
# end of log file.
