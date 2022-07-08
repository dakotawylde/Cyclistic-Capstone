# Setting up my environment

setwd("D:/Datasets/Cyclistic")
library(tidyverse)
library(lubridate) 
library(ggplot2)

# Tell R to read the appropriate CSV files

jun2021 <- read_csv("202106-divvy-tripdata.csv")
jul2021 <- read_csv("202107-divvy-tripdata.csv")
aug2021 <- read_csv("202108-divvy-tripdata.csv")
sep2021 <- read_csv("202109-divvy-tripdata.csv")
oct2021 <- read_csv("202110-divvy-tripdata.csv")
nov2021 <- read_csv("202111-divvy-tripdata.csv")
dec2021 <- read_csv("202112-divvy-tripdata.csv")
jan2022 <- read_csv("202201-divvy-tripdata.csv")
feb2022 <- read_csv("202202-divvy-tripdata.csv")
mar2022 <- read_csv("202203-divvy-tripdata.csv")
apr2022 <- read_csv("202204-divvy-tripdata.csv")
may2022 <- read_csv("202205-divvy-tripdata.csv")


# Combine into a single dataframe, and  inspect

all_trips <- bind_rows(jun2021, jul2021, aug2021,
                       sep2021, oct2021, nov2021,
                       dec2021, jan2022, feb2022,
                       mar2022, apr2022, may2022)


# Add Columns listing the date, month, and year of each ride

all_trips$date <- as.Date(all_trips$started_at)
all_trips$month <- format(as.Date(all_trips$date),"%m")
all_trips$day  <-  format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")
all_trips$ride_length <-  difftime(all_trips$ended_at, all_trips$started_at)


# Remove non-relevant data, organize remaining

all_trips_v4 <- all_trips[!(all_trips$ride_length<0),]

all_trips_v4$day_of_week <- ordered(all_trips_v4$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# analyze ridership data by type and weekday

all_trips_v4 %>% 
  mutate(weekday=wday(started_at,label=TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarize(number_of_rides=n())

# A plot comparing the number of rides taken across different days of the week, with results separated by membership status.
# Casual memebers seem to take more trips during the weekend, while members get more use during the weekday.

all_trips_v4 %>% 
  mutate(weekday=wday(started_at,label=TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarize(number_of_rides=n()
            ,average_duration=mean(ride_length)) %>% 
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x=weekday, y=number_of_rides, fill=member_casual))+
  geom_col(position = "dodge")

# A plot comparing the  day of the average distance driven during a given day of the week, separated by membership status.
# Casual customers seem to take much longer trips than members, no matter what time!

all_trips_v4 %>% 
  mutate(weekday=wday(started_at,label=TRUE)) %>% 
  group_by(member_casual,weekday) %>% 
  summarize(number_of_rides=n()
            ,average_duration=mean(ride_length)) %>% 
  arrange(member_casual,weekday) %>% 
  ggplot(aes(x=weekday, y= average_duration, fill=member_casual))+
  geom_col(position="dodge")

# How do annual members and casual riders use Cyclistic bikes differently?
# Why would casual riders buy Cyclistic annual memberships?
# How can cyclistic use  digital media to influence casual riders to become members?

# A visualization of how many trips are taken by casual riders and members in a given month.
# Though the number of rides taken is about equal, casual riders use the bikes less during the fall and winter.

all_trips_v4 %>% 
  group_by(member_casual,month) %>% 
  summarize(number_of_rides=n()
            ,average_duration=mean(ride_length)) %>% 
  arrange(member_casual,month) %>% 
  ggplot(aes(x=month, y=number_of_rides, fill=member_casual))+
  geom_col(position = "dodge")

# A visualization comparing the average ride distance between casual riders and members.
# Casual riders consistently ride for much longer rides, regardless of the time of year!

all_trips_v4 %>% 
  group_by(member_casual,month) %>% 
  summarize(number_of_rides=n()
            ,average_duration=mean(ride_length)) %>% 
  arrange(member_casual,month) %>% 
  ggplot(aes(x=month, y=average_duration, fill=member_casual))+
  geom_col(position = "dodge")
