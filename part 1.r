###A1)

library(readr)

netflix_data <- read_csv("netflix_titles.csv")
nrow(netflix_data)

### 2
table(netflix_data$type)
prop.table(table(netflix_data$type)) * 100

###3
library(dplyr)

netflix_data %>%
 count(rating, sort = TRUE) %>%
 head(5)

###4
sum(!complete.cases(netflix_data))  # Number of rows with any NA

colSums(is.na(netflix_data))         # Number of NAs per column

###5

length(unique(na.omit(netflix_data$country)))