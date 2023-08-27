library(fmsb)
library(ggplot2)

data <- read.csv("/mnt/c/Users/svcsc/Desktop/MasterStudium/Semester1/phonetic research/report/Chatbot_Stat - Overall_Eval.csv")
data[complete.cases(data), ]
summary(data)
data_part <- data[c("Conversation.Tag","Quantity", "Quality", "Manner", "Language.Variation","Relation", "Ease.of.understanding")]

data_part2 <- data[c("Conversation.Tag","Total.score.with.top.three.conversations")]
View(data_part2)

bored <- data_part2[1:12, ]
#rownames(bored) <- bored$Conversation.Tag
#bored <- subset(bored, select = -Conversation.Tag)

confused <- data_part2[14:26, ]
#rownames(confused) <- confused$Conversation.Tag
#onfused <- subset(confused, select = -Conversation.Tag)

scared <- data_part2[28:39, ]
#rownames(scared) <- scared$Conversation.Tag
#scared <- subset(scared, select = -Conversation.Tag)

joined <- merge(x = bored, y = confused, by.x = "Conversation.Tag", by.y = "Conversation.Tag")
joined <- merge(x = joined, y = scared, by.x = "Conversation.Tag", by.y = "Conversation.Tag")


#rownames(joined) <- joined$Conversation.Tag
#joined <- subset(joined, select = -Conversation.Tag)
#summary(joined)

names(joined) <- c("plot", "bored", "confused", "scared")
View(joined)

factor(joined$plot)
barplot(joined)


# x-axis values
x <- c("A", "B", "C", "D")

# y-axis values
y <- c(2, 4, 6, 8)

barplot(y, names.arg = x) 