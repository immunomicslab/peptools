## code to prepare `PEPTIDES` dataset goes here

# Create 1,000,000 random 9-mer peptides
set.seed(459196)
PEPTIDES <- peptools::pep_ran(n = 1e6, k = 9)

# Write to temporary directory
tmpdir <- "data/tmp/"
dir.create(path = tmpdir)
tmp_pep_file <- "PEPTIDES.txt"
write.table(x = PEPTIDES,
            file = paste0(tmpdir, tmp_pep_file),
            quote = FALSE, row.names = FALSE, col.names = FALSE)

# Setup netMHCpan for prediction runs and check for intel or Mx architecture
exe_binary <- "/your/absolute/path/goes/here/netMHCpan"
if( system("arch", intern = TRUE) == "arm64" ){
  exe_binary <- paste0("arch -x86_64 ", exe_binary)
}
output_file <- paste0(tmpdir, "output.tsv")
args <- paste0(" -p -xls -f ", tmpdir, tmp_pep_file,
               " -xlsfile ", output_file, " -a ")

# Define alleles for prediction HLA class I A and B representative supertypes
alleles <- paste0("HLA-", c("A01:01", "A02:01", "A03:01",
                            "B07:02", "B08:01", "B27:05"))

# Run predictions
PEPTIDEPREDS <- data.frame(row.names = PEPTIDES)
for( allele in alleles ){
  cmd <- paste0(exe_binary, args, allele)
  cat("Now running: ", cmd, "\n")
  tmp <- system(cmd, intern = TRUE)
  PEPTIDEPREDS[[allele]] <- read.table(
    file = paste0(tmpdir, "output.tsv"), skip = 2)[,7]
  unlink(output_file)
  Sys.sleep(2)
}
unlink(x = tmpdir, recursive = TRUE)

# Convert to classes, such that
# Rank Threshold for Strong binding peptides 0.500 => 0
# Rank Threshold for Weak binding peptides 2.000 => 1
# Above => 2
PEPTIDEPREDS <- apply(
  X = PEPTIDEPREDS,
  MARGIN = 2,
  FUN = function(x_j){
    ifelse(x_j <= 0.5, 0, ifelse(x_j <= 2, 1, 2)) })

# Remove any rows, where peptide has been predicted to not bind at all
# 6 alleles, and no binding is class 2, so 6x2 = 12
PEPTIDEPREDS <- PEPTIDEPREDS[rowSums(PEPTIDEPREDS)<12,]

# Then remove any rows, where the peptide binds more than one allele
keep <- apply(
  X = PEPTIDEPREDS,
  MARGIN = 1,
  FUN = function(x_i){
    return( ifelse( sum(x_i == 2) == 5, TRUE, FALSE) ) })
PEPTIDES <- PEPTIDEPREDS[keep,]

# Data creation completed, setup for usage
usethis::use_data(PEPTIDES, overwrite = TRUE)
