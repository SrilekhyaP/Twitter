data <- read.csv("demonetization-tweets.csv")
data
h1 <- head(data,n=100)
sp1<-strsplit(as.character(h1$created)," ",fixed = TRUE)#to remove by space
sp1
Time <- unlist(sp1,recursive=FALSE,use.names=TRUE)#a list of vectors are converted to single vector
Time
y <- Time[seq(2,100,2)]#fetching even indices position
y
tb = table(Time)#representing in table format
tb
s <- data.frame(tb)#converting table to dataframe
names(s)
library(ggplot2)
qplot(Time,Freq,data=s,col="red", size = 8)#plot
