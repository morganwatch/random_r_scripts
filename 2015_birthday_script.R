
Why I love my birthday more every year: 

Happy_Birthdays <- matrix(c(10, 14, 28, 34, 47), ncol=5, byrow=TRUE)
colnames(Happy_Birthdays)<-c(2011, 2012, 2013, 2014, 2015)
rownames(Happy_Birthdays)<-c("How Many?")
bp <- barplot(Happy_Birthdays, col="blue", xlab = "Year", ylab = "People", ylim = c(0,50), main = "People Wishing Me Happy Birthday")

# Adds a box around the plot
box()

# puts numbers on each year.
text(x=bp, y=Happy_Birthdays, labels=round(Happy_Birthdays,0), pos=3, xpd=NA)
