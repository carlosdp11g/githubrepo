library(shiny)

calculo <- function(fechas, fines) {
  if(fines)
    fechas[2] - fechas[1]
  else {
    wd <- weekdays(seq(fechas[1], fechas[2], by = "days"))
    entresemana <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "lunes", "martes", "miércoles", "jueves", "viernes")
    paste("Time difference of ", length(wd[wd %in% entresemana]), " days.")
  }
}

shinyServer(
  function(input, output) {
    output$outputiempo <- renderPrint({calculo(input$fechas, input$fines)})
  }
  
)