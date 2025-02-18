---
title: "Homework 2"
author: "Itzel Gonzalez"
date: "2025-01-13"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---

## Instructions
Answer the following questions and/or complete the exercises in RMarkdown. Please embed all of your code and push the final work to your repository. Your report should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run.  

**1. Objects in R are a way in which we can store data or operations. Make a new object `pi` as 3.14159. You should now see the object `pi` in the environment window in the top right.** 

``` r
pi <- 3.14159
```

**2. Write a code chunk that divides `pi` by 2. Use the help command `?` to learn how to use the `round` function to limit your result to 3 significant digits.**  

``` r
round(pi/2, digits=3)
```

```
## [1] 1.571
```

**3. Calculate the mean for the numbers 2, 8, 4, 6, 7, 4, 9, 9, 10. Please start by making a new object `x` that holds these values then use `mean` to perform the calculation.**  

``` r
x <- c(2, 8, 4, 6, 7, 4, 9, 9, 10)
mean(x)
```

```
## [1] 6.555556
```

**4. Make three new vectors that show the name, height in feet, and height in meters of the five tallest mountains in the world.**

``` r
name <- c("Mount Everest", "K2", "Kangchenjunga", "Lhotse", "Makalu")
height_ft <- c(28169, 28251,28169, 27940, 27825)
height_m <- c(8848, 8611, 8586, 8516, 8481)
```

**5. Combine these vectors into a data frame called `mountains`.**

``` r
mountains <- data.frame(name, height_ft, height_m)
mountains
```

```
##            name height_ft height_m
## 1 Mount Everest     28169     8848
## 2            K2     28251     8611
## 3 Kangchenjunga     28169     8586
## 4        Lhotse     27940     8516
## 5        Makalu     27825     8481
```

**6. What is the mean height of the mountains in feet?**

``` r
mean(mountains$height_ft)
```

```
## [1] 28070.8
```

**7. When were each of these mountains first climbed (i.e. in what year)? Make a new vector `first_climbed` and add it to the `mountains` data frame.**

``` r
first_climbed <- c(1953, 1954, 1955, 1956, 1955)
mountains <- data.frame(name, height_ft, height_m, first_climbed)
```

**8. How many times have each of these mountains been climbed? Make a new vector `summits` and add it to the `mountains` data frame.**

``` r
summits <- c(5656, 283, 243, 461, 361)
mountains <- data.frame(name, height_ft, height_m, first_climbed, summits)
```

**9. Which mountain has the highest number of fatalities? Make a new vector `fatalities` and add it to the `mountains` data frame.**

``` r
fatalities <- c(223, 40, 40, 13, 31)
mountains <- data.frame(name, height_ft, height_m, first_climbed, summits, fatalities)
mountains
```

```
##            name height_ft height_m first_climbed summits fatalities
## 1 Mount Everest     28169     8848          1953    5656        223
## 2            K2     28251     8611          1954     283         40
## 3 Kangchenjunga     28169     8586          1955     243         40
## 4        Lhotse     27940     8516          1956     461         13
## 5        Makalu     27825     8481          1955     361         31
```

**10. Write your data frame to a .csv file.**

``` r
write.csv(mountains, "mountains.csv", row.names = FALSE)
```

## Knit and Upload
Please knit your work as a .pdf or .html file and upload to Canvas. Homework is due before the start of the next lab. No late work is accepted. Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  
