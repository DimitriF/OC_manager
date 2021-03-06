
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinydashboard)
library(shinyBS)
library(shinyalert)
dbHeader <- dashboardHeader(title = "OC_manager")
# dbHeader$children[[2]]$children <-  tags$a(href='http://oc-lab.com',
#                                            tags$img(src='www/OCLAB-logo-pattern-alb.png',height='60',width='200'))


dashboardPage(
  dbHeader,
  dashboardSidebar(
    sidebarMenu(
                menuItem("Connection", tabName = "Connect",icon=icon("home")),
                menuItem("Method", tabName = "Method",icon=icon("tasks")),
                menuItem("Fine control", tabName = "test_ink",icon=icon("wrench")),
                menuItem("Visualization",tabName = "Visu",icon=icon("camera")),
                menuItem("TLC-MS",tabName = "TLC_MS",icon=icon("spoon")),
                menuItem("Log",tabName = "Log",icon=icon("newspaper-o")),
                menuItem("Report",tabName = "Report",icon=icon("print")),
                menuItem("About",tabName = "About",icon=icon("info"))
    )
  ),
  
  dashboardBody(
    tags$script(HTML("$('body').addClass('sidebar-mini');")),
    tabItems(
      tabItem(
        tags$head(tags$style(type="text/css", "tfoot {display: table-header-group}")),
        tags$head(tags$style(type="text/css", "tfoot {display: table-header-group}")),
        tags$head(tags$style(HTML(".shiny-output-error-validation {color: red;font-size: 24px}"))),
        tags$head(tags$style(type="text/css", ".shiny-progress .progress {position: absolute;width: 100%;top: 100px;height: 10px;margin: 0px;}")),
        tags$head(tags$style(type="text/css", ".shiny-progress .progress-text {position: absolute;border-style: solid;
                                     border-width: 2px;right: 10px;height: 36px;width: 50%;background-color: #EEF8FF;margin: 0px;padding: 2px 3px;opacity: 1;}"))
      ),
      # First tab content
      tabItem(tabName = "Connect",
              column(4,
                     h4("Login"),
                     uiOutput("Login"),
                     textInput("Plate","Plate info: project, id or whatever","test"),
                     useShinyalert()
              ),
              column(4,
                     h4("Board"),
                     actionButton("Serial_port_refresh","Refresh serial port",icon=icon("refresh")),
                     checkboxInput("Serial_windows","Windows ??",F),
                     uiOutput("Serial_portUI"), # show the /dev directory
                     uiOutput("Serial_port_connectUI") # show an actionButton only if connect$login is TRUE and set connect$board to TRUE
              ),
              actionButton("Shutdown","Shutdown"),
              actionButton("Reboot","Reboot")#,
              
              ),
      # First tab content
      tabItem(tabName = "test_ink",
              uiOutput("ink_test_control_1")
      ),
      tabItem(tabName = "Method",
              uiOutput("Method_control_1")
              
      ),

      tabItem(tabName = "Visu",
              uiOutput("Visu_control_1")
      ),
      tabItem(tabName = "TLC_MS",
              uiOutput("TLC_MS_control_1")
      ),

      tabItem(tabName = "Log",
              actionButton("Log_refresh","refresh"),
              dataTableOutput("Log")
      ),
      tabItem("Report",
              p("incoming")
      ),
      tabItem("About",
              includeMarkdown("README.md")
      )
    )
  )
)