*this takes the Price Paid data (downloaded 25th January 2025) and refines it to make individual datasets for each year from 2015 onwards

cd "C:\Users\jpmcl\OneDrive\Documents\Maths\EC331\ULEZ on house prices\Data\Replication"

import delimited "Input\pp-complete.csv"

*generate a year variable from the first 4 characters of the date variable, and drop if year < 2015
gen v17 = substr(v3, 1, 4)
destring v17, replace
drop if v17 < 2015

*save into individual csv files
forvalues i = 2015/2024 {
    
    preserve
	
	keep if v17 == `i'
	
	drop v17
	
	export delimited using "Temp\Price_Paid_Data\pp_`i'.csv", novarnames replace
	
    display "`i' done"
		
	restore
}

*we generate relevant variables at a later point