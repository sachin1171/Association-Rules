######################### problem 1 ###############################
install.packages("arules")
library(arules)
install.packages("readr")
library(readr)
install.packages("readxl")
library(readxl)

my_data = read.csv("C:/Users/usach/Desktop/Associative Rules/book.csv", colClasses = "factor")
View(my_data)
is.na(my_data)
sum(is.na(my_data))
summary(my_data)
class(my_data)
# making rules using apriori algorithm 
# Keep changing support and confidence values to obtain different rules

arules <- apriori(my_data , parameter = list(support=0.7,confidence=0.07 , minlen = 2))
arules                  

# Viewing rules based on lift value
inspect(head(sort(arules,by = "lift")))

# Overal quality 
head(quality(arules))

install.packages("arulesViz")
library(arulesViz)

windows()
plot(arules,method = "grouped")

windows()
plot(arules,method = "grouped")

windows()
plot(arules,method = "graph")

write(arules,file = 'book_arules',sep=',')
getwd()


################################# problem2 ###############################

install.packages("arules")
library(arules)
library(readr)
library(readxl)

df <- read.csv("C:/Users/usach/Desktop/Associative Rules/groceries.csv" , colClasses = "factor")
View(df)
is.na(df)
sum(is.na(df))
summary(df)
class(df)
# making rules using apriori algorithm 
# Keep changing support and confidence values to obtain different rules
arules_gros <- apriori(df,parameter = list(support = 0.02 , confidence = 0.07 , minlen = 2))
arules_gros

# Viewing rules based on lift value
inspect(arules_gros)

inspect(head(sort(arules_gros , by = "lift")))

# Overal quality 
head(quality(arules_gros))

install.packages("arulesviz")
library(arulesViz)

plot(arules_gros,jitter = 0)

windows()
plot(arules_gros, method = "grouped")

windows()
plot(arules_gros,method = "graph")

write(arules_gros, file = "groceries_data",sep = ",")
getwd()

########################## problem3 ##############################################
#The Entertainment Company, which is a startup online movie watching platform,
#wants to improvise its collection of movies and showcase those that are highly
#rated, and recommend those movies to its customer by their movie watching footprints.
#For this the company has collected its data and shared it with you to provide some analytical insights and also to come up with a Recommendation Algorithm so that it can automate its process for effective recommendations based on Users Interest and behavior 
install.packages("arules")
library(arules)
library(readr)
library(readxl)

data_frame <- read.csv("C:/Users/usach/Desktop/Associative Rules/my_movies.csv",colClasses = "factor")
is.na(data_frame)
sum(is.na(data_frame))
summary(data_frame)
class(data_frame)

movies_arules <- apriori(data_frame , parameter = list(support = 0.8, confidence = 0.05, minlen = 2))
movies_arules

inspect(movies_arules)
inspect(head(sort(movies_arules,by="lift")))

install.packages("arulesviz")
library(arulesViz)

plot(movies_arules, jitter = 0)

windows()
plot(movies_arules,method = "grouped")

windows()
plot(movies_arules,method = "graph")

write(movies_arules,file = "movies_arules", sep=",")
getwd()


################################# problems4 ####################################

install.packages("arules")
library(arules)
library(readr)
library(readxl)

my_phdata <- read.csv("C:/Users/usach/Desktop/Associative Rules/myphonedata.csv",colClasses = "factor")
is.na(my_phdata)
sum(is.na(my_phdata))
summary(my_phdata)
class(my_phdata)

arules_phdata <- apriori(my_phdata, parameter = list(support = 0.5 , confidence = 0.06 , minlen = 2 ))
arules_phdata

inspect(arules_phdata)
inspect(head(sort(arules_phdata, by = "lift")))

install.packages("arulesviz")
library(arulesViz)

plot(arules_phdata,jitter = 0)

windows()
plot(arules_phdata,method = "grouped")

windows()
plot(arules_phdata,method = "graph")

write(arules_phdata,file = "my_phdata",sep=",")
getwd()

########################### problem5 ###############################

install.packages("arules")
library(arules)
library(readr)
library(readxl)

df_transaction <- read.csv("C:/Users/usach/Desktop/Associative Rules/transactions_retail1.csv")
is.na(df_transaction)
sum(is.na(df_transaction))

summary(df_transaction)
length(df_transaction)
dim(df_transaction)
sum(is.na(df_transaction))
class(df_transaction)

df_transaction[is.na(df_transaction)] <- " "
sum(is.na(df_transaction))

dup <- duplicated(df_transaction)
sum(dup)
df_transaction <- df_transaction[!dup,]

colnames<-(names(df_transaction))
df_transaction[,colnames] <- lapply(df_transaction[,colnames] , factor)



arules_trans <- apriori(df_transaction,parameter = list(support = 0.02, confidence = 0.8 , minlen = 2))
arules_trans

inspect(arules_trans)
inspect(head(sort(arules_trans,by="lift")))

head(quality(arules_trans))

install.packages("arulesviz")
library(arulesViz)

plot(arules_trans,jitter = 0)

windows()
plot(arules_trans, method = "grouped")

windows()
plot(arules_trans,method = "graph")

write(arules_trans,file = "transaction_data",sep = ",")
getwd()
