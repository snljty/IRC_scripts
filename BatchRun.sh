#! /bin/dash

# Calculate all com files in this directory.

echo Start calculation at `date`
for i in `ls -1 *.com`
do
    echo Start calculating $i now
    g16 $i ${i%\.*}.log
    if [ $? = 0 ]
    then
        echo Calculation of $i finished at `date`
        # formchk ${i%.*}.chk ${i%.*}.fchk
    else
        echo Calculation of $i failed at `date`
    fi
done
dd if=/dev/tty of=/dev/null bs=1 count=1 2> /dev/null


