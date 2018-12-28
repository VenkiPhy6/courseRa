library(tidyr)
# Tidy data is formatted in a standard way that facilitates exploration and analysis and works seamlessly
# with other tidy data tools. Specifically, tidy data satisfies three conditions:
#  
#  1) Each variable forms a column
#  2) Each observation forms a row
#  3) Each type of observational unit forms a table
# 
# ...
# 
# =========                                                                                         |   9%
# Any dataset that doesn't satisfy these conditions is considered 'messy' data. Therefore, all of the
# following are characteristics of messy data. I will call them anamolies:
# 
#   1: Column headers are values, not variable names
#   2: Variables are stored in both rows and columns
#   3: A single observational unit is stored in multiple tables
#   4: Multiple types of observational units are stored in the same table
#   5: Multiple variables are stored in one column

#tidyr::gather----
#Data from swirl exercise. This data is an example of anamoly 1.
students <- data.frame(grade = LETTERS[1:5], male = c(1,5,5,5,7), female = c(5,0,2,5,4))
gather(students, key = sex, value = count, -grade)

#tidyr::separate----
#Data from swirl exercise. This data is an example of anamoly 5.
students2 <- data.frame(grade = LETTERS[1:5], male_1 = c(3,6,7,4,1), female_1 = c(4,4,4,0,1), male_2 = c(3,3,3,8,2), female_2 = c(4,5,8,1,7)) #Both sex and class and stored in the column names
res <- gather(students, key = sex_class, value = count, -grade) #half the battle won
separate(res, sex_class, into = c('sex', 'class')) 
#It separates by default on non alphanumeric characters. Else use sep argument.
#With pipes
students2 %>% 
  gather( sex_class, count, -grade) %>%
  separate( sex_class, c("sex", "class")) %>%
  print

#tidyr::spread----
#Data from swirl exercise. This data is an example of anamoly 2.
#The headers of the last five columns, class1 through class5, are all different values of what should be a class variable. The values in the test column, midterm and final, should each be its own variable containing the respective grades for each student.
students3 <- dget('./data/students3_swirl.R')
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  mutate(class = parse_number(class)) %>% 
  print

#Splitting a table----
#Data from swirl exercise. This data is an example of anamoly 4.
#At first glance, there doesn't seem to be much of a problem with students4. All columns are variables and all rows are observations. However, notice that each id, name, and sex is repeated twice, which seems quite redundant. This is a hint that our data contains multiple observational units in a single table.
students4 <- dget('./data/students4_swirl.R')
#We will now split the table into two
student_info <- students4 %>%
  select(id, name, sex) %>%
  unique %>%
  print
gradebook <- students4 %>%
  select(id, class, midterm, final) %>%
  print

#dplyr::bind_rows ---- 
#Combining two tables
#Datasets from swirl exercise. These datasets are an example of anamoly 3.
passed <- dget('./data/passed_swirl.R')
failed <- dget('./data/failed_swirl.R')
passed <- mutate(passed, status = 'passed')
failed <- mutate(failed, status = 'failed')
bind_rows(passed, failed)
