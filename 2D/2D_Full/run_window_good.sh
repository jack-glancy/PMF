#!/bin/bash
# run the application
# constraint increment size in picometers
inc=10
# initial constraint length in picometers
init=148
first=true
# edit for however many windows
read j
# constraint value for this run
echo $j
mid=`printf %.2f "$(( $init + $inc * $j))e-2"`
# Upper and lower bounds
ub=`printf %.2f "$(($init+$inc*$j+5*$inc))e-2"`
lb=`printf %.2f "$(($init+$inc*$j-5*$inc))e-2"`
echo $mid $lb $ub

for ((i = $j ; i >= 0 ; i-- ))
do
	mkdir dir_$j.$i
	cd dir_$j.$i
	cp ../* .
	# check if first window
	if [ $first = true ]
	then
		mpirun -np 16 sander.MPI -O -i md2ps.i -o md2ps.log -p hpnp_NOH.top -c md2ps_$j.rst7 -ref md2ps_$j.rst7 -x md2ps.nc -r md2ps_$j.$i.rst7
		first=false
	else
	k=$(($i + 1))
	# copy restart from previous window
	cp ../dir_$j.$k/md2ps_$j.$k.rst7 .
	# constraint value for ith window
	mid1=`printf %.2f "$(($init+$inc*$i))e-2"`
	# Upper and lower bounds
	ub1=`printf %.2f "$(($init+$inc*$i+5*$inc))e-2"`
	lb1=`printf %.2f "$(($init+$inc*$i-5*$inc))e-2"`
	# edit the lines in the rc1.RST file to fit the window
	sed -i "s/  r1=$lb/  r1=$lb1/" rc1.RST
	sed -i "s/  r2=$mid/  r2=$mid1/" rc1.RST
	sed -i "s/  r3=$mid/  r3=$mid1/" rc1.RST
	sed -i "s/  r4=$ub/  r4=$ub1/" rc1.RST
	mpirun -np 16 sander.MPI -O -i md2ps.i -o md2ps.log -p hpnp_NOH.top -c md2ps_$j.$k.rst7 -ref md2ps_$j.$k.rst7 -x md2ps.nc -r md2ps_$j.$i.rst7
	fi
	cd ..
done
for ((i = $j+1 ; i <= 16 ; i++ ))
do
	mkdir dir_$j.$i
	cd dir_$j.$i
	cp ../* .
	# check if first window
	k=$(($i - 1))
	# copy restart from previous window
	cp ../dir_$j.$k/md2ps_$j.$k.rst7 .
	# constraint value for ith window
	mid1=`printf %.2f "$(($init+$inc*$i))e-2"`
	# Upper and lower bounds
	ub1=`printf %.2f "$(($init+$inc*$i+5*$inc))e-2"`
	lb1=`printf %.2f "$(($init+$inc*$i-5*$inc))e-2"`
	# edit the lines in the rc1.RST file to fit the window
	sed -i "s/  r1=$lb/  r1=$lb1/" rc1.RST
	sed -i "s/  r2=$mid/  r2=$mid1/" rc1.RST
	sed -i "s/  r3=$mid/  r3=$mid1/" rc1.RST
	sed -i "s/  r4=$ub/  r4=$ub1/" rc1.RST
	mpirun -np 16 sander.MPI -O -i md2ps.i -o md2ps.log -p hpnp_NOH.top -c md2ps_$j.$k.rst7 -ref md2ps_$j.$k.rst7 -x md2ps.nc -r md2ps_$j.$i.rst7
	cd ..
done

