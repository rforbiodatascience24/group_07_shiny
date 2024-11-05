# Load needed libraries
library("shiny")
library("bslib")
library("ggplot2")
library("stringr")

# Load needed functions
source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  # Reactive expression to generate DNA sequence
  dna_string <- reactive({
    req(input$n_bases, input$frq_a, input$frq_t, input$frq_c, input$frq_g)
    gene_dna(length = input$n_bases,
             frq_a = input$frq_a,
             frq_t = input$frq_t,
             frq_c = input$frq_c,
             frq_g = input$frq_g)
  })
  
  # Reactive expression to transcribe DNA to RNA
  rna_string <- reactive({
    req(dna_string())
    transcribe_dna(dna = dna_string())
  })
  
  # Reactive expression to translate RNA to amino acids
  aa_string <- reactive({
    req(rna_string())
    translate_rna(rna = rna_string())
  })
  
  # Output the generated DNA sequence
  output$dna <- renderText({
    dna_string()
  })
  
  # Output the transcribed RNA sequence
  output$rna <- renderText({
    rna_string()
  })
  
  # Output the translated amino acids
  output$aa <- renderText({
    aa_string()
  })
  
  # Output the amino acid frequency plot
  output$aa_frequency <- renderPlot({
    aa_occurrence(aa = aa_string())
  })
}
