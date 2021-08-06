The files in this directory (Re2000/balances) contain terms in the
balance equation for the reynolds stress and turbulent kinetic energy
extracted from direct numerical simulations of fully developed
turbulent channel flow at Re_tau=2000. The simulations are reported in:

- Statistics, Sergio Hoyas and Javier Jimenez, (2008) "Reynolds number
              effects on the Reynolds-stress budgets in turbulent
              channels", Phys. Fluids, Vol. 20, 101511. 

- Data,        Sergio Hoyas and Javier Jimenez, (2006) "Scaling of velocity
               fluctuations in turbulent channels up to $Re_{\tau} =2000$",
               Phys. of Fluids, vol 18, 011702.

Before final publication of a paper citing this data, please check 
this site for an up-to-date reference.

This directory contains 5 files named Re2000.bal.<extension>, where
the extension indicates the contents of the file. The extensions are

  kbal  -- balance of the turbulent kinetic energy

  uubal -- balance of the streamwise velocity variance

  vvbal -- balance of the wall-normal velocity variance

  wwbal -- balance of the spanwise velocity variance

  uvbal -- balance of the Reynolds shear stress

There also are 5 files named Re2000.std.<extension> containing the 
standard deviation of the balances. 

Note that some of the quantities reported in these files should be
zero by statistical symmetries.

Please report any problems with the data to S. Hoyas
sergio@torroja.dmt.upm.es
