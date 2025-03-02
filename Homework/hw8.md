---
title: "Homework 8"
author: "Itzel Gonzalez"
date: "2025-02-11"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

``` r
library(tidyverse)
library(janitor)
library(skimr)
library(naniar)
```

## Data
**1. For this homework, we will use two different data sets. Please load `amniota` and `amphibio`.**  

`amniota` data:  
Myhrvold N, Baldridge E, Chan B, Sivam D, Freeman DL, Ernest SKM (2015). “An amniote life-history
database to perform comparative analyses with birds, mammals, and reptiles.” _Ecology_, *96*, 3109.
doi: 10.1890/15-0846.1 (URL: https://doi.org/10.1890/15-0846.1).

``` r
amniota <- read_csv('data/amniota.csv') %>% clean_names()
```

```
## Rows: 21322 Columns: 36
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (6): class, order, family, genus, species, common_name
## dbl (30): subspecies, female_maturity_d, litter_or_clutch_size_n, litters_or...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

`amphibio` data:  
Oliveira BF, São-Pedro VA, Santos-Barrera G, Penone C, Costa GC (2017). “AmphiBIO, a global database
for amphibian ecological traits.” _Scientific Data_, *4*, 170123. doi: 10.1038/sdata.2017.123 (URL:
https://doi.org/10.1038/sdata.2017.123).

``` r
amphibio <- read_csv('data/amphibio.csv') %>% clean_names()
```

```
## Rows: 6776 Columns: 38
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (6): id, Order, Family, Genus, Species, OBS
## dbl (31): Fos, Ter, Aqu, Arb, Leaves, Flowers, Seeds, Arthro, Vert, Diu, Noc...
## lgl  (1): Fruits
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

## Questions  
**2. Do some exploratory analysis of the `amniota` data set. Use the function(s) of your choice. Try to get an idea of how NA's are represented in the data.**  

``` r
summary(amniota)
```

```
##     class              order              family             genus          
##  Length:21322       Length:21322       Length:21322       Length:21322      
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##    species            subspecies   common_name        female_maturity_d 
##  Length:21322       Min.   :-999   Length:21322       Min.   :-30258.7  
##  Class :character   1st Qu.:-999   Class :character   1st Qu.:  -999.0  
##  Mode  :character   Median :-999   Mode  :character   Median :  -999.0  
##                     Mean   :-999                      Mean   :  -723.7  
##                     3rd Qu.:-999                      3rd Qu.:  -999.0  
##                     Max.   :-999                      Max.   :  9131.2  
##  litter_or_clutch_size_n litters_or_clutches_per_y adult_body_mass_g  
##  Min.   :-999.000        Min.   :-999.0            Min.   :     -999  
##  1st Qu.:-999.000        1st Qu.:-999.0            1st Qu.:        4  
##  Median :   1.692        Median :-999.0            Median :       24  
##  Mean   :-383.909        Mean   :-766.8            Mean   :    29107  
##  3rd Qu.:   3.200        3rd Qu.:-999.0            3rd Qu.:      135  
##  Max.   : 156.000        Max.   :  52.0            Max.   :149000000  
##  maximum_longevity_y  gestation_d       weaning_d     
##  Min.   :-999.000    Min.   :-999.0   Min.   :-999.0  
##  1st Qu.:-999.000    1st Qu.:-999.0   1st Qu.:-999.0  
##  Median :-999.000    Median :-999.0   Median :-999.0  
##  Mean   :-737.061    Mean   :-874.9   Mean   :-892.4  
##  3rd Qu.:   1.083    3rd Qu.:-999.0   3rd Qu.:-999.0  
##  Max.   : 211.000    Max.   :7396.9   Max.   :1826.2  
##  birth_or_hatching_weight_g weaning_weight_g     egg_mass_g     
##  Min.   :   -999.0          Min.   :    -999   Min.   :-999.00  
##  1st Qu.:   -999.0          1st Qu.:    -999   1st Qu.:-999.00  
##  Median :   -999.0          Median :    -999   Median :-999.00  
##  Mean   :    -88.6          Mean   :    1116   Mean   :-739.64  
##  3rd Qu.:   -999.0          3rd Qu.:    -999   3rd Qu.:   0.56  
##  Max.   :2250000.0          Max.   :17000000   Max.   :1500.00  
##   incubation_d    fledging_age_d    longevity_y       male_maturity_d 
##  Min.   :-999.0   Min.   :-999.0   Min.   :-999.000   Min.   :-999.0  
##  1st Qu.:-999.0   1st Qu.:-999.0   1st Qu.:-999.000   1st Qu.:-999.0  
##  Median :-999.0   Median :-999.0   Median :-999.000   Median :-999.0  
##  Mean   :-820.5   Mean   :-909.4   Mean   :-737.821   Mean   :-827.8  
##  3rd Qu.:-999.0   3rd Qu.:-999.0   3rd Qu.:   1.042   3rd Qu.:-999.0  
##  Max.   :1762.0   Max.   : 345.0   Max.   : 177.000   Max.   :9131.2  
##  inter_litter_or_interbirth_interval_y female_body_mass_g male_body_mass_g 
##  Min.   :-999.000                      Min.   :   -999    Min.   :   -999  
##  1st Qu.:-999.000                      1st Qu.:   -999    1st Qu.:   -999  
##  Median :-999.000                      Median :   -999    Median :   -999  
##  Mean   :-932.502                      Mean   :     41    Mean   :   1243  
##  3rd Qu.:-999.000                      3rd Qu.:     14    3rd Qu.:     13  
##  Max.   :   4.847                      Max.   :3700000    Max.   :4545000  
##  no_sex_body_mass_g   egg_width_mm    egg_length_mm    fledging_mass_g 
##  Min.   :     -999   Min.   :-999.0   Min.   :-999.0   Min.   :-999.0  
##  1st Qu.:     -999   1st Qu.:-999.0   1st Qu.:-999.0   1st Qu.:-999.0  
##  Median :     -999   Median :-999.0   Median :-999.0   Median :-999.0  
##  Mean   :    30689   Mean   :-970.5   Mean   :-968.9   Mean   :-984.6  
##  3rd Qu.:       28   3rd Qu.:-999.0   3rd Qu.:-999.0   3rd Qu.:-999.0  
##  Max.   :136000000   Max.   : 125.0   Max.   : 455.0   Max.   :9992.0  
##   adult_svl_cm     male_svl_cm     female_svl_cm    birth_or_hatching_svl_cm
##  Min.   :-999.0   Min.   :-999.0   Min.   :-999.0   Min.   :-999.0          
##  1st Qu.:-999.0   1st Qu.:-999.0   1st Qu.:-999.0   1st Qu.:-999.0          
##  Median :-999.0   Median :-999.0   Median :-999.0   Median :-999.0          
##  Mean   :-656.2   Mean   :-985.1   Mean   :-947.4   Mean   :-940.3          
##  3rd Qu.:   9.5   3rd Qu.:-999.0   3rd Qu.:-999.0   3rd Qu.:-999.0          
##  Max.   :3049.0   Max.   : 315.2   Max.   :1125.0   Max.   : 760.0          
##  female_svl_at_maturity_cm female_body_mass_at_maturity_g no_sex_svl_cm   
##  Min.   :-999.0            Min.   :  -999.0               Min.   :-999.0  
##  1st Qu.:-999.0            1st Qu.:  -999.0               1st Qu.:-999.0  
##  Median :-999.0            Median :  -999.0               Median :-999.0  
##  Mean   :-989.4            Mean   :  -980.6               Mean   :-747.1  
##  3rd Qu.:-999.0            3rd Qu.:  -999.0               3rd Qu.:-999.0  
##  Max.   : 580.0            Max.   :194000.0               Max.   :3300.0  
##  no_sex_maturity_d
##  Min.   : -999.0  
##  1st Qu.: -999.0  
##  Median : -999.0  
##  Mean   : -942.6  
##  3rd Qu.: -999.0  
##  Max.   :14610.0
```

**3. Do some exploratory analysis of the `amphibio` data set. Use the function(s) of your choice. Try to get an idea of how NA's are represented in the data.**  

``` r
summary(amphibio)
```

```
##       id               order              family             genus          
##  Length:6776        Length:6776        Length:6776        Length:6776       
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##    species               fos            ter            aqu            arb      
##  Length:6776        Min.   :1      Min.   :1      Min.   :1      Min.   :1     
##  Class :character   1st Qu.:1      1st Qu.:1      1st Qu.:1      1st Qu.:1     
##  Mode  :character   Median :1      Median :1      Median :1      Median :1     
##                     Mean   :1      Mean   :1      Mean   :1      Mean   :1     
##                     3rd Qu.:1      3rd Qu.:1      3rd Qu.:1      3rd Qu.:1     
##                     Max.   :1      Max.   :1      Max.   :1      Max.   :1     
##                     NA's   :6053   NA's   :1104   NA's   :2810   NA's   :4347  
##      leaves        flowers         seeds       fruits            arthro    
##  Min.   :1      Min.   :1      Min.   :1      Mode:logical   Min.   :1     
##  1st Qu.:1      1st Qu.:1      1st Qu.:1      TRUE:2         1st Qu.:1     
##  Median :1      Median :1      Median :1      NA's:6774      Median :1     
##  Mean   :1      Mean   :1      Mean   :1                     Mean   :1     
##  3rd Qu.:1      3rd Qu.:1      3rd Qu.:1                     3rd Qu.:1     
##  Max.   :1      Max.   :1      Max.   :1                     Max.   :1     
##  NA's   :6752   NA's   :6772   NA's   :6772                  NA's   :5534  
##       vert           diu            noc           crepu         wet_warm   
##  Min.   :1      Min.   :1      Min.   :1      Min.   :1      Min.   :1     
##  1st Qu.:1      1st Qu.:1      1st Qu.:1      1st Qu.:1      1st Qu.:1     
##  Median :1      Median :1      Median :1      Median :1      Median :1     
##  Mean   :1      Mean   :1      Mean   :1      Mean   :1      Mean   :1     
##  3rd Qu.:1      3rd Qu.:1      3rd Qu.:1      3rd Qu.:1      3rd Qu.:1     
##  Max.   :1      Max.   :1      Max.   :1      Max.   :1      Max.   :1     
##  NA's   :6657   NA's   :5876   NA's   :5156   NA's   :6608   NA's   :5997  
##     wet_cold       dry_warm       dry_cold     body_mass_g      
##  Min.   :1      Min.   :1      Min.   :1      Min.   :    0.16  
##  1st Qu.:1      1st Qu.:1      1st Qu.:1      1st Qu.:    2.60  
##  Median :1      Median :1      Median :1      Median :    9.29  
##  Mean   :1      Mean   :1      Mean   :1      Mean   :   94.56  
##  3rd Qu.:1      3rd Qu.:1      3rd Qu.:1      3rd Qu.:   31.82  
##  Max.   :1      Max.   :1      Max.   :1      Max.   :26000.00  
##  NA's   :6625   NA's   :6572   NA's   :6735   NA's   :6185      
##  age_at_maturity_min_y age_at_maturity_max_y  body_size_mm    
##  Min.   :0.25          Min.   : 0.300        Min.   :   8.40  
##  1st Qu.:1.00          1st Qu.: 2.000        1st Qu.:  29.00  
##  Median :2.00          Median : 3.000        Median :  43.00  
##  Mean   :2.14          Mean   : 2.964        Mean   :  66.65  
##  3rd Qu.:3.00          3rd Qu.: 4.000        3rd Qu.:  69.15  
##  Max.   :7.00          Max.   :12.000        Max.   :1520.00  
##  NA's   :6392          NA's   :6392          NA's   :1549     
##  size_at_maturity_min_mm size_at_maturity_max_mm longevity_max_y 
##  Min.   :  8.80          Min.   : 10.10          Min.   :  0.17  
##  1st Qu.: 27.50          1st Qu.: 32.00          1st Qu.:  6.00  
##  Median : 43.00          Median : 50.00          Median : 10.00  
##  Mean   : 56.63          Mean   : 67.46          Mean   : 11.68  
##  3rd Qu.: 58.00          3rd Qu.: 75.50          3rd Qu.: 15.00  
##  Max.   :350.00          Max.   :400.00          Max.   :121.80  
##  NA's   :6529            NA's   :6528            NA's   :6417    
##  litter_size_min_n litter_size_max_n reproductive_output_y
##  Min.   :    1.0   Min.   :    1     Min.   : 0.080       
##  1st Qu.:   18.0   1st Qu.:   30     1st Qu.: 1.000       
##  Median :   80.0   Median :  186     Median : 1.000       
##  Mean   :  530.9   Mean   : 1034     Mean   : 1.034       
##  3rd Qu.:  300.0   3rd Qu.:  700     3rd Qu.: 1.000       
##  Max.   :25000.0   Max.   :45054     Max.   :15.000       
##  NA's   :5153      NA's   :5153      NA's   :2344         
##  offspring_size_min_mm offspring_size_max_mm      dir              lar        
##  Min.   : 0.200        Min.   : 0.400        Min.   :0.0000   Min.   :0.0000  
##  1st Qu.: 1.400        1st Qu.: 1.600        1st Qu.:0.0000   1st Qu.:0.0000  
##  Median : 2.000        Median : 2.300        Median :0.0000   Median :1.0000  
##  Mean   : 2.455        Mean   : 2.857        Mean   :0.2984   Mean   :0.6921  
##  3rd Qu.: 3.000        3rd Qu.: 3.500        3rd Qu.:1.0000   3rd Qu.:1.0000  
##  Max.   :20.000        Max.   :25.000        Max.   :1.0000   Max.   :1.0000  
##  NA's   :5446          NA's   :5446          NA's   :1079     NA's   :1079    
##       viv             obs           
##  Min.   :0.0000   Length:6776       
##  1st Qu.:0.0000   Class :character  
##  Median :0.0000   Mode  :character  
##  Mean   :0.0095                     
##  3rd Qu.:0.0000                     
##  Max.   :1.0000                     
##  NA's   :1079
```

**4. How many total NA's are in each data set? Do these values make sense? Are NA's represented by values?**  
These values do not make sense. The NA's in the amniota dataframeare are represnted by '-999', '-999.0', '-999.00', '-999.000', '-999.0000', '-999.000000', '-999.0000000.' In the amphibio dataframe they are represented by 0 and NA.

``` r
amniota %>% 
  summarize(across(everything(), ~ sum(is.na(.)))) 
```

```
## # A tibble: 1 × 36
##   class order family genus species subspecies common_name female_maturity_d
##   <int> <int>  <int> <int>   <int>      <int>       <int>             <int>
## 1     0     0      0     0       0          0           0                 0
## # ℹ 28 more variables: litter_or_clutch_size_n <int>,
## #   litters_or_clutches_per_y <int>, adult_body_mass_g <int>,
## #   maximum_longevity_y <int>, gestation_d <int>, weaning_d <int>,
## #   birth_or_hatching_weight_g <int>, weaning_weight_g <int>, egg_mass_g <int>,
## #   incubation_d <int>, fledging_age_d <int>, longevity_y <int>,
## #   male_maturity_d <int>, inter_litter_or_interbirth_interval_y <int>,
## #   female_body_mass_g <int>, male_body_mass_g <int>, …
```


``` r
amphibio %>% 
  summarize(across(everything(), ~ sum(is.na(.))))
```

```
## # A tibble: 1 × 38
##      id order family genus species   fos   ter   aqu   arb leaves flowers seeds
##   <int> <int>  <int> <int>   <int> <int> <int> <int> <int>  <int>   <int> <int>
## 1     0     0      0     0       0  6053  1104  2810  4347   6752    6772  6772
## # ℹ 26 more variables: fruits <int>, arthro <int>, vert <int>, diu <int>,
## #   noc <int>, crepu <int>, wet_warm <int>, wet_cold <int>, dry_warm <int>,
## #   dry_cold <int>, body_mass_g <int>, age_at_maturity_min_y <int>,
## #   age_at_maturity_max_y <int>, body_size_mm <int>,
## #   size_at_maturity_min_mm <int>, size_at_maturity_max_mm <int>,
## #   longevity_max_y <int>, litter_size_min_n <int>, litter_size_max_n <int>,
## #   reproductive_output_y <int>, offspring_size_min_mm <int>, …
```

**5. Make any necessary replacements in the data such that all NA's appear as "NA".**   

``` r
new_amniota <- amniota %>% 
  replace_with_na_all(condition = ~.x %in% c('NA','-999', '-999.0', '-999.00', '-999.000', '-999.0000', '-999.000000', '-999.0000000')) 

new_amniota
```

```
## # A tibble: 21,322 × 36
##    class order     family genus species subspecies common_name female_maturity_d
##    <chr> <chr>     <chr>  <chr> <chr>        <dbl> <chr>                   <dbl>
##  1 Aves  Accipitr… Accip… Acci… albogu…         NA Pied Gosha…               NA 
##  2 Aves  Accipitr… Accip… Acci… badius          NA Shikra                   363.
##  3 Aves  Accipitr… Accip… Acci… bicolor         NA Bicolored …               NA 
##  4 Aves  Accipitr… Accip… Acci… brachy…         NA New Britai…               NA 
##  5 Aves  Accipitr… Accip… Acci… brevip…         NA Levant Spa…              363.
##  6 Aves  Accipitr… Accip… Acci… castan…         NA Chestnut-f…               NA 
##  7 Aves  Accipitr… Accip… Acci… chilen…         NA Chilean Ha…               NA 
##  8 Aves  Accipitr… Accip… Acci… chiono…         NA White-brea…              548.
##  9 Aves  Accipitr… Accip… Acci… cirroc…         NA Collared S…               NA 
## 10 Aves  Accipitr… Accip… Acci… cooper…         NA Cooper's H…              730 
## # ℹ 21,312 more rows
## # ℹ 28 more variables: litter_or_clutch_size_n <dbl>,
## #   litters_or_clutches_per_y <dbl>, adult_body_mass_g <dbl>,
## #   maximum_longevity_y <dbl>, gestation_d <dbl>, weaning_d <dbl>,
## #   birth_or_hatching_weight_g <dbl>, weaning_weight_g <dbl>, egg_mass_g <dbl>,
## #   incubation_d <dbl>, fledging_age_d <dbl>, longevity_y <dbl>,
## #   male_maturity_d <dbl>, inter_litter_or_interbirth_interval_y <dbl>, …
```


``` r
new_amphibio <- amphibio %>% 
  replace_with_na_all(condition = ~.x %in% c("NA", " ", ".", "-999", "0")) 

new_amphibio
```

```
## # A tibble: 6,776 × 38
##    id    order family genus species   fos   ter   aqu   arb leaves flowers seeds
##    <chr> <chr> <chr>  <chr> <chr>   <dbl> <dbl> <dbl> <dbl>  <dbl>   <dbl> <dbl>
##  1 Anf0… Anura Allop… Allo… Alloph…    NA     1     1     1     NA      NA    NA
##  2 Anf0… Anura Alyti… Alyt… Alytes…    NA     1     1     1     NA      NA    NA
##  3 Anf0… Anura Alyti… Alyt… Alytes…    NA     1     1     1     NA      NA    NA
##  4 Anf0… Anura Alyti… Alyt… Alytes…    NA     1     1     1     NA      NA    NA
##  5 Anf0… Anura Alyti… Alyt… Alytes…    NA     1    NA     1     NA      NA    NA
##  6 Anf0… Anura Alyti… Alyt… Alytes…     1     1     1     1     NA      NA    NA
##  7 Anf0… Anura Alyti… Disc… Discog…     1     1     1    NA     NA      NA    NA
##  8 Anf0… Anura Alyti… Disc… Discog…     1     1     1    NA     NA      NA    NA
##  9 Anf0… Anura Alyti… Disc… Discog…     1     1     1    NA     NA      NA    NA
## 10 Anf0… Anura Alyti… Disc… Discog…     1     1     1    NA     NA      NA    NA
## # ℹ 6,766 more rows
## # ℹ 26 more variables: fruits <lgl>, arthro <dbl>, vert <dbl>, diu <dbl>,
## #   noc <dbl>, crepu <dbl>, wet_warm <dbl>, wet_cold <dbl>, dry_warm <dbl>,
## #   dry_cold <dbl>, body_mass_g <dbl>, age_at_maturity_min_y <dbl>,
## #   age_at_maturity_max_y <dbl>, body_size_mm <dbl>,
## #   size_at_maturity_min_mm <dbl>, size_at_maturity_max_mm <dbl>,
## #   longevity_max_y <dbl>, litter_size_min_n <dbl>, litter_size_max_n <dbl>, …
```

**6. Use the package `naniar` to produce a summary, including percentages, of missing data in each column for the `amniota` data.**  

``` r
miss_var_summary(new_amniota)
```

```
## # A tibble: 36 × 3
##    variable                       n_miss pct_miss
##    <chr>                           <int>    <num>
##  1 subspecies                      21322    100  
##  2 female_body_mass_at_maturity_g  21318    100. 
##  3 female_svl_at_maturity_cm       21120     99.1
##  4 fledging_mass_g                 21111     99.0
##  5 male_svl_cm                     21040     98.7
##  6 no_sex_maturity_d               20860     97.8
##  7 egg_width_mm                    20727     97.2
##  8 egg_length_mm                   20702     97.1
##  9 weaning_weight_g                20258     95.0
## 10 female_svl_cm                   20242     94.9
## # ℹ 26 more rows
```

**7. Use the package `naniar` to produce a summary, including percentages, of missing data in each column for the `amphibio` data.**

``` r
miss_var_summary(new_amphibio)
```

```
## # A tibble: 38 × 3
##    variable n_miss pct_miss
##    <chr>     <int>    <num>
##  1 fruits     6774    100. 
##  2 flowers    6772     99.9
##  3 seeds      6772     99.9
##  4 leaves     6752     99.6
##  5 dry_cold   6735     99.4
##  6 viv        6722     99.2
##  7 vert       6657     98.2
##  8 obs        6651     98.2
##  9 wet_cold   6625     97.8
## 10 crepu      6608     97.5
## # ℹ 28 more rows
```

**8. For the `amniota` data, calculate the number of NAs in the `egg_mass_g` column sorted by taxonomic class; i.e. how many NA's are present in the `egg_mass_g` column in birds, mammals, and reptiles? Does this results make sense biologically? How do these results affect your interpretation of NA's?** 
This data makes sense because (most) mammals do not lay eggs, so I would expect NA values to be missing for the 'egg_mass_g' variable. These results affect the interpretation of NA's because for some animals NA might seem like there's no egg mass, but in reality 'NA' is being used as a placeholder to show that some species don't lay eggs at all.

``` r
new_amniota %>% 
  group_by(class) %>% 
  select(egg_mass_g, class) %>% 
  miss_var_summary()
```

```
## # A tibble: 3 × 4
## # Groups:   class [3]
##   class    variable   n_miss pct_miss
##   <chr>    <chr>       <int>    <num>
## 1 Aves     egg_mass_g   4914     50.1
## 2 Mammalia egg_mass_g   4953    100  
## 3 Reptilia egg_mass_g   6040     92.0
```

**9. The `amphibio` data have variables that classify species as fossorial (burrowing), terrestrial, aquatic, or arboreal.Calculate the number of NA's in each of these variables. Do you think that the authors intend us to think that there are NA's in these columns or could they represent something else? Explain.**
When I was first looking at the data, I thought NA represented that there was no data recorded but I think the author intended to show that there were no species classified in that variable, and instead NA is used as a placeholder. 

``` r
new_amphibio %>% 
  select(fos, ter, aqu, arb) %>% 
  miss_var_summary()
```

```
## # A tibble: 4 × 3
##   variable n_miss pct_miss
##   <chr>     <int>    <num>
## 1 fos        6053     89.3
## 2 arb        4347     64.2
## 3 aqu        2810     41.5
## 4 ter        1104     16.3
```

**10. Now that we know how NA's are represented in the `amniota` data, how would you load the data such that the values which represent NA's are automatically converted?**

``` r
amniota_no_nas <- 
  read_csv("data/amniota.csv", na = c('NA','-999', '-999.0', '-999.00', '-999.000', '-999.0000', '-999.000000', '-999.0000000')) %>% clean_names() 
```

```
## Warning: One or more parsing issues, call `problems()` on your data frame for details,
## e.g.:
##   dat <- vroom(...)
##   problems(dat)
```

```
## Rows: 21322 Columns: 36
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (6): class, order, family, genus, species, common_name
## dbl (28): female_maturity_d, litter_or_clutch_size_n, litters_or_clutches_pe...
## lgl  (2): subspecies, female_body_mass_at_maturity_g
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

``` r
amniota_no_nas
```

```
## # A tibble: 21,322 × 36
##    class order     family genus species subspecies common_name female_maturity_d
##    <chr> <chr>     <chr>  <chr> <chr>   <lgl>      <chr>                   <dbl>
##  1 Aves  Accipitr… Accip… Acci… albogu… NA         Pied Gosha…               NA 
##  2 Aves  Accipitr… Accip… Acci… badius  NA         Shikra                   363.
##  3 Aves  Accipitr… Accip… Acci… bicolor NA         Bicolored …               NA 
##  4 Aves  Accipitr… Accip… Acci… brachy… NA         New Britai…               NA 
##  5 Aves  Accipitr… Accip… Acci… brevip… NA         Levant Spa…              363.
##  6 Aves  Accipitr… Accip… Acci… castan… NA         Chestnut-f…               NA 
##  7 Aves  Accipitr… Accip… Acci… chilen… NA         Chilean Ha…               NA 
##  8 Aves  Accipitr… Accip… Acci… chiono… NA         White-brea…              548.
##  9 Aves  Accipitr… Accip… Acci… cirroc… NA         Collared S…               NA 
## 10 Aves  Accipitr… Accip… Acci… cooper… NA         Cooper's H…              730 
## # ℹ 21,312 more rows
## # ℹ 28 more variables: litter_or_clutch_size_n <dbl>,
## #   litters_or_clutches_per_y <dbl>, adult_body_mass_g <dbl>,
## #   maximum_longevity_y <dbl>, gestation_d <dbl>, weaning_d <dbl>,
## #   birth_or_hatching_weight_g <dbl>, weaning_weight_g <dbl>, egg_mass_g <dbl>,
## #   incubation_d <dbl>, fledging_age_d <dbl>, longevity_y <dbl>,
## #   male_maturity_d <dbl>, inter_litter_or_interbirth_interval_y <dbl>, …
```

**11. Please complete the class project survey at: [BIS 15L Group Project](https://forms.gle/H2j69Z3ZtbLH3efW6)**

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.  
