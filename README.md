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

