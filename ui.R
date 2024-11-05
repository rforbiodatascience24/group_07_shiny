# User Interface
ui <- fluidPage(
  titlePanel("Virtual Central Dogma"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 1,
                  max = 60,
                  value = 30),
      numericInput(inputId = "frq_a",
                   label = "Frequency of A:",
                   min = 0,
                   max = 1,
                   value = 0.25),
      numericInput(inputId = "frq_t",
                   label = "Frequency of T:",
                   min = 0,
                   max = 1,
                   value = 0.25),
      numericInput(inputId = "frq_c",
                   label = "Frequency of C:",
                   min = 0,
                   max = 1,
                   value = 0.25),
      numericInput(inputId = "frq_g",
                   label = "Frequency of G:",
                   min = 0,
                   max = 1,
                   value = 0.25)
    ),
    mainPanel(
      h6("DNA sequence"),
      verbatimTextOutput(outputId = "dna"),
      h6("RNA sequence"),
      verbatimTextOutput(outputId = "rna"),
      h6("Amino Acid Sequence"),
      verbatimTextOutput(outputId = "aa"),
      plotOutput(outputId = "aa_frequency")
    )
  )
)
