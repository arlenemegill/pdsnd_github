
setwd("~/Clase de R Udacity/R_project/")

ny = read.csv('new-york-city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

#create null columns for Gender and Birthday in the Washington dataset#
#this is to be able to join all datasets later#
wash$Gender <- NA
wash$Birth.Year <- NA

#did it work#
head(wash)

#add a new column to each dataset for City name
ny$City <- 'New York City'
head(ny)

chi$City <- 'Chicago'
head(chi)

wash$City <- 'Washington'
head(wash)

#Creating a function to concatenate Multiple Strings
concatenation <- function(d1, d2) {
  return(rbind(d1, d2))
}

# joining all three datasets together as "city"
city <- rbind(ny, wash)
city <- rbind(city, chi)

head(city)

#Count of users in the City dataset
total_users = sort(table(city$City))
print(total_users)

# calculate the percentage of users in City
round((total_users / sum(total_users) * 100), digits = 2)

#visualization

library(ggplot2)

ggplot(aes(x = City, y = Trip.Duration), data = city) +
  geom_bar(position = 'dodge', stat = "summary", width = 0.2, fun.y = "mean", fill= "deepskyblue4", colour="black") +
  ggtitle('The average travel time for users in different cities') +
  labs(y = 'Average Trip Duration', x = 'City') 


#table results

results <- with(city, aggregate(list(Trip.Duration), by = list(City), 
                                   FUN = function(x) { mon.mean = mean(x, na.rm = TRUE) } ))

colnames(results) <- c('City', 'Average.Trip.Duration')

results

# Count of User Types (Subscriber and Customer)

total = sort(table(city$User.Type))
print(total)

# percentage of User Types (Subscriber and Customer)
percentage = round((total / length(city$User.Type) * 100), digits = 2)
print (percentage)

#by city
user_by_city = by(city$User.Type, city$City, summary)
print(user_by_city)

#eliminate data
unique(city$User.Type)

#Eliminate blank data

city2 <- city[!(city$User.Type == ""), ]

library(ggplot2)

ggplot(data = city2) +
  geom_bar(mapping = aes(x=City, fill= User.Type), position = "dodge", colour="black") +
  ggtitle("Type of Subscribers per City")

library (lubridate)

# Format date columns to extrac day information
city$Start.Time <- ymd_hms(city$Start.Time)
city$End.Time <- ymd_hms(city$End.Time)

#create a new column for day of the week
city$month <- format (as.Date(city$Start.Time), "%B")
head(city)

#count per month
count = by(city$month, city$City, summary)
head(count)

#eliminate that na in month on Washigton

city = subset (city, !is.na (month))

library(ggplot2)

# Visualization
ggplot(data = city) +
  geom_bar(mapping = aes(x=month, fill= City), position = "dodge", colour="black") +
  ggtitle("Number of rides per Month")

system('python -m nbconvert Explore_bikeshare_data.ipynb')
