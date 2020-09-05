# VMD for WIN32, version 1.9.3 (November 30, 2016)
# Log file 'draw_DORI.tcl', created by user zz
set allfile [glob -nocomplain *_DORI.cub]
color scale method BGR
color Display Background white
axes location Off
display depthcue of
display rendermode GLSL
set viewset {
    {
    	{1 0 0 -0.240974} {0 1 0 -0.0238884} {0 0 1 -0.0133199} {0 0 0 1}
    } 
    {
    	{-0.433716 0.840657 0.324345 0} {0.650735 0.0432415 0.75807 0} {0.623255 0.539852 -0.565797 0} {0 0 0 1}
    } 
    {
    	{0.196461 0 0 0} {0 0.196461 0 0} {0 0 0.196461 0} {0 0 0 1}
    }
}
foreach fname $allfile {
    set bname [string range $fname 0 end-9] 
    puts "Dealing with $bname ..."
    mol new "${bname}_DORI.cub" type {cube}
    mol addfile "${bname}_sl2r.cub" type {cube}
    animate delete beg 0 end 0 top
    animate goto start
    mol modstyle 0 top CPK 0.8 0.3 22 22
    # mol modstyle 0 top Licorice 0.2 22 22
    mol addrep top
    mol modstyle 1 top Isosurface 0.95 0 0 0 1 1
    mol modcolor 1 top Volume 1
    mol scaleminmax top 1 -0.035 0.020
    molinfo top set {center_matrix rotate_matrix scale_matrix} $viewset
    render Tachyon "${bname}.dat"
    # render snapshot "${bname}.bmp"
    mol delete top
}
exit
# VMD for WIN32, version 1.9.3 (November 30, 2016)
# end of log file.
