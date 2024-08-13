# Make sure to install PDF Toolkit (pdftk) before running this script!

# Define a path for convenience
# dir.create("pdf_files")
output_path <- file.path("pdf_files", "output.pdf")

# Render the unprotected PDF
rmarkdown::render('input_pdftk.Rmd', output_file = output_path) 

# Define a password
password <- "password"

# Define a path for the protected file. Use the same path as before to overwrite
protected_output_path <- file.path("pdf_files", "protected_output.pdf")

# Create the password-protected PDF 
system2("pdftk", args = c(output_path, "output", protected_output_path, "user_pw", password))


# If you're going to loop the rendering to create password-protected personal files
# you'll need to remove all temporary files
file_name <- "output"
file.remove(paste0(file_name, c(".log", ".tex", ".md")))
