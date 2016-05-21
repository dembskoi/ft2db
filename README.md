Ft2db
================

Ft2db is a database of Ft-2 tokamak experimental data that was produced by ASTRA code simulations of discharges

Documentation and Support
-------------------------
In the database there are objects named "\<name>_\<time>" for example: 140609ss\_0.028 
That usually means that the experiment was made 09 June 1014, the time of experimental data is 28ms and ss means Steady State. 

More information about specific experiment could be found in uniq experiment file that is available by link.
Equation files are available too. So you could repeat all the simulation with your own ASTRA code. Except there might be no additional modules in pure ASTRA. 

Data dimensions and meanings
-------------
__Standard data__


| Data        | Dimension           | Description  |
| ------------- |:-------------:| -----:|
|	**r**	|	*m*	|	major radius	|
|	**a**	|	*m*	|	minor radius	|
|	**b**	|	*T*	|	magnetic field	|
|	**I**	|	*MA*	|	Current	|
|	**q**	|	*1*	|	safety factor on the edge	|
|	**time** | *s*	|	time	|
|	**dt**	|	*ms*	|	time step in ASTRA modelling	|

__Scalar data__

| Data        | Dimension           | Description  |
| ------------- |:-------------:| -----:|
|**time**|	*s*|	current time|
|**vexp**|	*V*|	experimental loop voltage|
|**zef**|	*1*|	effective charge|
|**v**|	*V*|	ASTRA modelled loop voltage|
|**ipl**|	*MA*|	Current|
|**neav**|	*10^19 m^-3*|	Average electron density|
|**taue**|	*ms*|	electron energy confinement time|
|**amj**|	*1*|	mass of main ion|
|**tna**|	*ms*|	NeoAlcator taue scaling|
|**tgo**|	*ms*|	Goldstone taue scaling|
|**q.95**|	*1*|	safety factor at r\*95%|
|**ne0**|	*10^19 m^-3*|	electron density in center|



__Vector data__

| Data        | Dimension           | Description  |
| ------------- |:-------------:| -----:|
|	**a**	|	*m*	|	radius	|
|	**te**	|	*keV*	|	electron temperature	|
|	**shif**	|	*m*	|	Shafranov shift	|
|	**heef**	|	*m^2/s*	|	Effective electron heat conductivity	|
|	**prad**	|	*MW/m^3*	|	Radiation power	|
|	**ne**	|	*10^19 m^-3*	|	electron density	|
|	**q**	|	*1*	|	safety factor	|
|	**volu**	|*M^3*	|	Plasma volume inside this radius	|
|	**poh**	|	*MW/m^3*	|	Power of Ohmic Heating	|
|	**ti**	|	*keV*	|	ion temperature	|
|	**shea**	|	*1*	|	magnetic shear	|
|	**xief**	|	*m^2/s*	|	Effective ion heat conductivity	|
|	**peic**	|	*MW/m^3*	|	Electron ion heat exchange due to Coulomb collisions	|
|	**ni**	|	*10^19 cm^-3*	|	ion density	|
|	**rho**	|	*m*	|	main magnetic surface label	|
|	**slat**	|	*M^2*	|	Toroidal surface area	|
|	**niz1**	|	*10^19 m^-3*	|	impurity density	|
|	**qe**	|	*MW*	|	electron energy flux	|
|	**upl**	|	*V*	|	toroidal loop voltage	|
|	**grte**	|	*-keV/m*	|	electron temperature gradient	|
|	**vpra**	|	*MW*	|	volume integral of a radiative power	|
|	**habo**	|	*m^2/s*	|	Heat conductivity Anomalous Bohm	|
|	**taue**	|	*s*	|	electron energy confinement time inside this radius	|
|	**grti**	|	*-keV/m*	|	ion temperature gradient	|
|	**vpoh**	|	*MW*	|	volume integral of an ohmic power	|
|	**qi**	|	*MW*	|	ion energy flux	|
|	**cc**	|	*(µOhm*m)^-1 or MS/m*	|	conductivity	|
|	**grne**	|	*-1\*10^19 m^-4*	|	electron density gradient	|
|	**vpei**	|	*MW*	|	volume integral of a Peic	|
|	**zef**	|	*1*	|	effective charge	|
|	**j**	|	*A/m^2*	|	current density	|


Usage
------------

Usage of the data requires adding all contributors of the project in an affiliation. For more information contact Artur      

Contacts
-------

Artur Perevalov artur.perevalov@gmail.com

License
-------


All rights reserved

