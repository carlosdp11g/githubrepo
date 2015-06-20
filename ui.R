library(shiny)
shinyUI (
  pageWithSidebar(
    headerPanel("How many days until..."),
    sidebarPanel(
      h2('Choose the dates'),
      p('If you\'ve ever wondered how many days are left until your 
        birthday, an anniversary, or a special date, you can use this 
        application to find that out! Simply select blablablablabla'),
      hr(),
      dateRangeInput("fechas", "Click on the date"),
      checkboxInput("fines", "Include weekends", value = FALSE)
    ),
    
    mainPanel(
      h3('Result'),
      p("The amount of days left is:"),
      verbatimTextOutput("outputiempo"),
      hr(),
      h4('How it works?'),
      p('The server reads the dates that are inputted through the dateRangeInput object.
        Then, they\'re analyzed by this chunk of code:'),
      code(
        'calculo <- function(fechas, fines) {
          if(fines)
            fechas[2] - fechas[1]
                   else {
                   wd <- weekdays(seq(fechas[1], fechas[2], by = "days"))
                   entresemana <- c("monday", "tuesday", "wednesday", "thursday", "friday", "lunes", "martes", "miércoles", "jueves", "viernes")
                   paste("Time difference of ", length(wd[wd %in% entresemana]), " days.")
                   }
                   }'
      ),
      p('It\'s basically an if asking if weekends will be counted, and counting the weekdays. Works in English and Spanish.')
    )
  )
)