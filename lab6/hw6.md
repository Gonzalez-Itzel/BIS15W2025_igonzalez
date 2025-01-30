---
title: "Homework 6"
author: "Itzel Gonzalez"
date: "2025-01-30"
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

## Load the superhero data
Let's have a little fun with this one! We are going to explore data on superheroes. These are data taken from comic books and assembled by devoted fans. The include a good mix of categorical and continuous data.  Data taken from: https://www.kaggle.com/claudiodavi/superhero-set  

Load the `heroes_information.csv` and `super_hero_powers.csv` data. Make sure the columns are cleanly named.

``` r
superhero_info <- read_csv("data/heroes_information.csv", na = c("", "-99", "-")) %>% clean_names()
```

```
## Rows: 734 Columns: 10
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (8): name, Gender, Eye color, Race, Hair color, Publisher, Skin color, A...
## dbl (2): Height, Weight
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

``` r
superhero_powers <- read_csv("data/super_hero_powers.csv", na = c("", "-99", "-")) %>% clean_names()
```

```
## Rows: 667 Columns: 168
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr   (1): hero_names
## lgl (167): Agility, Accelerated Healing, Lantern Power Ring, Dimensional Awa...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

1. For the superhero_info data, how many bad, good, and neutral superheros are there? Try using count() and/ or tabyl().

``` r
superhero_info %>% 
  count(alignment)
```

```
## # A tibble: 4 × 2
##   alignment     n
##   <chr>     <int>
## 1 bad         207
## 2 good        496
## 3 neutral      24
## 4 <NA>          7
```


``` r
superhero_info %>% 
  tabyl(alignment)
```

```
##  alignment   n     percent valid_percent
##        bad 207 0.282016349    0.28473177
##       good 496 0.675749319    0.68225585
##    neutral  24 0.032697548    0.03301238
##       <NA>   7 0.009536785            NA
```
2. Notice that we have some bad superheros! Who are they? List their names below.  

``` r
superhero_info %>%
  mutate(across(-1, ~ tolower(.))) %>% 
  select(name, alignment) %>% 
  filter(alignment=='bad')
```

```
## # A tibble: 207 × 2
##    name          alignment
##    <chr>         <chr>    
##  1 Abomination   bad      
##  2 Abraxas       bad      
##  3 Absorbing Man bad      
##  4 Air-Walker    bad      
##  5 Ajax          bad      
##  6 Alex Mercer   bad      
##  7 Alien         bad      
##  8 Amazo         bad      
##  9 Ammo          bad      
## 10 Angela        bad      
## # ℹ 197 more rows
```


``` r
superhero_info %>% 
   mutate(across(-1, ~ tolower(.))) %>%  
  filter(alignment=='bad')
```

```
## # A tibble: 207 × 10
##    name  gender eye_color race  hair_color height publisher skin_color alignment
##    <chr> <chr>  <chr>     <chr> <chr>      <chr>  <chr>     <chr>      <chr>    
##  1 Abom… male   green     huma… no hair    203    marvel c… <NA>       bad      
##  2 Abra… male   blue      cosm… black      <NA>   marvel c… <NA>       bad      
##  3 Abso… male   blue      human no hair    193    marvel c… <NA>       bad      
##  4 Air-… male   blue      <NA>  white      188    marvel c… <NA>       bad      
##  5 Ajax  male   brown     cybo… black      193    marvel c… <NA>       bad      
##  6 Alex… male   <NA>      human <NA>       <NA>   wildstorm <NA>       bad      
##  7 Alien male   <NA>      xeno… no hair    244    dark hor… black      bad      
##  8 Amazo male   red       andr… <NA>       257    dc comics <NA>       bad      
##  9 Ammo  male   brown     human black      188    marvel c… <NA>       bad      
## 10 Ange… female <NA>      <NA>  <NA>       <NA>   image co… <NA>       bad      
## # ℹ 197 more rows
## # ℹ 1 more variable: weight <chr>
```

3. How many distinct "races" are represented in `superhero_info`?

``` r
superhero_info %>% 
  summarize(n_race=n_distinct(race,na.rm=T))
```

```
## # A tibble: 1 × 1
##   n_race
##    <int>
## 1     61
```

## Good and Bad
4. Let's make two different data frames, one focused on the "good guys" and another focused on the "bad guys".

``` r
good_guys <- superhero_info %>% 
   mutate(across(-1, ~ tolower(.))) %>% 
  filter(alignment=='good')
```


``` r
bad_guys <- superhero_info %>% 
   mutate(across(-1, ~ tolower(.))) %>% 
  filter(alignment=='bad')
```

5. Who are the good Vampires?

``` r
good_guys %>% 
  mutate(across(-1, ~ tolower(.))) %>% 
  select(name, race) %>% 
  filter(race=='vampire')
```

```
## # A tibble: 2 × 2
##   name  race   
##   <chr> <chr>  
## 1 Angel vampire
## 2 Blade vampire
```

6. Who has the height advantage- bad guys or good guys? Convert their height to meters and sort from tallest to shortest.  

**The good guys have the height advantage.**


