library(stringr)
s.df <- read.csv("tweet3.csv")
positive = readLines("pos.txt")#reading positive words text file
negative = readLines("neg.txt")#reading negative words text file 
negative
positive
res = c()
for(text in s.df[,2]) {
  words = str_split(text,'\\s+')#splitting text in data
  words = unlist(words)#converting to single vector
  pos.matches = match(words, positive)#matching words in positive
  neg.matches = match(words, negative)#matching words in negative
  pos.matches = !is.na(pos.matches)
  neg.matches = !is.na(neg.matches)
  score = sum(pos.matches) - sum(neg.matches)#calculating score
  print(score)
  res = c(res, score)
}
res
table(res)
s.df$scores = res
names(s.df)
?is.na
write.csv(s.df, "tweet3.csv")
qplot(s.df$scores,col="sky blue",xlab = "scores", aes(x = scores,fill = text))
mean(res)
median(res)
hist(res,col="blue",density = 10,main = "Scores of positive and negative tweets")
hist(res, col = ifelse(res < 0,"green",ifelse(res > 0,"blue","red")))
d = head(res,n = 50)
d
barplot(d, ylab = "score of each tweet", main = "PositiveTweets&Negative tweets")
