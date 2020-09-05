#! /bin/bash

# source our Multiwfn setting file

for i in `ls -1 *.wfn`
do
    Multiwfn $i < DORI_in.txt
    mv func1.cub ${i%\.*}_sl2r.cub
    mv func2.cub ${i%\.*}_DORI.cub
done

