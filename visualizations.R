library(fmsb)
library(ggplot2)
library(RColorBrewer)
library(scales)
#################################
# preprocessing
#################################
data <- read.csv(".../Chatbot_Stat - Overall_Eval.csv")
data[complete.cases(data), ]
data_part2 <- data[c("Conversation.Tag","Total.score.with.top.three.conversations")]

bored <- data_part2[1:12, ]
confused <- data_part2[14:26, ]
confused <- confused[-8,]
confused[7, "Conversation.Tag"] <- "unisex assistant, with example"
scared <- data_part2[28:39, ]
scared[7, "Conversation.Tag"] <- "unisex assistant, no example"

#################################
# join the information
#################################
joined <- merge(x = bored, y = confused, by.x = "Conversation.Tag", by.y = "Conversation.Tag")
joined <- merge(x = joined, y = scared, by.x = "Conversation.Tag", by.y = "Conversation.Tag")
names(joined) <- c("plot", "bored", "confused", "scared")
View(joined)

#################################
# barplots for scenarios
#################################
jpeg(file="plot_bored.jpeg")
ggplot(joined, aes(y = joined$plot, x = joined$bored)) + geom_col(aes(fill = x))
dev.off()

jpeg(file="plot_confused.jpeg")
ggplot(joined, aes(y = joined$plot, x = joined$confused)) + geom_col(aes(fill = x))
dev.off()

jpeg(file="plot_scared.jpeg")
ggplot(joined, aes(y = joined$plot, x = joined$scared)) + geom_col(aes(fill = x)) 
#################################
# radarchart 1
#################################
joined_spyder <- joined
rownames(joined_spyder) <- joined_spyder$plot
joined_spyder <- subset(joined_spyder, select = -plot)

jpeg(file="radarchat1.jpeg")
radarchart(joined_spyder)
legend(
  x = "bottom", legend = rownames(joined_spyder, ), horiz = TRUE,
  bty = "n", pch = 20 , col = c("#00AFBB", "#E7B800", "#FC4E07"),
  text.col = "black", cex = 1, pt.cex = 1.5
  )
  dev.off()
#################################
# radarchart 2
#################################
data_transpose <- as.data.frame(t(joined_spyder))    
names(data_transpose) <- c("female_ass_noexam", "female_ass_exam", "female_friend_noexam", "female_friend_exam", "male_ass_noexam", "male_ass_exam", "male_friend_noexam", "male_friend_exam", "uni_ass_noexam", "uni_ass_exam", "uni_friend_noexam", "uni_friend_exam")
data_transpose <- data_transpose[complete.cases(data_transpose), ]   
save(data_transpose, file = "total_eval.csv")


jpeg(file="radarchat2.jpeg")
radarchart(data_transpose)
legend(
  x = "bottom", legend = rownames(data_transpose, ), horiz = TRUE,
  bty = "n", pch = 20 , col = c("#00AFBB", "#E7B800", "#FC4E07"),
  text.col = "black", cex = 1, pt.cex = 1.5
  )
  dev.off()
#################################
# radarchart 3
#################################
coul <- brewer.pal(3, "BuPu")
colors_border <- coul
colors_in <- alpha(coul,0.3)

jpeg(file="radarchat3.jpeg")
radarchart( data_transpose , axistype=0 , maxmin=F,
    pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
    cglcol="grey", cglty=1, axislabcol="black", cglwd=0.8, 
    vlcex=0.8 
    )
legend(x=0.7, y=1, legend = rownames(data_transpose), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)
dev.off()
