---
title: "Homework 5"
author: "Itzel Gonzalez"
date: "2025-01-27"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---

## Instructions
Answer the following questions and/or complete the exercises in RMarkdown. Please embed all of your code and push the final work to your repository. Your report should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run.  

## Load the tidyverse

``` r
library("tidyverse")
library("janitor")
```

## Data 
For this assignment, we will use data from a study on vertebrate community composition and impacts from defaunation in [Gabon, Africa](https://en.wikipedia.org/wiki/Gabon). One thing to notice is that the data include 24 separate transects. Each transect represents a path through different forest management areas.  

Reference: Koerner SE, Poulsen JR, Blanchard EJ, Okouyi J, Clark CJ. Vertebrate community composition and diversity declines along a defaunation gradient radiating from rural villages in Gabon. _Journal of Applied Ecology_. 2016. This paper, along with a description of the variables is included inside the data folder.   

**1. Load `IvindoData_DryadVersion.csv` and store it as a new object called `gabon`.**

``` r
gabon <- read_csv("data/IvindoData_DryadVersion.csv")
```

```
## Rows: 24 Columns: 26
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (2): HuntCat, LandUse
## dbl (24): TransectID, Distance, NumHouseholds, Veg_Rich, Veg_Stems, Veg_lian...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**2. Use one or more of the summary functions you have learned to get an idea of the structure of the data.**  

``` r
glimpse(gabon)
```

```
## Rows: 24
## Columns: 26
## $ TransectID              <dbl> 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 13, 14, 15, 16, …
## $ Distance                <dbl> 7.14, 17.31, 18.32, 20.85, 15.95, 17.47, 24.06…
## $ HuntCat                 <chr> "Moderate", "None", "None", "None", "None", "N…
## $ NumHouseholds           <dbl> 54, 54, 29, 29, 29, 29, 29, 54, 25, 73, 46, 56…
## $ LandUse                 <chr> "Park", "Park", "Park", "Logging", "Park", "Pa…
## $ Veg_Rich                <dbl> 16.67, 15.75, 16.88, 12.44, 17.13, 16.50, 14.7…
## $ Veg_Stems               <dbl> 31.20, 37.44, 32.33, 29.39, 36.00, 29.22, 31.2…
## $ Veg_liana               <dbl> 5.78, 13.25, 4.75, 9.78, 13.25, 12.88, 8.38, 8…
## $ Veg_DBH                 <dbl> 49.57, 34.59, 42.82, 36.62, 41.52, 44.07, 51.2…
## $ Veg_Canopy              <dbl> 3.78, 3.75, 3.43, 3.75, 3.88, 2.50, 4.00, 4.00…
## $ Veg_Understory          <dbl> 2.89, 3.88, 3.00, 2.75, 3.25, 3.00, 2.38, 2.71…
## $ RA_Apes                 <dbl> 1.87, 0.00, 4.49, 12.93, 0.00, 2.48, 3.78, 6.1…
## $ RA_Birds                <dbl> 52.66, 52.17, 37.44, 59.29, 52.62, 38.64, 42.6…
## $ RA_Elephant             <dbl> 0.00, 0.86, 1.33, 0.56, 1.00, 0.00, 1.11, 0.43…
## $ RA_Monkeys              <dbl> 38.59, 28.53, 41.82, 19.85, 41.34, 43.29, 46.2…
## $ RA_Rodent               <dbl> 4.22, 6.04, 1.06, 3.66, 2.52, 1.83, 3.10, 1.26…
## $ RA_Ungulate             <dbl> 2.66, 12.41, 13.86, 3.71, 2.53, 13.75, 3.10, 8…
## $ Rich_AllSpecies         <dbl> 22, 20, 22, 19, 20, 22, 23, 19, 19, 19, 21, 22…
## $ Evenness_AllSpecies     <dbl> 0.793, 0.773, 0.740, 0.681, 0.811, 0.786, 0.81…
## $ Diversity_AllSpecies    <dbl> 2.452, 2.314, 2.288, 2.006, 2.431, 2.429, 2.56…
## $ Rich_BirdSpecies        <dbl> 11, 10, 11, 8, 8, 10, 11, 11, 11, 9, 11, 11, 1…
## $ Evenness_BirdSpecies    <dbl> 0.732, 0.704, 0.688, 0.559, 0.799, 0.771, 0.80…
## $ Diversity_BirdSpecies   <dbl> 1.756, 1.620, 1.649, 1.162, 1.660, 1.775, 1.92…
## $ Rich_MammalSpecies      <dbl> 11, 10, 11, 11, 12, 12, 12, 8, 8, 10, 10, 11, …
## $ Evenness_MammalSpecies  <dbl> 0.736, 0.705, 0.650, 0.619, 0.736, 0.694, 0.77…
## $ Diversity_MammalSpecies <dbl> 1.764, 1.624, 1.558, 1.484, 1.829, 1.725, 1.92…
```
  
**3. Use `mutate()` Change the variables `HuntCat`, `LandUse`, and `TransectID` to factors.**

``` r
gabon %>% 
  mutate(HuntCat=as.factor(HuntCat),
         LandUse=as.factor(LandUse),
         TransectID=as.factor(TransectID))
```

```
## # A tibble: 24 × 26
##    TransectID Distance HuntCat  NumHouseholds LandUse Veg_Rich Veg_Stems
##    <fct>         <dbl> <fct>            <dbl> <fct>      <dbl>     <dbl>
##  1 1              7.14 Moderate            54 Park        16.7      31.2
##  2 2             17.3  None                54 Park        15.8      37.4
##  3 2             18.3  None                29 Park        16.9      32.3
##  4 3             20.8  None                29 Logging     12.4      29.4
##  5 4             16.0  None                29 Park        17.1      36  
##  6 5             17.5  None                29 Park        16.5      29.2
##  7 6             24.1  None                29 Park        14.8      31.2
##  8 7             19.8  None                54 Logging     13.2      32.6
##  9 8              5.78 High                25 Neither     12.6      23.7
## 10 9              5.13 High                73 Logging     16        27.1
## # ℹ 14 more rows
## # ℹ 19 more variables: Veg_liana <dbl>, Veg_DBH <dbl>, Veg_Canopy <dbl>,
## #   Veg_Understory <dbl>, RA_Apes <dbl>, RA_Birds <dbl>, RA_Elephant <dbl>,
## #   RA_Monkeys <dbl>, RA_Rodent <dbl>, RA_Ungulate <dbl>,
## #   Rich_AllSpecies <dbl>, Evenness_AllSpecies <dbl>,
## #   Diversity_AllSpecies <dbl>, Rich_BirdSpecies <dbl>,
## #   Evenness_BirdSpecies <dbl>, Diversity_BirdSpecies <dbl>, …
```

**4. Use `filter` to make three new dataframes focused only on 1. national parks, 2. logging concessions, and 3. neither. Have a look at the README in the data folder so you understand the variables.**

``` r
national_parks <- gabon %>% 
  filter(LandUse=='Park')

logging_concessions <- gabon %>% 
  filter(LandUse=='Logging')

neither_landuse <- gabon %>% 
  filter(LandUse=='Neither')
```

**5. How many transects are recorded for each land use type?** 

``` r
gabon %>% 
  select(LandUse) %>% 
  table()
```

```
## LandUse
## Logging Neither    Park 
##      13       4       7
```

**6. For which land use type (national parks, logging, or neither) is average all species diversity the greatest?**

National Parks has the largest average of all species diversity.


``` r
mean(national_parks$Diversity_AllSpecies)
```

```
## [1] 2.425143
```


``` r
mean(logging_concessions$Diversity_AllSpecies)
```

```
## [1] 2.232538
```


``` r
mean(neither_landuse$Diversity_AllSpecies)
```

```
## [1] 2.3575
```


**7. Use `filter` to find the transect that has the highest relative abundance of elephants. What land use type is this? Use `arrange()` to sort your results.** 

Transect 18 has the highest relative abundance of elephants 2.30 %, and the land type use is 'Logging'. 

``` r
gabon %>% 
  select(TransectID, LandUse, RA_Elephant) %>% 
  arrange(-RA_Elephant)
```

```
## # A tibble: 24 × 3
##    TransectID LandUse RA_Elephant
##         <dbl> <chr>         <dbl>
##  1         18 Logging        2.3 
##  2          8 Neither        2.2 
##  3          2 Park           1.33
##  4          6 Park           1.11
##  5          4 Park           1   
##  6         13 Logging        0.99
##  7          2 Park           0.86
##  8         21 Neither        0.77
##  9          3 Logging        0.56
## 10         14 Logging        0.52
## # ℹ 14 more rows
```

**8. Use `filter` to find all transects that have greater than 15 tree species or a breast height diameter between 50 and 60cm.  **

``` r
gabon %>% 
  select(TransectID, Veg_Rich, Veg_DBH) %>% 
  filter(Veg_Rich>15 | between(Veg_Rich, 50, 60))
```

```
## # A tibble: 11 × 3
##    TransectID Veg_Rich Veg_DBH
##         <dbl>    <dbl>   <dbl>
##  1          1     16.7    49.6
##  2          2     15.8    34.6
##  3          2     16.9    42.8
##  4          4     17.1    41.5
##  5          5     16.5    44.1
##  6          9     16      69.3
##  7         14     15.8    52.1
##  8         21     16.2    50.4
##  9         22     17.1    39.3
## 10         24     16.8    44.2
## 11         26     18.8    35.6
```

**9.Which transects and land use types have more than 10 tree species and 10 mammal species? Use `arrange()` to sort by the number of tree species.**

``` r
gabon %>% 
  select(TransectID, LandUse, Veg_Rich, Rich_MammalSpecies) %>% 
  filter(Veg_Rich>10, Rich_MammalSpecies==10) %>% 
  arrange(-Veg_Rich)
```

```
## # A tibble: 6 × 4
##   TransectID LandUse Veg_Rich Rich_MammalSpecies
##        <dbl> <chr>      <dbl>              <dbl>
## 1         26 Logging     18.8                 10
## 2         21 Neither     16.2                 10
## 3          9 Logging     16                   10
## 4          2 Park        15.8                 10
## 5         25 Logging     15                   10
## 6         13 Logging     12.4                 10
```

**10. Explore the data! Develop one question on your own that includes at least two lines of code. **

Which transect has the least bird species diversity inside a logging concession?

``` r
gabon %>% 
  select(TransectID, LandUse, Diversity_BirdSpecies) %>% 
  filter(LandUse =='Logging') %>% 
  arrange(Diversity_BirdSpecies)
```

```
## # A tibble: 13 × 3
##    TransectID LandUse Diversity_BirdSpecies
##         <dbl> <chr>                   <dbl>
##  1          3 Logging                  1.16
##  2          9 Logging                  1.26
##  3         22 Logging                  1.39
##  4         16 Logging                  1.46
##  5         25 Logging                  1.48
##  6         19 Logging                  1.60
##  7         13 Logging                  1.60
##  8          7 Logging                  1.65
##  9         26 Logging                  1.68
## 10         14 Logging                  1.68
## 11         20 Logging                  1.71
## 12         27 Logging                  1.72
## 13         18 Logging                  1.83
```

## Knit and Upload
Please knit your work as a .pdf or .html file and upload to Canvas. Homework is due before the start of the next lab. No late work is accepted. Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  
