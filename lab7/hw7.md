---
title: "Homework 7"
author: "Itzel Gonzalez"
date: "2025-02-02"
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
```

For this assignment we are going to work with a data set from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries.

Load the data `fisheries.csv` as a new object titled `fisheries`.

``` r
fisheries <- read_csv('data/fisheries.csv')
```

```
## Rows: 376771 Columns: 10
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (6): country, common_name, isscaap_taxonomic_group, asfis_species_number...
## dbl (4): isscaap_group_number, fao_major_fishing_area, year, catch
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

1. Explore the data. What are the names of the variables, what are the dimensions, are there any NA's, what are the classes of the variables, etc.? You may use the functions that you prefer.

``` r
glimpse(fisheries)
```

```
## Rows: 376,771
## Columns: 10
## $ country                 <chr> "Albania", "Albania", "Albania", "Albania", "A…
## $ common_name             <chr> "Angelsharks, sand devils nei", "Angelsharks, …
## $ isscaap_group_number    <dbl> 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38…
## $ isscaap_taxonomic_group <chr> "Sharks, rays, chimaeras", "Sharks, rays, chim…
## $ asfis_species_number    <chr> "10903XXXXX", "10903XXXXX", "10903XXXXX", "109…
## $ asfis_species_name      <chr> "Squatinidae", "Squatinidae", "Squatinidae", "…
## $ fao_major_fishing_area  <dbl> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37…
## $ measure                 <chr> "Quantity (tonnes)", "Quantity (tonnes)", "Qua…
## $ year                    <dbl> 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002…
## $ catch                   <dbl> NA, 53, 20, 31, 30, 30, 16, 79, 1, 4, 68, 55, …
```

``` r
summary(fisheries)
```

```
##    country          common_name        isscaap_group_number
##  Length:376771      Length:376771      Min.   :11.00       
##  Class :character   Class :character   1st Qu.:33.00       
##  Mode  :character   Mode  :character   Median :36.00       
##                                        Mean   :37.55       
##                                        3rd Qu.:38.00       
##                                        Max.   :77.00       
##                                                            
##  isscaap_taxonomic_group asfis_species_number asfis_species_name
##  Length:376771           Length:376771        Length:376771     
##  Class :character        Class :character     Class :character  
##  Mode  :character        Mode  :character     Mode  :character  
##                                                                 
##                                                                 
##                                                                 
##                                                                 
##  fao_major_fishing_area   measure               year          catch         
##  Min.   :18.00          Length:376771      Min.   :1950   Min.   :    0.00  
##  1st Qu.:31.00          Class :character   1st Qu.:1977   1st Qu.:    2.00  
##  Median :37.00          Mode  :character   Median :1991   Median :    7.00  
##  Mean   :45.79                             Mean   :1989   Mean   :   39.36  
##  3rd Qu.:61.00                             3rd Qu.:2003   3rd Qu.:   32.00  
##  Max.   :88.00                             Max.   :2012   Max.   :77000.00  
##                                                           NA's   :133583
```

2. How many countries are represented in the data? Provide a count and list their names.

``` r
fisheries %>% 
  count(country) %>% 
  summarize(n_countries=n_distinct(country,na.rm=T)) 
```

```
## # A tibble: 1 × 1
##   n_countries
##         <int>
## 1         203
```


``` r
fisheries$country %>%
  unique()
```

