///////////////////////////////////////////////////////
////////////////////*  BOOKS *
///////////////////////////////////////////////////////

clear
import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\data.xlsx", sheet("Books rev1") cellrange(A2:AB986) firstrow case(lower) allstring clear
drop if book_id == ""
global vars_all "book_link low_freq high_freq based_on_past syndicate_promotion wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables magic special_meaning_nmbrs secret_knowledge biased_wheel limited_offer bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice design_score_max4"
keep book_id $vars_all
foreach var of varlist $vars_all {
	rename `var' rev1_`var'
}
destring book_id, replace
recast byte book_id
//saveold "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification\books_rev1.dta", replace version(13)

clear
import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\data.xlsx", sheet("Books rev2") cellrange(A2:AB986) firstrow case(lower) allstring clear
//import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification\data.xlsx", sheet("Books rev2") cellrange(A2:AB986) firstrow case(lower) allstring clear
drop if book_id == ""
global vars_all "book_link low_freq high_freq based_on_past syndicate_promotion wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables magic special_meaning_nmbrs secret_knowledge biased_wheel limited_offer bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice design_score_max4"
keep book_id $vars_all
foreach var of varlist $vars_all {
	rename `var' rev2_`var'
}
destring book_id, replace
recast byte book_id
merge 1:1 book_id using "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\books_rev1.dta", force
//merge 1:1 book_id using "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification\books_rev1.dta", force

//check if links are correct
gen link_check=.
replace link_check=1 if rev2_book_link==rev1_book_link
tab link_check

//Clean, destring, replace features with 0 and 1
keep book_id rev*
tab *design_score_max4
destring *design_score_max4, replace force
global vars_classified "low_freq high_freq based_on_past syndicate_promotion wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables magic special_meaning_nmbrs secret_knowledge biased_wheel limited_offer bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice"
foreach x in $vars_classified {   
//display  "`x'"
//display  "x"
tostring rev1_`x', replace force
replace rev1_`x' = "1" if strlen(strtrim(rev1_`x'))>0 
replace rev1_`x' = "0" if strlen(strtrim(rev1_`x'))==0
destring rev1_`x', replace force
tostring rev2_`x', replace force
replace rev2_`x' = "1" if strlen(strtrim(rev2_`x'))>0 
replace rev2_`x' = "0" if strlen(strtrim(rev2_`x'))==0
destring rev2_`x', replace force
}

//add variables to store kappa
foreach var in $vars_classified design_score_max4 {
	gen kpp_`var'=0
}

gen avg_kpp=0
gen counter=0
//calculate kappa
foreach x in $vars_classified design_score_max4 {   
//display  "`x'"
//display  "x"
display  ``line''
display  ``line''
display  ``line''
display  "`x'"
capture noisily kap rev1_`x' rev2_`x'
capture noisily replace kpp_`x'=r(kappa)
replace avg_kpp = avg_kpp + r(kappa)
replace counter = counter + 1
}
//all kappas at one place:
/*
Agreement:
below  0.0 Poor
0.00 – 0.20 Slight
0.21 – 0.40 Fair
0.41 – 0.60 Moderate
0.61 – 0.80 Substantial
0.81 – 1.00 Almost  perfect
*/

//ssc install fsum
fsum kpp_*
gen avg_kpp2=avg_kpp/counter
tab avg_kpp2 

///////////////////////////////////////////////////////
////////////////////*  WEBPAGES *
///////////////////////////////////////////////////////

clear
import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\data.xlsx", sheet("Webpages rev1") cellrange(A2:AB986) firstrow case(lower) allstring clear
//import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification\data.xlsx", sheet("Webpages rev1") cellrange(A2:AB986) firstrow case(lower) allstring clear

drop if webpage_id == ""
global vars_all "webpage_link low_freq high_freq based_on_past syndicate_promotion has_syndicate wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables forum magic special_meaning_nmbrs secret_knowledge biased_wheel limited_offer bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice design_score_max4"
keep webpage_id $vars_all
foreach var of varlist $vars_all {
	rename `var' rev1_`var'
}
destring webpage_id, replace
recast byte webpage_id
//saveold "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification\webpages_rev1.dta", replace version(13)

clear
import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\data.xlsx", sheet("Webpages rev2") cellrange(A2:AB986) firstrow case(lower) allstring clear
//import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification\data.xlsx", sheet("Webpages rev2") cellrange(A2:AB986) firstrow case(lower) allstring clear
drop if webpage_id == ""
global vars_all "webpage_link low_freq high_freq based_on_past syndicate_promotion has_syndicate wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables forum magic special_meaning_nmbrs secret_knowledge biased_wheel limited_offer bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice design_score_max4"
keep webpage_id $vars_all
foreach var of varlist $vars_all {
	rename `var' rev2_`var'
}
destring webpage_id, replace
recast byte webpage_id
merge 1:1 webpage_id using "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\webpages_rev1.dta", force
//merge 1:1 webpage_id using "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification\webpages_rev1.dta", force

//check if links are correct
gen link_check=.
replace link_check=1 if rev2_webpage_link==rev1_webpage_link
tab link_check

//Clean, destring, replace features with 0 and 1
keep webpage_id rev*
tab *design_score_max4
destring *design_score_max4, replace force
global vars_classified_all "low_freq high_freq based_on_past syndicate_promotion has_syndicate wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables forum magic special_meaning_nmbrs secret_knowledge biased_wheel limited_offer bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice"
//removing biased_wheel and bet_unpopular_nmbrs and bet_thesame_nmbrs due to low nmr of obs
global vars_classified "low_freq high_freq based_on_past syndicate_promotion has_syndicate wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables forum magic special_meaning_nmbrs secret_knowledge limited_offer bet_rnd_nmbrs other_useful_advice"
foreach x in $vars_classified {   
//display  "`x'"
//display  "x"
tostring rev1_`x', replace force
replace rev1_`x' = "1" if strlen(strtrim(rev1_`x'))>0 
replace rev1_`x' = "0" if strlen(strtrim(rev1_`x'))==0
destring rev1_`x', replace force
tostring rev2_`x', replace force
replace rev2_`x' = "1" if strlen(strtrim(rev2_`x'))>0 
replace rev2_`x' = "0" if strlen(strtrim(rev2_`x'))==0
destring rev2_`x', replace force
}

//add variables to store kappa
foreach var in $vars_classified design_score_max4 {
	gen kpp_`var'=0
}

gen avg_kpp=0
gen counter=0
//calculate kappa
foreach x in $vars_classified design_score_max4 {   
//display  "`x'"
//display  "x"
display  ``line''
display  ``line''
display  ``line''
display  "`x'"
capture noisily kap rev1_`x' rev2_`x'
capture noisily replace kpp_`x'=r(kappa)
//replace avg_kpp = avg_kpp + 1 if r(kappa)==""
replace avg_kpp = avg_kpp + r(kappa)
replace counter = counter + 1
}
//all kappas at one place:
/*
Agreement:
below  0.0Poor
0.00 – 0.20Slight
0.21 – 0.40Fair
0.41 – 0.60Moderate
0.61 – 0.80Substantial
0.81 – 1.00Almost  perfect
*/

//ssc install fsum
fsum kpp_*
gen avg_kpp2=avg_kpp/counter
tab avg_kpp2
