Cyclistic
================
Dakota Wylde
2022-06-25

## Setting up my Environment

Here, I will download and install the R packages necessary to the
analysis, such as ‘tidyverse’ and ‘dplyr’.

``` r
setwd("D:/Datasets/Cyclistic")
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
    ## ✔ readr   2.1.2     ✔ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(lubridate) 
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following objects are masked from 'package:base':
    ## 
    ##     date, intersect, setdiff, union

``` r
library(ggplot2)

# Tell R to read the appropriate CSV files

jun2021 <- read_csv("202106-divvy-tripdata.csv")
```

    ## Rows: 729595 Columns: 13

    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
jul2021 <- read_csv("202107-divvy-tripdata.csv")
```

    ## Rows: 822410 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
aug2021 <- read_csv("202108-divvy-tripdata.csv")
```

    ## Rows: 804352 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
sep2021 <- read_csv("202109-divvy-tripdata.csv")
```

    ## Rows: 756147 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
oct2021 <- read_csv("202110-divvy-tripdata.csv")
```

    ## Rows: 631226 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
nov2021 <- read_csv("202111-divvy-tripdata.csv")
```

    ## Rows: 359978 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
dec2021 <- read_csv("202112-divvy-tripdata.csv")
```

    ## Rows: 247540 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
jan2022 <- read_csv("202201-divvy-tripdata.csv")
```

    ## Rows: 103770 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
feb2022 <- read_csv("202202-divvy-tripdata.csv")
```

    ## Rows: 115609 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
mar2022 <- read_csv("202203-divvy-tripdata.csv")
```

    ## Rows: 284042 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
apr2022 <- read_csv("202204-divvy-tripdata.csv")
```

    ## Rows: 371249 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
may2022 <- read_csv("202205-divvy-tripdata.csv")
```

    ## Rows: 634858 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...
    ## dbl  (4): start_lat, start_lng, end_lat, end_lng
    ## dttm (2): started_at, ended_at
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

## Reorganizing the Data

The data is separated by month. In order to do a comprehensive analysis
of the previous year, I will need them to be reorganized into a single
data frame, add columns that distinguish different days of the week, and
add a column that indicates ride length.

``` r
all_trips <- bind_rows(jun2021, jul2021, aug2021,
                       sep2021, oct2021, nov2021,
                       dec2021, jan2022, feb2022,
                       mar2022, apr2022, may2022)

all_trips$date <- as.Date(all_trips$started_at)
all_trips$month <- format(as.Date(all_trips$date),"%m")
all_trips$day  <-  format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")
all_trips$ride_length <-  difftime(all_trips$ended_at, all_trips$started_at)
```

## Cleaning the Data

Our analysis should exclude irrelevant data, such as trips with a
distance of zero. This command will prune all such trips.

``` r
all_trips_v4 <- all_trips[!(all_trips$ride_length<0),]
```

## Visualizing the Data

Here, we will make several comparisons of how casual customers and
members behave.

This is a visualization that compares the total number of rides taken on
a given day of the week between casual riders and members.

``` r
all_trips_v4 %>% 
  mutate(weekday=wday(started_at,label=TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarize(number_of_rides=n()
            ,average_duration=mean(ride_length)) %>% 
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x=weekday, y=number_of_rides, fill=member_casual))+
  geom_col(position = "dodge")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.

![](cyclisticdata_files/figure-gfm/unnamed-chunk-4-1.png)<!-- --> This
visualization shows that casual riders and members take a similar number
of trips. However, members tend to take more rides during the week,
while casual riders take more trips on the weekend.

The visualization only tells part of the story. While the number of
trips taken is about equal, there is a stark difference between casuals
and members in terms of average trip duration.

``` r
all_trips_v4 %>% 
  mutate(weekday=wday(started_at,label=TRUE)) %>% 
  group_by(member_casual,weekday) %>% 
  summarize(number_of_rides=n()
            ,average_duration=mean(ride_length)) %>% 
  arrange(member_casual,weekday) %>% 
  ggplot(aes(x=weekday, y= average_duration, fill=member_casual))+
  geom_col(position="dodge")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.
    ## Don't know how to automatically pick scale for object of type difftime.
    ## Defaulting to continuous.

![](cyclisticdata_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

Looking at the data from a monthly perspective yields similar results.
Members and Casuals seem to take roughly similar numbers of trips,
though members seem to be more consistent in their ridership, riding
through the fall and winter months. Casuals still seem to take much
longer trips on average.

``` r
all_trips_v4 %>% 
  group_by(member_casual,month) %>% 
  summarize(number_of_rides=n()
            ,average_duration=mean(ride_length)) %>% 
  arrange(member_casual,month) %>% 
  ggplot(aes(x=month, y=number_of_rides, fill=member_casual))+
  geom_col(position = "dodge")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.

![](cyclisticdata_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

``` r
all_trips_v4 %>% 
  group_by(member_casual,month) %>% 
  summarize(number_of_rides=n()
            ,average_duration=mean(ride_length)) %>% 
  arrange(member_casual,month) %>% 
  ggplot(aes(x=month, y=average_duration, fill=member_casual))+
  geom_col(position = "dodge")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.
    ## Don't know how to automatically pick scale for object of type difftime.
    ## Defaulting to continuous.

![](cyclisticdata_files/figure-gfm/unnamed-chunk-6-2.png)<!-- -->

In summary, members and casual riders seem to consistently take trips in
comparable quantities. However, casual riders are more inclined to ride
on weekends and during the summer, suggesting that their ridership tends
to be recreational in nature. Members have a much more consistent
ridership, biking reliably on weekdays and through the colder months.

In contrast, casual riders on average take much longer trips than
members do. This pattern is consistent regardless of the day of the week
or time of year.