```
##   [1] "Albania"                   "Algeria"                  
##   [3] "American Samoa"            "Angola"                   
##   [5] "Anguilla"                  "Antigua and Barbuda"      
##   [7] "Argentina"                 "Aruba"                    
##   [9] "Australia"                 "Bahamas"                  
##  [11] "Bahrain"                   "Bangladesh"               
##  [13] "Barbados"                  "Belgium"                  
##  [15] "Belize"                    "Benin"                    
##  [17] "Bermuda"                   "Bonaire/S.Eustatius/Saba" 
##  [19] "Bosnia and Herzegovina"    "Brazil"                   
##  [21] "British Indian Ocean Ter"  "British Virgin Islands"   
##  [23] "Brunei Darussalam"         "Bulgaria"                 
##  [25] "Cabo Verde"                "Cambodia"                 
##  [27] "Cameroon"                  "Canada"                   
##  [29] "Cayman Islands"            "Channel Islands"          
##  [31] "Chile"                     "China"                    
##  [33] "China, Hong Kong SAR"      "China, Macao SAR"         
##  [35] "Colombia"                  "Comoros"                  
##  [37] "Congo, Dem. Rep. of the"   "Congo, Republic of"       
##  [39] "Cook Islands"              "Costa Rica"               
##  [41] "Croatia"                   "Cuba"                     
##  [43] "Cura\xe7ao"                "Cyprus"                   
##  [45] "C\xf4te d'Ivoire"          "Denmark"                  
##  [47] "Djibouti"                  "Dominica"                 
##  [49] "Dominican Republic"        "Ecuador"                  
##  [51] "Egypt"                     "El Salvador"              
##  [53] "Equatorial Guinea"         "Eritrea"                  
##  [55] "Estonia"                   "Ethiopia"                 
##  [57] "Falkland Is.(Malvinas)"    "Faroe Islands"            
##  [59] "Fiji, Republic of"         "Finland"                  
##  [61] "France"                    "French Guiana"            
##  [63] "French Polynesia"          "French Southern Terr"     
##  [65] "Gabon"                     "Gambia"                   
##  [67] "Georgia"                   "Germany"                  
##  [69] "Ghana"                     "Gibraltar"                
##  [71] "Greece"                    "Greenland"                
##  [73] "Grenada"                   "Guadeloupe"               
##  [75] "Guam"                      "Guatemala"                
##  [77] "Guinea"                    "GuineaBissau"             
##  [79] "Guyana"                    "Haiti"                    
##  [81] "Honduras"                  "Iceland"                  
##  [83] "India"                     "Indonesia"                
##  [85] "Iran (Islamic Rep. of)"    "Iraq"                     
##  [87] "Ireland"                   "Isle of Man"              
##  [89] "Israel"                    "Italy"                    
##  [91] "Jamaica"                   "Japan"                    
##  [93] "Jordan"                    "Kenya"                    
##  [95] "Kiribati"                  "Korea, Dem. People's Rep" 
##  [97] "Korea, Republic of"        "Kuwait"                   
##  [99] "Latvia"                    "Lebanon"                  
## [101] "Liberia"                   "Libya"                    
## [103] "Lithuania"                 "Madagascar"               
## [105] "Malaysia"                  "Maldives"                 
## [107] "Malta"                     "Marshall Islands"         
## [109] "Martinique"                "Mauritania"               
## [111] "Mauritius"                 "Mayotte"                  
## [113] "Mexico"                    "Micronesia, Fed.States of"
## [115] "Monaco"                    "Montenegro"               
## [117] "Montserrat"                "Morocco"                  
## [119] "Mozambique"                "Myanmar"                  
## [121] "Namibia"                   "Nauru"                    
## [123] "Netherlands"               "Netherlands Antilles"     
## [125] "New Caledonia"             "New Zealand"              
## [127] "Nicaragua"                 "Nigeria"                  
## [129] "Niue"                      "Norfolk Island"           
## [131] "Northern Mariana Is."      "Norway"                   
## [133] "Oman"                      "Other nei"                
## [135] "Pakistan"                  "Palau"                    
## [137] "Palestine, Occupied Tr."   "Panama"                   
## [139] "Papua New Guinea"          "Peru"                     
## [141] "Philippines"               "Pitcairn Islands"         
## [143] "Poland"                    "Portugal"                 
## [145] "Puerto Rico"               "Qatar"                    
## [147] "Romania"                   "Russian Federation"       
## [149] "R\xe9union"                "Saint Barth\xe9lemy"      
## [151] "Saint Helena"              "Saint Kitts and Nevis"    
## [153] "Saint Lucia"               "Saint Vincent/Grenadines" 
## [155] "SaintMartin"               "Samoa"                    
## [157] "Sao Tome and Principe"     "Saudi Arabia"             
## [159] "Senegal"                   "Serbia and Montenegro"    
## [161] "Seychelles"                "Sierra Leone"             
## [163] "Singapore"                 "Sint Maarten"             
## [165] "Slovenia"                  "Solomon Islands"          
## [167] "Somalia"                   "South Africa"             
## [169] "Spain"                     "Sri Lanka"                
## [171] "St. Pierre and Miquelon"   "Sudan"                    
## [173] "Sudan (former)"            "Suriname"                 
## [175] "Svalbard and Jan Mayen"    "Sweden"                   
## [177] "Syrian Arab Republic"      "Taiwan Province of China" 
## [179] "Tanzania, United Rep. of"  "Thailand"                 
## [181] "TimorLeste"                "Togo"                     
## [183] "Tokelau"                   "Tonga"                    
## [185] "Trinidad and Tobago"       "Tunisia"                  
## [187] "Turkey"                    "Turks and Caicos Is."     
## [189] "Tuvalu"                    "US Virgin Islands"        
## [191] "Ukraine"                   "Un. Sov. Soc. Rep."       
## [193] "United Arab Emirates"      "United Kingdom"           
## [195] "United States of America"  "Uruguay"                  
## [197] "Vanuatu"                   "Venezuela, Boliv Rep of"  
## [199] "Viet Nam"                  "Wallis and Futuna Is."    
## [201] "Yemen"                     "Yugoslavia SFR"           
## [203] "Zanzibar"
```

