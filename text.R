data = read.csv("tweets.csv")
dt = gsub("(RT | via)((?:\\b\\W*@\\w+)+:+)", " ",data$text)#removes pattern RT
dt = gsub("[[:punct:]]", " ",dt)#removes patterns having punctuation
dt = gsub("http.*", "", (dt))#removes patterns with http
dt = gsub("[\t]{2,}","", dt)#removes white spaces
dt = gsub("^\\s+|\\s+$", "",dt)#removes $symbols
dt = gsub("[[:digit:]]", "",dt)#removes digits
library(wordcloud)
library(tm)
myCorpus <- Corpus(VectorSource(dt)) #Function
myCorpus <- tm_map(myCorpus,tolower)
myCorpus <- tm_map(myCorpus,stripWhitespace)
myCorpus <- tm_map(myCorpus,removePunctuation)

myCorpus <- tm_map(myCorpus,removeWords,stopWords("english"))
myCorpus <- tm_map(myCorpus,removeNumbers)

#inspect(myCorpus)
myCorpus <- tm_map(myCorpus, PlainTextDocument)
wordcloud(myCorpus, max.words = 70, random.order = F,col = pal, scale =c(3,1),min.freq = 20)#wordcloud function
vec = TermDocumentMatrix(myCorpus)#gives word frequency in matrix form
x = as.matrix(vec)
y = sort(rowSums(x),decreasing = TRUE)
df = data.frame(word = names(y),freq = y)
findFreqTerms(vec, lowfreq = 20)
findAssocs(vec,terms = "demonetization", corlimit = 0.3)
head(df,10)
barplot(names.arg = df[1:10,]$word,las = 2,df[1:10,]$freq,col = "pink", main="Most frequent words",ylab ="word Frequency", horiz = TRUE)#plot showing frequent words
      