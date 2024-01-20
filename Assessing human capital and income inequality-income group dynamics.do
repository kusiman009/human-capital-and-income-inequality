
//Assesing human capital and income inequality: income group dynamics
use "/Users/frankosei-kusi/Desktop/SUBMISSIONS/hcinequality.dta"
xtset countryname year
preserve
br

//generate year dummies//

 
 tab year, gen (year_dummy)
 

  *principal sample
  xtscc lnpcap l.lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate i.year, lag(2) fe
  xtscc lngini laggini lnGII lnsci lntotpop lnpolsta lnmortrate i.year, lag(2)
  newey lnpcap lagpcap lnGII lnsci lntotpop lnpolsta lnmortrate i.year, lag(2) force
  newey lngini laggini lnGII lnsci lntotpop lnpolsta lnmortrate i.year, lag(1) force
  
  margins, dydx(lagpcap lnGII lnsci lntotpop lnpolsta lnmortrate)  
  marginsplot
  margins, dydx(laggini lnGII lnsci lntotpop lnpolsta lnmortrate)
  marginsplot
  
 *income level analysis
 sort incomelevelname
 by incomelevel: xtscc lnpcap l.lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate i.year, lag(1)
 by incomelevel: xtscc lngini laggini lnGII lnsci lntotpop lnpolsta lnmortrate i.year, lag(1)
 by incomelevelname: newey lnpcap l.lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate i.year,  force
 by incomelevelname: newey lngini l.lngini lnGII lnsci lntotpop lnpolsta lnmortrate i.year, lag(1) force
  
collapse (mean) GII, by(countryname regionname incomelevelname)
sort  GII
list 
tabdisp countryname regionname incomelevelname, cell(GII)

collapse (mean) pcap, by(countryname regionname incomelevelname)
sort pcap
list
tabdisp countryname regionname incomelevelname, cell(pcap)

collapse (mean) sci, by(countryname regionname incomelevelname)
sort sci
list
tabdisp countryname regionname incomelevelname, cell(mortrate)

collapse (mean) mortrate, by(countryname regionname incomelevelname)
sort mortrate
list
tabdisp countryname regionname incomelevelname, cell(mortrate)

collapse (mean) totpop, by(countryname regionname incomelevelname)
sort totpop
list
tabdisp countryname regionname incomelevelname, cell(totpop)

collapse (mean) gini, by(countryname regionname incomelevelname)
sort gini
list
tabdisp countryname regionname incomelevelname, cell(gini)




keep if incomelevelname=="High income"
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.9)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.8)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.95)
restore 
tab incomelevelname
preserve
keep if incomelevelname=="Low income"
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.1)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.2)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.3)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.4)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.5)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.6)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.7)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.8)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.9)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.95)
restore
preserve
tab incomelevelname
keep if incomelevelname=="Lower middle income"
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.1)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.2)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.3)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.4)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.5)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.6)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.7)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.8)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.9)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.95)
restore
preserve
tab incomelevelname
keep if incomelevelname=="Upper middle income"
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
br
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.1)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.2)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.3)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.4)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.5)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.6)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.7)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.8)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.9)
qregpd lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.95)
restore
qregpd lnlngini lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
qregpd lngini lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
preserve
keep if incomelevelname=="High income"
qregpd lngini lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.1)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.2)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.3)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.4)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.5)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.6)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.7)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.8)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.9)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.95)
restore
tab
tab incomelevelname
preserve
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
keep if incomelevelname=="Low income"
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.1)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.2)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.3)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.4)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.5)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.6)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.7)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.8)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.9)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.95)
restore
tab incomelevelname
preserve
keep if incomelevelname=="Lower middle income"
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.1)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.3)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.4)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.5)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.6)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.7)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.8)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.9)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.95)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.2)
restore
tab incomelevel name
tab incomelevelname
keep if incomelevelname=="Upper middle income"
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.05)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.1)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.2)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.3)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.4)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.5)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.6)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.7)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.8)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.9)
qregpd lngini lnGII lnsci lntotpop lnpolsta lnmortrate, id(countryname) fix(year) optimize(mcmc) noisy draws(1000) burn(100) arate(.5) quantile(0.95)
do "/var/folders/ym/lf5dv5r57433pdyy94tf8_340000gn/T//SD02791.000000"
use "/Users/frankosei-kusi/Documents/Assessing human capital/hcinequality.dta", clear
do "/var/folders/ym/lf5dv5r57433pdyy94tf8_340000gn/T//SD02791.000000"

//dynamic panel analysis, two-step system GMM//

xtabond2 lnpcap l.lnpcap lnGII lnsci lntotpop lnpolsta lnmortrate y*, gmm(l.lnpcap, collapse) iv(lnsci lntotpop lnpolsta lnmortrate y*, equation(level)) twostep nodiffsargan robust small orthogonal

xtabond2 lngini l.lngini lnsci lntotpop lnpolsta lnmortrate i.year, gmm(l.lngini, collapse) iv(lntotpop lnpolsta lnmortrate i.year, equation(level)) twostep nodiffsargan robust small orthogonal
