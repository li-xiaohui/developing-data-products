
shinyUI(pageWithSidebar(
	headerPanel("Plot PimaIndiansDiabetes"),
  
	sidebarPanel(
  	sliderInput('inputAge', 'Select Age', value = 50, min = 20, max = 70, step = 5),
  	sliderInput('preg', 'Select Number of Pregnants', value = 2, min = 1, max = 17, step = 1)
	),
	
	mainPanel(
	  h3('Aggregated number of positive and negrative cases for each age'), 
  	plotOutput('plot2'),
	  h3('Aggregated number of positive and negrative cases for number of pregnants'), 
	  plotOutput('pregPlot')
	)
	
))
