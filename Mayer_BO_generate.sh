#! /bin/bash

# source our Multiwfn setting file

for i in `ls -1 *.fch`
do
    Multiwfn $i < Mayer_BO_in.txt
    mv bndmat.txt ${i%\.*}_bndmat.txt
done

