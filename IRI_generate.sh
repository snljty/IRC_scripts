#! /bin/bash

# source our Multiwfn setting file

for i in `ls -1 *.wfn`
do
    Multiwfn $i < IRI_in.txt
    mv userfunc.cub ${i%\.*}_IRI.cub
    mv signlambda2rho.cub ${i%\.*}_sl2r.cub
done

