# Gallotia DEB project

### Update 22/05/2021

* I did a first estimation of *G. stehlini* (not present in AmP)

### Update 25/05/2021

* I added *G. simonyi* (not present in AmP)
  * Included length–repro data
  * Made first param estimation
  * I found growth curve
    * Not included yet
    * Waiting for authors response

### Update 26/05/2021

* Some tyding for all sp
* Added tL_j and tL univariate data for *G. simonyi*
  * quick first (unfinished) estimation, just to check
* Added Wwb for all three sp and Ww0 for the one that was available
* Added and changed some data to the *G. galloti* entry

* Added *G. intermedia*
  * only zero-variate data, and of questionable quality
  * weights might be needed

* Added *G. caesaris*
  * zero-variate and uni-variate (tL)

* Added *G. atlantica*
  * only zero-variate data

* Added *G. bravoana*
  * only zero-variate data
  * could not get an estimate (error vHp < vHb)
    * this also happened with *G. atlantica*, but could fix it with weights. It was not the case with *G. bravoana*

### Update 27/05/2021

* Managed to estimate parameters for all species
* Still should check weights and temps

**Should check weights in general**

For instance, why *weights.psd.k_J = 0* *weights.psd.k = 0.2* and *data.psd.k = 0.3*?

**Check temperatures**

### Update 28/05/2021

* Managed to make a (stupid) plot comparing parameters with other squamata/lacertids

### Update 02/06/2021 (Nina)
* pushed changes for G. galloti, G. atlantica, G. bravoana, G.caesaris.
* Main changes : removed lines in mydata to use psd.k and we are using the default k_J = 0.002 J/d; additional species-specific changes:
* For G.atlantica - changed name to that in EoL (Atlantic lizard)
* For G.bravoana - removed Lpm and EH_pm (the data point was guessed), fixed some typos in bibliography
* For G.caesaris - removed f_LN from pars_init, included f_tL in predict file, adjusted weights for tL (all of the tL data used in estimations)

* continuation 03/06: did the same general things for G.intermedia, G.simonyi, G.stehlini (remove psd.k and use default k_J = 0.002 J/d fixed), also changed T_typ to 24 C
* added a fact point for all three species that there are giant Gallotia species
* For G.simonyi changed common name to that listed in Catalogue of Life (convention for AmP) but marked in section Facts that a sinonym is sometimes used
* In G. simonyi and G.stehlini removed uni-variate data specific scaled functional responses (f_LN, f_tL) because we keep them fixed at same value as zero-variate f and the temperature is guessed (no strong evidence for a specific f), so there is no need for extra parameters (I modified the predict files so that it is easy to include later if required)
* Values of maintenance ratio (k) seems to be low for G.intermedia (k = 0.08) and high for G.stehlini (k = 0.95). I marked this as discussion points in respective entries.
Generally, I found the values for turtles and some other lizards to be around 0.7 (Bas uses 0.3 as a general value). Anything higher than 1 makes no biological sense.

* "All Gallotia entries are now submitted for upload to collection"  , I will also notify Bas of this by email

### Update 04/06/2021

* Replaced all files with the final files in AmP
* Update param_comparison.m file reading parameters from AmPdata and add multidimensional scaling plot.
