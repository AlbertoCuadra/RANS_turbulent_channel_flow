The files in this directory tree contain statistical data extracted from 
direct numerical simulations of fully developed plane turbulent channel 
flow. There are four cases at four different Reynolds numbers: nominal 
Reynolds numbers based on u_tau (the friction velocity) and h (channel 
half-width) are 180, 550, 950 and 2000.  These data are discussed in

-- Sergio Hoyas and Javier Jimenez, (2008) "Reynolds number effects on the 
   Reynolds-stress budgets in turbulent channels", 
   Phys. Fluids, Vol. 20, 101511.

The data for each case are in directories Re180, Re550, Re950 and Re2000
respectively.  Each of these directories contains 2 subdirectories
containing the actual data:

  balances -- Terms in the Reynolds stress and kinetic energy 
              balance equations

  profiles -- Standard average profiles in wall-units. 

All these data are given for the half channel width, applying symmetries
with respect to the centerline.  The files are written in ASCII format.

The file chandata.tar in this directory is a tar file containing all the data.
Untar this file using the command 'tar -xvf'

Please report any problems with the data to S. Hoyas, 
sergio@torroja.dmt.upm.es
