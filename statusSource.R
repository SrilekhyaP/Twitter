data <- read.csv("demonetization-tweets.csv")
x <- data$statusSource
p <- grep("Twitter Web Client",x)#indexing out TwitterWebclient
q <- grep("Android",x)#indexing out android
r <- grep("CPIMBadli",x)#indexing out CwebPIMBadli
s <- grep("Web Client",x)#indexing out WebClient
t = grep("Mobile Web",x)#indexing out mobileWeb
u = grep("iPhone",x)#indexing out iphone
par(mfrow=c(1,1))
vec1 = c(length(p),length(q),length(r),length(s),length(t),length(u))
vec2 = c("Twitter Web Client","Android","CPIMBadli","Web Client","Mobile Web","iPhone")
qplot(vec2,vec1,size = 10, col = "statusSource", xlab = "Device Users", ylab = "Frequency of tweets", main = "Device source vs. no. of tweets")
