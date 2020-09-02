/*
//creation of books_common_data.dta for appending
clear
import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\data.xlsx", sheet("Books common data") cellrange(A2:W986) firstrow case(lower) allstring clear
drop if book_id == ""
global vars_all "title author year number_of_pages book_webpage book_link rev_score_max5 number_of_reviews price_paperback_new price_paperback_used price_ebook rankpaidinkindlestore ranklotterieskindlestore ranklotteriesbooks other_category other_category_rank"
keep book_id $vars_all
foreach var of varlist $vars_all {
	rename `var' book_`var'
}
destring book_id, replace
recast byte book_id
saveold "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\books_common_data.dta", replace version(13)

//creation of books_rev1.dta for appending
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
saveold "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\books_rev1.dta", replace version(13)

//creation of webpages_common_data.dta for appending
clear
import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\data.xlsx", sheet("Webpages common data") cellrange(A2:K986) firstrow case(lower) allstring clear
drop if webpage_id == ""
global vars_all "book_offered software_downldble software_web price_min price_max price_monthly nmbr_of_products strategy_is_free"
keep webpage_id webpage_link $vars_all
foreach var of varlist $vars_all {
	rename `var' webpage_`var'
}
destring webpage_id, replace
recast byte webpage_id
saveold "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\webpages_common_data.dta", replace version(13)


//creation of webpages_rev1.dta for appending
clear
import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\data.xlsx", sheet("Webpages rev1") cellrange(A2:AB986) firstrow case(lower) allstring clear

drop if webpage_id == ""
global vars_all "webpage_link low_freq high_freq based_on_past syndicate_promotion has_syndicate wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables forum magic special_meaning_nmbrs secret_knowledge biased_wheel limited_offer bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice design_score_max4"
keep webpage_id $vars_all
foreach var of varlist $vars_all {
	rename `var' rev1_`var'
}
destring webpage_id, replace
recast byte webpage_id
saveold "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\webpages_rev1.dta", replace version(13)

//creation of webpages_all.dta for appending
clear
import excel "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\data.xlsx", sheet("Webpages rev2") cellrange(A2:AB986) firstrow case(lower) allstring clear

drop if webpage_id == ""
global vars_all "webpage_link low_freq high_freq based_on_past syndicate_promotion has_syndicate wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables forum magic special_meaning_nmbrs secret_knowledge biased_wheel limited_offer bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice design_score_max4"
keep webpage_id $vars_all
foreach var of varlist $vars_all {
	rename `var' rev2_`var'
}
destring webpage_id, replace
recast byte webpage_id
tab rev2_design_score_max

rename rev2_webpage_link rev1_webpage_link
merge 1:1 webpage_id rev1_webpage_link using "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\webpages_rev1.dta", force
drop _merge 
//merge with webpage common data
rename rev1_webpage_link webpage_link
merge 1:1 webpage_id webpage_link using "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\webpages_common_data.dta", force
drop _merge 
saveold "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\webpages_all.dta", replace version(13)



///////////////////////final dataset
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
//merge with rev1 book data
rename rev2_book_link rev1_book_link
merge 1:1 book_id rev1_book_link using "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\books_rev1.dta", force
drop _merge 
//merge with book common data
rename rev1_book_link book_book_link
merge 1:1 book_id book_book_link using "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\books_common_data.dta", force
drop _merge 
gen type = "book"
//merge with webpage data
append using "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\webpages_all.dta"
//merge with rev2 webpage data
replace type = "webpage" if type==""
saveold "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\combined_study1_data.dta", version(13) replace
*/
clear all
use "G:\.shortcut-targets-by-id\1olWFU9o-f1EdvVqLZOwAQ9WHOepixcS3\LOTTO-bez literatury OK\systems\2 Final submission to IGS - work on reviewers comments\Study I - classification FOR SHARING\combined_study1_data.dta", clear
rename book_book_link book_link

//Clean, destring, replace features with 0 and 1
global vars_classified "low_freq high_freq based_on_past syndicate_promotion wheeling promise_of_contrl free_or_moneyback authority testimonials scientific_style calc_formulas graphs tables magic special_meaning_nmbrs secret_knowledge biased_wheel limited_offer bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice"
global vars_classified_webpage_only "has_syndicate forum"
foreach x in $vars_classified $vars_classified_webpage_only {   
//display  "`x'"
//display  "x"
tostring rev1_`x', replace 
replace rev1_`x' = "1" if strlen(strtrim(rev1_`x'))>0 
replace rev1_`x' = "0" if strlen(strtrim(rev1_`x'))==0
destring rev1_`x', replace 
tostring rev2_`x', replace 
replace rev2_`x' = "1" if strlen(strtrim(rev2_`x'))>0 
replace rev2_`x' = "0" if strlen(strtrim(rev2_`x'))==0
destring rev2_`x', replace 
//gen `x' = (rev1_`x' + rev2_`x')/2
gen `x' = (rev1_`x' * rev2_`x')
drop rev1_`x' rev2_`x'
}

