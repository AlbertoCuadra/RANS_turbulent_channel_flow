## RANS simulation of a turbulent flow through a channel 
[![View RANS simulation of a turbulent flow through a channel on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://es.mathworks.com/matlabcentral/fileexchange/101098-rans-turbulent-channel-flow)
![repo size](https://img.shields.io/github/repo-size/AlbertoCuadra/RANS_turbulent_channel_flow)
![last modified](https://img.shields.io/github/last-commit/AlbertoCuadra/RANS_turbulent_channel_flow)

An incompressible fully developed turbulent flow is considered in a channel (statistically stationary and homogeneous in directions parallel to the wall). The numerical code compares different characteristic properties of a turbulent flow, e.g., mean velocity profiles $U/u_\tau$, turbulent kinetic energy $k/u_\tau^2$, dissipation $\epsilon/(u_\tau^3/h)$, turbulent viscosity profiles $\nu_T/(u_\tau h)$, for various turbulent Reynolds numbers Re $_\tau$ = \{180, 550, 950, 2000\} using different turbulence models:

* Length mixing,
* TKE,
* k-epsilon.

I have included the report (written in spanish) that I wrote along the numerical code.

## Numerical models implemented:

   Models     |  Transport eqs. |
------------- | --------------- |
Length mixing |        0        |
TKE           |        1        |
k-epsilon     |        2        |
## Database
Data extracted from direct numerical simulations of a fully developed plane turbulent channel flow.

URL: [http://torroja.dmt.upm.es/channels/data/](http://torroja.dmt.upm.es/channels/data/)

  DNS data    |
------------- |
Re_tau = 180  |
Re_tau = 550  |
Re_tau = 950  |
Re_tau = 2000 |
