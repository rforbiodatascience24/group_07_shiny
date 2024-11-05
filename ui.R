ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("Describe what your app does...")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
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
      ))),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Output"),
      mainPanel(
        h6("DNA sequence"),
        verbatimTextOutput(outputId = "dna"),
        h6("RNA sequence"),
        verbatimTextOutput(outputId = "rna"),
        h6("Codons"),
        verbatimTextOutput(outputId = "codons"),
        h6("Amino Acids"),
        verbatimTextOutput(outputId = "aa"),
        h6("Amino Acid Frequency"),
        plotOutput(outputId = "aa_frequency")
      )
    ))
)
