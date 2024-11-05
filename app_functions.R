# Define the "Virtual Gene"-function
gene_dna <- function(length, frq_a, frq_t, frq_c, frq_g) {
  if (length %% 3 != 0) {
    stop("The argument to the parameter 'length' has to be divisible by 3")
  }
  base_probs = c(frq_a, frq_t, frq_c, frq_g)
  if (sum(base_probs) != 1) {
    stop("The sum of the frequencies should be one")
  }
  dna_vector <- sample(
    x = c("A", "T", "C", "G"),
    size = length,
    replace = TRUE,
    prob = base_probs)
  dna_string <- paste0(dna_vector, collapse = "")
  return(dna_string)
}

# Virtual RNA polymerase
transcribe_dna <- function(dna) {
  rna <- gsub(pattern = "T", replacement = "U", x = dna)
  return(rna)
}

# Virtual Ribosome
translate_rna <- function(rna) {
  if (is.null(rna) || rna == "") { return("") }
  l <- nchar(x = rna)
  firsts <- seq(from = 1, to = l, by = 3)
  lasts <- seq(from = 3, to = l, by = 3)
  codons <- substring(text = rna, first = firsts, last = lasts)
  
  codon_table <- c(
    "UUU" = "F", "UCU" = "S", "UAU" = "Y", "UGU" = "C",
    "UUC" = "F", "UCC" = "S", "UAC" = "Y", "UGC" = "C",
    "UUA" = "L", "UCA" = "S", "UAA" = "_", "UGA" = "_",
    "UUG" = "L", "UCG" = "S", "UAG" = "_", "UGG" = "W",
    "CUU" = "L", "CCU" = "P", "CAU" = "H", "CGU" = "R",
    "CUC" = "L", "CCC" = "P", "CAC" = "H", "CGC" = "R",
    "CUA" = "L", "CCA" = "P", "CAA" = "Q", "CGA" = "R",
    "CUG" = "L", "CCG" = "P", "CAG" = "Q", "CGG" = "R",
    "AUU" = "I", "ACU" = "T", "AAU" = "N", "AGU" = "S",
    "AUC" = "I", "ACC" = "T", "AAC" = "N", "AGC" = "S",
    "AUA" = "I", "ACA" = "T", "AAA" = "K", "AGA" = "R",
    "AUG" = "M", "ACG" = "T", "AAG" = "K", "AGG" = "R",
    "GUU" = "V", "GCU" = "A", "GAU" = "D", "GGU" = "G",
    "GUC" = "V", "GCC" = "A", "GAC" = "D", "GGC" = "G",
    "GUA" = "V", "GCA" = "A", "GAA" = "E", "GGA" = "G",
    "GUG" = "V", "GCG" = "A", "GAG" = "E", "GGG" = "G")
  
  aa <- paste0(codon_table[codons], collapse = "")
  return(aa)  # Change to return 'aa'
}

# Plot base count
aa_occurrence <- function(aa) {
  if (aa == "") return(NULL)  # Handle case where aa is empty
  counts <- table(strsplit(aa, split = "")[[1]])
  counts_df <- as.data.frame(counts)
  colnames(counts_df) <- c("Amino_Acid", "Counts")
  
  # Create the bar plot
  barplot(counts_df$Counts, 
          names.arg = counts_df$Amino_Acid, 
          col = counts_df$Amino_Acid, 
          xlab = "Amino Acid", 
          ylab = "Counts", 
          main = "Amino Acid Occurrences",
          border = NA)
}
