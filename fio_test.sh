#!/bin/bash

for readwrite in readwrite randrw
do
        for blocksize in 4k 16k 128K
        do
            iostat -xcdt 5 >> "master_iostat_direct-1_"$readwrite"_rwmixwrite-50_no-jobs-64_bs="$blocksize"_iodepth-8_`date "+%m-%d_%H_%M_%S"`.txt" & iostat_PID=$! sync;sync;sync

            echo 1 > /proc/sys/vm/drop_caches

         fio --name=master \
               --readwrite=$readwrite \
                 --rwmixwrite=50 --bs=$blocksize --invalidate=1 \
                 --group_reporting --direct=1 --filename="/dev/scinia" \
                 --time_based -runtime= 60 --ioengine=libaio \
                 --numjobs=64 --iodepth=8 --norandommap --randrepeat= 0 --exitall \
                 --filesize=10G --minimal \
                 --output="master_fio_direct-1_readwrite-"$readwrite"_rwmixwrite-50_no-jobs-64_bs-"$blocksize"_iodepth-8_`date "+%m-%d_%H_%M_%S"`.txt"
        kill $iostat_PID
       sleep 5
   done
done