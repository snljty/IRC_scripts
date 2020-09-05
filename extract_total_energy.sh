#! /bin/sh

grep 'SCF Done' *.out | awk '{printf "%14.9lf\n", $6}' > total_energy.txt


