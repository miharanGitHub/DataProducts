# Function which generates two random variables with 
# pre-defined correlation
# x - input random vector
# r - correlation
# y - generated random vector 

correlatedValue = function(x, r){
        r2 = r**2
        ve = 1-r2
        SD = sqrt(ve)
        e  = rnorm(length(x), mean=0, sd=SD)
        y  = r*x + e
        return(y)
}


shinyServer(function(input, output) {                
        
        # If button pushed the function generated two new random vectors
        # with defined correlation
        set<-reactive({
                input$goButton
                x = rnorm(isolate(input$n))
                y = correlatedValue(x=x, r=isolate(input$r))                
                cbind(x,y)                
        })
        
        # Create scatter plot with two random variables
        output$scatterPlot <- renderPlot({
                dataset<-set()        
                plot(dataset[,1], dataset[,2], xlab="X", ylab="Y")
        })
        
        # Calculate correlation between random vectors 
        output$nText <- renderText({
                dataset<-set()        
                correlation<-cor(dataset[,1], dataset[,2])
                correlation
        })
        
        
})