3. Based on the `asfis_species_number`, how many different (i.e.) fish species were caught?

``` r
fisheries %>% 
  mutate(asfis_species_number=as.factor(asfis_species_number)) %>% 
  summarize(n_asfis_species_number=n_distinct(asfis_species_number))
```

```
## # A tibble: 1 × 1
##   n_asfis_species_number
##                    <int>
## 1                   1551
```

4. What is the total catch for each `isscaap_taxonomic_group` in the data set?

``` r
fisheries %>% 
  group_by(isscaap_taxonomic_group) %>% 
  summarize(total_catch=sum(catch, na.rm=T))
```

```
## # A tibble: 30 × 2
##    isscaap_taxonomic_group              total_catch
##    <chr>                                      <dbl>
##  1 Abalones, winkles, conchs                  36324
##  2 Carps, barbels and other cyprinids         13834
##  3 Clams, cockles, arkshells                 130839
##  4 Cods, hakes, haddocks                    1218092
##  5 Crabs, seaspiders                         114419
##  6 Flounders, halibuts, soles                226309
##  7 Herrings, sardines, anchovies            1898529
##  8 Horseshoe crabs and other arachnoids         901
##  9 King crabs, squatlobsters                   9805
## 10 Lobsters, spinyrock lobsters               96630
## # ℹ 20 more rows
```

5. Based on the `asfis_species_name`, what are the top 5 most caught species? (note: "Osteichthyes" is not a species, it refers to unidentified fish. You should filter this one out.).

``` r
fisheries %>% 
  filter(asfis_species_name != 'Osteichthyes') %>% 
  group_by(asfis_species_name) %>% 
  summarize(top_species=sum(catch, na.rm=T), .groups='keep') %>% 
  arrange(desc(top_species))
```

```
## # A tibble: 1,545 × 2
## # Groups:   asfis_species_name [1,545]
##    asfis_species_name      top_species
##    <chr>                         <dbl>
##  1 Engraulis ringens            540739
##  2 Theragra chalcogramma        473722
##  3 Clupea harengus              264304
##  4 Gadus morhua                 217930
##  5 Katsuwonus pelamis           194923
##  6 Sardinops sagax              176094
##  7 Scomber japonicus            175444
##  8 Trachurus murphyi            152034
##  9 Sardinops melanostictus      144774
## 10 Mallotus villosus            131239
## # ℹ 1,535 more rows
```

6. For the species that was caught the most, which country had the highest catch?

``` r
fisheries %>% 
  arrange(-catch)
```

```
## # A tibble: 376,771 × 10
##    country               common_name isscaap_group_number isscaap_taxonomic_gr…¹
##    <chr>                 <chr>                      <dbl> <chr>                 
##  1 Peru                  Anchoveta(…                   35 Herrings, sardines, a…
##  2 Peru                  Anchoveta(…                   35 Herrings, sardines, a…
##  3 Peru                  Anchoveta(…                   35 Herrings, sardines, a…
##  4 Peru                  Anchoveta(…                   35 Herrings, sardines, a…
##  5 Japan                 Japanese p…                   35 Herrings, sardines, a…
##  6 Chile                 Chilean ja…                   37 Miscellaneous pelagic…
##  7 Chile                 Chilean ja…                   37 Miscellaneous pelagic…
##  8 United States of Ame… Alaska pol…                   32 Cods, hakes, haddocks 
##  9 Chile                 South Amer…                   35 Herrings, sardines, a…
## 10 China                 Marine fis…                   39 Marine fishes not ide…
## # ℹ 376,761 more rows
## # ℹ abbreviated name: ¹​isscaap_taxonomic_group
## # ℹ 6 more variables: asfis_species_number <chr>, asfis_species_name <chr>,
## #   fao_major_fishing_area <dbl>, measure <chr>, year <dbl>, catch <dbl>
```