foreach x in $vars_classified_webpage_only {   
//display  "`x'"
//display  "x"
replace `x'=. if type=="book"
}
tabm $vars_classified $vars_classified_webpage_only

destring *design_score_max4, replace 
gen design_score = (rev2_design_score_max4 + rev1_design_score_max4)/2
drop *_design_score_max4
destring book_year book_number_of_pages book_rev_score_max5 book_number_of_reviews book_price_paperback_new book_price_paperback_used book_price_ebook book_rankpaidinkindlestore book_ranklotterieskindlestore book_ranklotteriesbooks book_other_category_rank webpage_price_min webpage_price_max webpage_price_monthly webpage_nmbr_of_products, replace
//replace design_score = rev1_design_score_max4 if design_score==.

gen price = min(book_price_paperback_new, book_price_paperback_used, book_price_ebook )

//descriptive statistics books
global descr_books 			"price  book_year 		  book_number_of_pages  book_rev_score_max5  	book_number_of_reviews        book_ranklotterieskindlestore design_score"
global descr_books_rename 	"price  year 		  number_of_pages  review_score  	number_of_reviews       ranking design_score"
rename ($descr_books) ($descr_books_rename)
sum $descr_books_rename if type=="book"
asdoc sum $descr_books_rename if type=="book", save(Asdoc command results.doc) append

//descriptive statistics webpages
foreach x in webpage_software_downldble webpage_software_web {   
//display  "`x'"
//display  "x"
tostring `x', replace 
replace `x' = "1" if strlen(strtrim(`x'))>0 
replace `x' = "0" if strlen(strtrim(`x'))==0
destring `x', replace 
}
tab webpage_software_downldble webpage_software_web
gen software = max(webpage_software_downldble, webpage_software_web)
tab software

gen price_ = min(webpage_price_min, webpage_price_max, webpage_price_monthly)
replace price_=0 if webpage_strategy_is_free == "Y"
replace price_=. if webpage_price_min == 729.99 //One outlier with lottery software price $729.99 (W15) was removed from the minimum price calculations.

global descr_webpages 			"price_  software webpage_nmbr_of_products design_score"
global descr_webpages_rename	"price_  software number_of_products design_score"
rename ($descr_webpages) ($descr_webpages_rename)
sum $descr_webpages_rename if type=="webpage"
asdoc sum $descr_webpages_rename if type=="webpage", save(Asdoc command results.doc) append


gen graphs_or_tables=max(graphs, tables)
replace price=min(price, price_)
global meritum "magic special_meaning_nmbrs secret_knowledge based_on_past high_freq low_freq wheeling syndicate_promotion has_syndicate bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice "
global features1 "promise_of_contrl testimonials free_or_moneyback limited_offer authority scientific_style calc_formulas graphs_or_tables biased_wheel design_score price "
global extra_vars_webpage "software  forum"
//I add book specific features "systm_is_it_webpage" meaning that book promotes some webpage (5 cases)
global features "$meritum $features1 $extra_vars_webpage"

sum $meritum if type == "book"
sum $meritum if type == "webpage"
//table Fisher exact test of difference significance
foreach x in $meritum {   
display  "`x'"
tabulate type `x', all exact
}

sum $features1 $extra_vars_webpage if type == "book"
sum $features1 $extra_vars_webpage if type == "webpage"
//table Fisher exact test of difference significance
foreach x in $features1 $extra_vars_webpage {   
display  "`x'"
tabulate type `x', all exact
}

gen ln_price=ln(price)
replace ln_price=0 if price==0
gen ln_ranking =ln(ranking)

//remove has_syndicate
global meritum "magic special_meaning_nmbrs secret_knowledge based_on_past high_freq low_freq wheeling syndicate_promotion bet_thesame_nmbrs bet_rnd_nmbrs bet_unpopular_nmbrs other_useful_advice "
//add ln_price
global features1 "ln_price promise_of_contrl testimonials free_or_moneyback limited_offer authority scientific_style calc_formulas graphs_or_tables biased_wheel design_score "
asdoc reg ln_ranking  $meritum , nest robust dec(3) save(Asdoc command results.doc) replace
ereturn list r2_a
asdoc reg ln_ranking  $features1, nest robust dec(3) save(Asdoc command results.doc) append
ereturn list r2_a
asdoc reg ln_ranking  $meritum $features1, nest robust dec(3) save(Asdoc command results.doc) append
ereturn list r2_a

capture drop f1 f2 f3
factor $meritum, factors(3)
//greigen - is outdated.
fapara, reps(10) //Horn's "parallel analysis" test of principal components/factors. Look at factors that solid line (eigenvalue of factor n) is higher or equal to dashed line (average eighenvalue for the factor n)
asdoc rotate, varimax label dec(3) save(Asdoc command results.doc) append //Rotated factor loadings (pattern matrix) and unique variances for factor 1 and 2
predict f1 f2 f3

capture drop cf1 cf2 cf3 
factor $features1, factors(3)
//greigen
fapara, reps(10)
asdoc rotate, varimax label dec(3) save(Asdoc command results.doc) append
predict cf1 cf2 cf3 

capture drop allf1 allf2 allf3 allf4 
factor $meritum $features1, factors(4)
//greigen
fapara, reps(10)
asdoc rotate, varimax label dec(3) save(Asdoc command results.doc) fs(6) append
predict allf1 allf2 allf3 allf4 

/*
use "E:\Dropbox\articles\systems\both_appended.dta", clear //

destring price_paperback_new, replace force
destring price_paperback_used, replace force
destring price_ebook, replace force

gen book_price=min(price_paperback_new,price_paperback_used, price_ebook)
label variable book_price "book_price"

gen ln_popularity=ln(popularity_rank_26062018)

replace systm_price_min = book_price if systm_price_min==.
replace systm_price_max = systm_price_min if systm_price_max==.
replace subscription_price_per_month=0 if subscription_price_per_month==.

destring misl, replace force

destring number_of_products_offered, replace force
replace number_of_products_offered = 1 if number_of_products_offered==.

replace subscription_price_per_month = . if subscription_price_per_month==0

gen webpage=type==""

destring popular*, replace force

//descriptive statistics books
asdoc sum systm_year price_paperback_new price_paperback_used price_ebook design_score popularity_paperback_and_ebook_n popularity_paperback_and_ebook_r misleading_score if webpage==0, save(Asdoc command results.doc) append

//descriptive statistics webpages
asdoc sum number_of_products_offered systm_price_min systm_price_max subscription_price_per_month design_score_max4 systm_ppl_Alexa_rank_GLOBAL_25_0 misleading_score if webpage==1, save(Asdoc command results.doc) append

//in the paper we speak of recommendations:
global meritum "low_freq	high_freq	based_on_past	syndicate_promotion	wheeling		magic	special_meaning_nmbrs	secret_knowledge bet_on_the_same_nmbrs 	bet_on_rnd_nmbrs	bet_on_unpopular_numbers	other_useful_advices"

//in the paper we speak of other features:
global features1 "biased_wheel promise_of_contrl	free_or_moneyback	authority	me_or_they_already_won	pseudo_scientific_style	math_prob_calc	is_there_graph	is_there_table regr_aversion "

global extra_vars_webpage "systm_is_it_downloadable_softwar systm_is_it_web_softwar ticket_printing information_about_results ticket_checker software_screenshot software_video has_syndicate there_is_forum"
//I add book specific features "systm_is_it_webpage" meaning that book promotes some webpage (5 cases)

global features "$meritum $features1 $extra_vars_webpage"

foreach x in $features {   
display  "`x'"
tostring `x', replace force
replace `x' = "1" if strlen(strtrim(`x'))>0 
replace `x' = "0" if strlen(strtrim(`x'))==0
destring `x', replace force
}
//replace features with 0 and 1

rename design_score_max4 design_score
rename misleading_score_max4 misleading_score

gen graphs_tables=max(is_there_graph, is_there_table)
global features1 "systm_price_min design_score  biased_wheel promise_of_contrl	free_or_moneyback	authority	me_or_they_already_won	pseudo_scientific_style graphs_tables math_prob_calc	 regr_aversion "
//ADDED graphs_tables
//ADDED systm_price_min design_score

//deal with software later
gen software_scr_video=max(software_screenshot,software_video)
global extra_vars_webpage "systm_is_it_downloadable_softwar systm_is_it_web_softwar ticket_printing information_about_results ticket_checker software_scr_video has_syndicate there_is_forum"
//ADDED software_scr_video 

//sum $features
//tabstat $features, statistics( mean ) by(webpage)  format(%6.0g)
//tabstat systm_is_it_book systm_is_it_webpage design_score_max4 misleading_score_max4 systm_ppl_Alexa_rank_GLOBAL_25_0 number_of_products_offered price_paperback_new price_paperback_used systm_price_min systm_price_max subscription_price_per_month  if webpage==1, statistics(count, mean )
//graph hbar $features1 if webpage==1


//pairwase correlation for all with Bonferoni adj
asdoc pwcorr ln_pop misl webpage $meritum $features1, label star(.01) fs(6) dec(2) bonferroni save(Asdoc command results.doc) append
//report in appendix C 

//check if misleading score is ok
asdoc ologit misl $meritum $features1, label dec(3) save(Asdoc command results.doc) append

capture drop f1 f2 f3 f4 f5
factor $meritum, factors(5)
//greigen - is outdated.
fapara, reps(10) //Horn's "parallel analysis" test of principal components/factors. Look at factors that solid line (eigenvalue of factor n) is higher or equal to dashed line (average eighenvalue for the factor n)
asdoc rotate, varimax label dec(3) save(Asdoc command results.doc) append //Rotated factor loadings (pattern matrix) and unique variances for factor 1 and 2
predict f1 f2 f3 f4 f5

capture drop cf1 cf2 cf3 cf4
factor webpage $features1, factors(4)
//greigen
fapara, reps(10)
asdoc rotate, varimax label dec(3) save(Asdoc command results.doc) append
predict cf1 cf2 cf3 cf4

capture drop allf1 allf2 allf3 allf4 allf5 allf6 allf7 allf8 allf9
factor webpage $meritum $features1, factors(9)
//greigen
fapara, reps(10)
asdoc rotate, varimax label dec(3) save(Asdoc command results.doc) fs(6) append
predict allf1 allf2 allf3 allf4 allf5 allf6 allf7 allf8 allf9 allf10 

//cluster
gen ln_systm_price_min=ln(systm_price_min)
replace ln_systm_price_min=0 if ln_systm_price_min==.
global features1 "ln_systm_price_min design_score  biased_wheel promise_of_contrl	free_or_moneyback	authority	me_or_they_already_won	pseudo_scientific_style graphs_tables math_prob_calc	 regr_aversion "
//ADDED ln_systm_price_min to the set of variables
capture drop clust
cluster kmeans webpage $meritum $features1, k(2) gen(clust)
tab clust
tabstat webpage $meritum $features1, statistics( mean ) by(clust)  format(%6.0g)
asdoc tabstat webpage $meritum $features1, stat( mean ) by(clust) fs(6) save(Asdoc command results.doc) append
//returning the set of variables to the initial state
global features1 "systm_price_min design_score  biased_wheel promise_of_contrl	free_or_moneyback	authority	me_or_they_already_won	pseudo_scientific_style graphs_tables math_prob_calc	 regr_aversion "

//popularity

global features1 "ln_systm_price_min design_score  biased_wheel promise_of_contrl	free_or_moneyback	authority	me_or_they_already_won	pseudo_scientific_style graphs_tables math_prob_calc	 regr_aversion "

asdoc reg ln_popularity $meritum, nest robust dec(3) save(Asdoc command results.doc) append
ereturn list r2_a
asdoc reg ln_popularity $features1, nest robust dec(3) save(Asdoc command results.doc) append
ereturn list r2_a
asdoc reg ln_popularity $meritum $features1, nest robust dec(3) save(Asdoc command results.doc) append
ereturn list r2_a


//table 3&4 Fisher exact test of difference significance

foreach x in $meritum {   
display  "`x'"
tabulate webpage `x', all exact
}
 	


foreach x in $features1 {   
display  "`x'"
tabulate webpage `x', all exact
}
tabulate webpage is_there_graph, all exact
tabulate webpage is_there_table, all exact

tabulate is_there_graph is_there_table, all exact


/*APPENDIX CODE, PLEASE DONT DELETE

pwcorr ln_pop misl f1 f2 cf1 allf1 allf2 allf3, star(.05)
probit y2 x2 i.year if a==0
est store eq2
est table eq1 eq2, b(%12.3f) var(40) star(.01 .05 .10) // keep(VARS)


//later:

//add books, add more popularity
//make ologit with popularity
//make books vs webpages comparison (how?)
//make cluster analysis; //but how many clusters? k=? //with features? maybe factors from factor analysis? but how to interpret that?

cluster completelinkage $meritum $features1, name(CL1)
//help cluster  cutnumber?
tab clust
cluster dendrogram CL1, xlabel(, angle(90) labsize(*.75)) cutnumber(4)
browse CL1*

// bysort type: sum sum_of_feat


