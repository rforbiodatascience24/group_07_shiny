
# Load needed libraries
library("shiny")
library("bslib")

ui <- fluidPage(
  titlePanel("Virtual Central Dogma Simulator"),

  sidebarLayout(
    sidebarPanel(
      h3("DNA Sequence Generation"),
      sliderInput("n_bases", "Number of Bases:", min = 3, max = 300, value = 30, step = 3),
      numericInput("prob_A", "Probability of A", value = 0.25, min = 0, max = 1, step = 0.01),
      numericInput("prob_T", "Probability of T", value = 0.25, min = 0, max = 1, step = 0.01),
      numericInput("prob_C", "Probability of C", value = 0.25, min = 0, max = 1, step = 0.01),
      numericInput("prob_G", "Probability of G", value = 0.25, min = 0, max = 1, step = 0.01),
      actionButton("generate_dna", "Generate DNA Sequence")
    ),

    mainPanel(
      h3("DNA Sequence Output"),
      verbatimTextOutput("dna_output"),

      h3("RNA Transcription"),
      verbatimTextOutput("rna_output"),

      h3("Protein Translation"),
      verbatimTextOutput("protein_output"),

      h3("Base Frequency Plot"),
      plotOutput("base_freq_plot")
    )
  )
)
