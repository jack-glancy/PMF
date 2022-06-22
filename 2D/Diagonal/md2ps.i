3 ps NPT QMMM MD of system
&cntrl
 imin=0,                        ! Not a minimisation run
 irest=0,                       ! Restart simulation
 nscm=1000,                     ! Reset COM every 1000 steps
 nstlim=30000, dt=0.001,        ! Run MD for 30 ps with a timestep of 1 fs
 ntpr=50, ntwx=50,              ! Write the trajectory every 10 ps and the energies every 10 ps
 ioutfm=1,                      ! Use Binary NetCDF trajectory format (better)
 ntxo=2,                        ! NetCDF file
 cut=12.0,                      ! 12 angstrom non-bond cut off
 ntp=1,                         ! Isotropic pressure regulation
 pres0=1.01325,                 ! Reference pressure in bars
 taup=1.0,                      ! Pressure relaxation time (in ps)
 barostat=2,                    ! MC barostat
 ntt=1,                         ! Temperature regulation using langevin dynamics
 tempi=310.0,                   ! Initial thermostat temperature in K
 temp0=310.0,                   ! Final thermostat temperature in K
 ig=-1,                         ! Randomize the seed for the pseudo-random number generator
 nmropt=1,
 ifqnt=1,                        ! Turn on qmmm
 ntr=1,
 restraint_wt=500.0,
 restraintmask=':866,867,869,870', 
/
&qmmm
 qmmask=':865, 85, 199, 242, 868',
 qmcharge=-1,
 qm_theory='PM6',
 qmshake=1,
 qm_ewald=1, qm_pme=1
/
&wt type='DUMPFREQ', istep1=1 /
&wt type='END' /
DISANG=rc1.RST
DUMPAVE=diag.dat
