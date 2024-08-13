# Make sure to install PDF Toolkit before running this script!

# Define a path for convenience's sake
# dir.create("pdf_files")
output_path <- file.path("pdf_files", "output.pdf")

# Render the unprotected pdf
rmarkdown::render('input_pdftk.Rmd', output_file = output_path) 

# Define a password
password <- "password"

# Define a path for protected files. Use the same path as before to overwrite
protected_output_path <- file.path("pdf_files", "protected_output.pdf")

# Write the password-protected PDF 
system2("pdftk", args = c(output_path, "output", protected_output_path, "user_pw", password))


# If you're going to loop the rendering to create password-protected personal files
# you're going to need to remove all temporary files
file_name <- "output"
file.remove(paste0(file_name, c(".log", ".tex", ".md")))