``` r
fisheries %>% 
  filter(asfis_species_name == 'Engraulis ringens') %>% 
  group_by(country) %>% 
  summarize(catch_total= sum(catch, na.rm=T)) %>% 
  arrange(-catch_total)
```

```
## # A tibble: 3 × 2
##   country catch_total
##   <chr>         <dbl>
## 1 Peru         439717
## 2 Chile        100694
## 3 Ecuador         328
```


7. Which country had the largest overall catch between the years 2002-2012?

``` r
colnames(fisheries)
```

```
##  [1] "country"                 "common_name"            
##  [3] "isscaap_group_number"    "isscaap_taxonomic_group"
##  [5] "asfis_species_number"    "asfis_species_name"     
##  [7] "fao_major_fishing_area"  "measure"                
##  [9] "year"                    "catch"
```

``` r
fisheries %>%
  filter(between(year,2002,2012)) %>% 
  group_by(country) %>% 
  summarize(overall_catch=sum(catch, na.rm=T)) %>% 
  arrange(-overall_catch)
```

```
## # A tibble: 200 × 2
##    country                  overall_catch
##    <chr>                            <dbl>
##  1 China                           269238
##  2 United States of America        167309
##  3 Russian Federation              112028
##  4 Indonesia                       104362
##  5 Japan                           104152
##  6 Chile                            97030
##  7 Spain                            92286
##  8 Peru                             86482
##  9 Portugal                         69778
## 10 India                            69681
## # ℹ 190 more rows
```

8. Which country had the largest catch in a single year? What year was it? 

``` r
fisheries %>% 
  group_by(country, year) %>% 
  summarize(largest_catch=sum(catch, na.rm=T), .groups='keep') %>% 
  arrange(-largest_catch)
```

```
## # A tibble: 11,583 × 3
## # Groups:   country, year [11,583]
##    country  year largest_catch
##    <chr>   <dbl>         <dbl>
##  1 Peru     1970         77000
##  2 Peru     1971         76800
##  3 Peru     1968         62700
##  4 China    2001         39327
##  5 Japan    1972         30167
##  6 Japan    1988         29701
##  7 China    2002         28967
##  8 China    2010         27851
##  9 Japan    1976         27825
## 10 China    1998         27593
## # ℹ 11,573 more rows
```

9. Fishing practices for sharks, rays, chimaeras and other cartilaginous fish (group 38) are of particular concern due to their conservation status. Make a new dataframe `sharks` that only contains data on this group. 

``` r
sharks <- fisheries %>% 
  filter(isscaap_group_number=='38')
```
10. Using the `sharks` dataframe, use `mutate()` to create a new column called `fishing_pressure` that is based on the total catch. If the total catch is greater than 75, the fishing pressure is considered "high", otherwise it is considered "moderate".

``` r
sharks <- sharks %>% 
  mutate(fishing_pressure=ifelse(catch > 75,'high','moderate'))
```

11. For sharks, how does the average catch differ between high and moderate fishing pressure?

``` r
sharks %>% 
  filter(catch>0 | catch!='NA') %>% 
  group_by(fishing_pressure) %>% 
  summarize(average_catch=mean(catch, na.rm=T), .groups = 'keep')
```

```
## # A tibble: 2 × 2
## # Groups:   fishing_pressure [2]
##   fishing_pressure average_catch
##   <chr>                    <dbl>
## 1 high                      86.6
## 2 moderate                  14.3
```

12. Perform one analysis of your choice on the fisheries dataframe that includes a minimum of three lines of code and two functions. Write a seentence or two that explains the intent of your code.

``` r
fisheries
```

```
## # A tibble: 376,771 × 10
##    country common_name               isscaap_group_number isscaap_taxonomic_gr…¹
##    <chr>   <chr>                                    <dbl> <chr>                 
##  1 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
##  2 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
##  3 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
##  4 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
##  5 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
##  6 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
##  7 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
##  8 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
##  9 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
## 10 Albania Angelsharks, sand devils…                   38 Sharks, rays, chimaer…
## # ℹ 376,761 more rows
## # ℹ abbreviated name: ¹​isscaap_taxonomic_group
## # ℹ 6 more variables: asfis_species_number <chr>, asfis_species_name <chr>,
## #   fao_major_fishing_area <dbl>, measure <chr>, year <dbl>, catch <dbl>
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
