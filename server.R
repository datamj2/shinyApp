library(shiny)
shinyServer(function(input,  output) {
        # if (input2==NULL) {
        m1<- reactive({
                pred1<-input$Pred1
                lm(RTEN ~ pred1, data = USJudgeRatings)
        })
        
        model1pred <- reactive({
                ndata <- input$sliderPred1
                predict(model1, newdata = data.frame(CONT = ndata))
        })

        output$plot1 <- renderPlot({
                ndata <- input$sliderPred1
                if (input$Pred1=="CONT"){
                        col<-1
                        labx<-"number of attorney contacts with judge"
                        clr<-"gray"
                        m1<-lm(RTEN ~ CONT, data = USJudgeRatings)
                        pr1<-predict(m1, newdata = data.frame(CONT = ndata))
                }
                if (input$Pred1=="INTG"){
                        col<-2
                        labx<-"rating: Judicial integrity"
                        clr<-"blue"
                        m1<-lm(RTEN ~ INTG, data = USJudgeRatings)
                        pr1<-predict(m1, newdata = data.frame(INTG = ndata))
                        }
                if (input$Pred1=="FAMI"){
                        col<-8
                        labx="rating: judge's familiarity with law"
                        clr<-"green"
                        m1<-lm(RTEN ~ FAMI, data = USJudgeRatings)
                        pr1<-predict(m1, newdata = data.frame(FAMI = ndata))
                }

                plot(USJudgeRatings[,col], USJudgeRatings$RTEN, xlab = labx, 
                     ylab = "rating: worthy of retention",  pch = 16, col=clr,xlim = c(5.5, 10.5), ylim = c(4, 11),cex=1) 
                if(input$showModel1){
                abline(m1,col=clr,lwd=2,cex=1)
                legend(9.0,5.6,c("data","predictor value","Model"),pch=c(16,16,NA),lty=c(NA,NA,1),lwd=c(NA,NA,2),col=c(clr,"black",clr))
                } else legend(9.0,5.6,c("data","predictor value"),pch=c(16,16),lty=c(NA,NA),lwd=c(NA,NA),col=c(clr,"black"))
                points(ndata, pr1, col = "black", pch = 16, cex=2)
        })
        
        output$pred1 <- renderText({
                ndata <- input$sliderPred1
                if (input$Pred1=="CONT"){
                        col<-1
                        labx<-"number of attorney contacts with judge"
                        clr<-"gray"
                        m1<-lm(RTEN ~ CONT, data = USJudgeRatings)
                        pr1<-predict(m1, newdata = data.frame(CONT = ndata))
                }
                if (input$Pred1=="INTG"){
                        col<-2
                        labx<-"rating: Judicial integrity"
                        clr<-"blue"
                        m1<-lm(RTEN ~ INTG, data = USJudgeRatings)
                        pr1<-predict(m1, newdata = data.frame(INTG = ndata))
                }
                if (input$Pred1=="FAMI"){
                        col<-8
                        labx="rating: judge's familiarity with law"
                        clr<-"green"
                        m1<-lm(RTEN ~ FAMI, data = USJudgeRatings)
                        pr1<-predict(m1, newdata = data.frame(FAMI = ndata))
                }
               round(pr1,1)
        })
        
        # output$pred2 <- renderText({
        #         model2pred()
        # })
})


