tweets <- read.csv("tweets.csv")
tweets$created
p = grep("11/22/2016",tweets$created)#indexing out with this date
p
length(p)
q = grep("11/23/2016",tweets$created)#indexing out with this date
q
length(q)
vec= c(length(p),length(q))#converting to a vector
vec
barplot(vec,names.arg = "22/11/2016                    23/11/2016", col = c("blue","red"),main ="no. of tweets on 22/11 and 23/11",ylab = "frequency of tweets")
