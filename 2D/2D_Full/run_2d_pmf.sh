#!/bin/bash

for i in {0..16}
do
	mkdir dir_$i
	cd dir_$i
	echo $i > num
	cp ../* .
	cp ../../001_DiagPMF/dir_$i/md2ps_$i.rst7 md2ps_$i.rst7
	cp ../../001_DiagPMF/dir_$i/rc1.RST .
	#	sbatch job_2d.slm
	cd ../
done
