library(dplyr)
library(readr)
netflix <- read_csv("netflix_titles.csv")

na_counts <- sapply(netflix, function(x) sum(is.na(x)))
print("NA counts per column:")
print(na_counts)


netflix <- netflix %>%
 mutate(title_length = nchar(title))


head(netflix[, c("title", "title_length")])


longest_title <- netflix %>%
 filter(title_length == max(title_length, na.rm = TRUE)) %>%
 select(title, title_length)

print("Longest title and its character count:")
print(longest_title)


avg_title_length <- netflix %>%
 group_by(type) %>%
 summarise(avg_length = round(mean(title_length, na.rm = TRUE), 2))

print("Average title length by content type:")
print(avg_title_length)