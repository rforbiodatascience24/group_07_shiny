
# Load needed libraries
library("shiny")
library("bslib")

server <- function(input, output) {

  # Generate DNA sequence
  observeEvent(input$generate_dna, {
    dna_seq <- gene_dna(input$n_bases, base_probs = c(input$prob_A, input$prob_T, input$prob_C, input$prob_G))
    output$dna_output <- renderText(dna_seq)

    # Transcribe DNA to RNA
    rna_seq <- transcribe_dna(dna_seq)
    output$rna_output <- renderText(rna_seq)

    # Translate RNA to protein sequence
    protein_seq <- translate_rna(rna_seq)
    output$protein_output <- renderText(protein_seq)

    # Plot base frequencies
    base_freq <- base_freqs(dna_seq)
    output$base_freq_plot <- renderPlot({
      barplot(base_freq$Freq, names.arg = base_freq$dna_vec, col = "skyblue",
              main = "Base Frequency", xlab = "Base", ylab = "Frequency")
    })
  })
}