``` r
good_guys %>% 
  mutate(height_m=as.numeric(height)) %>% 
  mutate(height_m=height_m/100) %>% 
  select(name, height_m) %>% 
  arrange(-height_m)
```

```
## # A tibble: 496 × 2
##    name          height_m
##    <chr>            <dbl>
##  1 Fin Fang Foom     9.75
##  2 Groot             7.01
##  3 Wolfsbane         3.66
##  4 Sasquatch         3.05
##  5 Ymir              3.05
##  6 Rey               2.97
##  7 Hellboy           2.59
##  8 Hulk              2.44
##  9 Kilowog           2.34
## 10 Cloak             2.26
## # ℹ 486 more rows
```




``` r
bad_guys %>% 
  mutate(height_m=as.numeric(height)) %>% 
  mutate(height_m=height_m/100) %>% 
  select(name, height_m) %>% 
  arrange(-height_m) 
```

```
## # A tibble: 207 × 2
##    name           height_m
##    <chr>             <dbl>
##  1 MODOK              3.66
##  2 Onslaught          3.05
##  3 Sauron             2.79
##  4 Solomon Grundy     2.79
##  5 Darkseid           2.67
##  6 Amazo              2.57
##  7 Alien              2.44
##  8 Doomsday           2.44
##  9 Killer Croc        2.44
## 10 Venom III          2.29
## # ℹ 197 more rows
```

## `superhero_powers`
Have a quick look at the `superhero_powers` data frame.  

7. How many superheros have a combination of agility, stealth, super_strength, and stamina?

``` r
superhero_powers %>% 
  select(hero_names, agility, stealth, super_strength, stamina) %>% 
  filter(agility==TRUE, stealth==TRUE, super_strength==TRUE, stamina==TRUE) %>% 
  summarize(n_hero_name=n_distinct(hero_names))
```

```
## # A tibble: 1 × 1
##   n_hero_name
##         <int>
## 1          40
```


``` r
superhero_powers %>% 
  select(hero_names, agility, stealth, super_strength, stamina) %>% 
  filter(agility==TRUE, stealth==TRUE, super_strength==TRUE, stamina==TRUE) %>% 
  summarize(total=n())
```

```
## # A tibble: 1 × 1
##   total
##   <int>
## 1    40
```

8. Who is the most powerful superhero? Have a look at the code chunk below. Use the internet to annotate each line of code so you know how it works. It's OK to use AI to help you with this task.

``` r
superhero_powers %>% # pipes the data set to the next function
  mutate(across(-1, ~ ifelse(. == TRUE, 1, 0))) %>% # checks every column except the first one, otherwise each column (.) with a value of TRUE changes to 1 and if its FALSE it will change to 0
  mutate(total_powers = rowSums(across(-1))) %>% # adds up all values across each row (except for the 1st column) and stores it in a variable called 'total_powers' 
  select(hero_names, total_powers) %>% # selects columns with the name 'hero_names' and 'total_powers'
  arrange(-total_powers) # sorts the data in a descending order
```

```
## # A tibble: 667 × 2
##    hero_names        total_powers
##    <chr>                    <dbl>
##  1 Spectre                     49
##  2 Amazo                       44
##  3 Living Tribunal             35
##  4 Martian Manhunter           35
##  5 Man of Miracles             34
##  6 Captain Marvel              33
##  7 T-X                         33
##  8 Galactus                    32
##  9 T-1000                      32
## 10 Mister Mxyzptlk             31
## # ℹ 657 more rows
```

## Your Favorite
9. Pick your favorite superhero and let's see their powers!  

``` r
superhero_powers %>% 
  filter(hero_names=='Groot') 
```

```
## # A tibble: 1 × 168
##   hero_names agility accelerated_healing lantern_power_ring
##   <chr>      <lgl>   <lgl>               <lgl>             
## 1 Groot      FALSE   FALSE               FALSE             
## # ℹ 164 more variables: dimensional_awareness <lgl>, cold_resistance <lgl>,
## #   durability <lgl>, stealth <lgl>, energy_absorption <lgl>, flight <lgl>,
## #   danger_sense <lgl>, underwater_breathing <lgl>, marksmanship <lgl>,
## #   weapons_master <lgl>, power_augmentation <lgl>, animal_attributes <lgl>,
## #   longevity <lgl>, intelligence <lgl>, super_strength <lgl>,
## #   cryokinesis <lgl>, telepathy <lgl>, energy_armor <lgl>,
## #   energy_blasts <lgl>, duplication <lgl>, size_changing <lgl>, …
```

10. Can you find your hero in the superhero_info data? Show their info!  

``` r
superhero_info %>% 
  filter(name=='Groot')
```

```
## # A tibble: 1 × 10
##   name  gender eye_color race   hair_color height publisher skin_color alignment
##   <chr> <chr>  <chr>     <chr>  <chr>       <dbl> <chr>     <chr>      <chr>    
## 1 Groot Male   yellow    Flora… <NA>          701 Marvel C… <NA>       good     
## # ℹ 1 more variable: weight <dbl>
```

## Knit and Upload
Please knit your work as a .pdf or .html file and upload to Canvas. Homework is due before the start of the next lab. No late work is accepted. Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  
