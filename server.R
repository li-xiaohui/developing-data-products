# app2
 library(mlbench)
 library(caret)
 library(dplyr)
 library(ggplot2)
 data("PimaIndiansDiabetes")


shinyServer(
function(input, output) {
  
	output$plot2 <- renderPlot({
	  inputAge <- input$inputAge
	  counts <- PimaIndiansDiabetes %>%
	                filter(age < inputAge) %>%
	                group_by(diabetes, age) %>%
	                summarise(count=n())
	  
	  
	  ggplot(counts, aes(x= age, y=count, fill=diabetes)) + geom_bar(stat="identity", position=position_dodge()) +
	    xlab("Age") + ylab("Count")
	    
	  
	  # , counts, type='l' , xlab='age', col='blue', main='Pos Cases by Age')
	  
	})
	
	output$pregPlot <- renderPlot({
	  preg <- input$preg
	  pregCounts <- PimaIndiansDiabetes %>%
	    filter(pregnant < preg) %>%
	    group_by(diabetes, pregnant) %>%
	    summarise(count=n())

	  ggplot(pregCounts, aes(x=pregnant, y=count, fill=diabetes)) + geom_bar(stat="identity", position=position_dodge())+
	  xlab("Number of times pregnant") + ylab("Count")
	})
	  
})
