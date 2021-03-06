####################
# MAINTENANCE FILE #
###############################################################
# This file is designed to hold small scripts associated with #
# internal pacman maintenance tasks.                          #
###############################################################
#========
# BUILD
#========
source("inst/build.R")

#==========================
# Run unit tests
#==========================
devtools::test()

#======================
#staticdocs dev version
#======================
#packages
# devtools::install_github("qdap", "trinker/qdap")
# devtools::install_github("hadley/staticdocs")
# devtools::install_github("trinker/acc.roxygen2")
pacman::p_load(highlight, staticdocs)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
usr <- dirname(path.expand("~"))
build_site(pkg=file.path(usr, "GitHub/pacman"),launch = FALSE)
library(qdap); library(acc.roxygen2)

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "index.html")
usr <- dirname(path.expand("~"))
rdme <- file.path(usr, "GitHub/pacman/inst/extra_statdoc/readme.R")
extras <- qcv(p_del, p_up, p_get, p_cite, p_funs, p_info, p_inter, p_ver, p_vign, 
	p_sa, p_sl, p_lib, p_iscran, p_depends_reverse, "p_isloaded")
expand_statdoc(path2, to.icon = extras, readme = rdme)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Author</h2>", 1)),
    c("Tyler W. Rinker", "Dason Kurkiewicz"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
usr <- dirname(path.expand("~"))
file <- file.path(usr, "GitHub/trinker.github.com")
incoming <- file.path(file, "pacman_dev")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)

#==========================
#staticdocs current version
#==========================
#packages
# library(devtools); install_github("qdap", "trinker"); install_github("staticdocs", "hadley")
# install_github("acc.roxygen2", "trinker")
library(highlight); library(staticdocs)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
usr <- dirname(path.expand("~"))
build_site(pkg=file.path(usr, "GitHub/pacman"),launch = FALSE)
library(qdap); library(acc.roxygen2)

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- file.path(usr, "GitHub/pacman/inst/extra_statdoc/readme.R")
extras <- qcv(p_del, p_up, p_get, p_cite, p_funs, p_info, p_inter, p_ver, p_vign, 
	p_sa, p_sl, p_lib, p_iscran, p_depends_reverse, "p_isloaded")
expand_statdoc(path2, to.icon = extras, readme = rdme)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Author</h2>", 1)),
    c("Tyler W. Rinker", "Dason Kurkiewicz"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- file.path(usr, "GitHub/trinker.github.com")
incoming <- file.path(file, "pacman")
#   delete(incoming); file.copy(path, file, TRUE, TRUE) ; file.rename(file.path(file, "web"), incoming)



#====================================
# NEWS.md - create NEWS.md from NEWS
#====================================
News <- readLines("NEWS")
library(pacman); p_load(qdap)
News <- mgsub(
    c("<", ">", "&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;"), 
    c("&lt;", "&gt;", "<b>&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;</b>"), News)
cat(paste(News, collapse = "\n"), file = "NEWS.md")

#==========================
#Check spelling
#==========================
path <- file.path(getwd(), "R")
txt <- suppressWarnings(lapply(file.path(path, dir(path)), readLines))
txt <- lapply(txt, function(x) x[substring(x, 1, 2) == "#'"])
new <- lapply(1:length(txt), function(i){
    c("\n", dir(path)[i], "=========", txt[[i]])
})
out <- paste(unlist(new), collapse="\n")
cat(out, file=file.path(path.expand("C:/Users/trinker/Desktop"), "spelling.doc"))

#==========================
#Get Examples to run
#==========================
library(pacman)
examples(path = "C:/Users/trinker/GitHub/pacman/R/")

#==========================
# NEWS.md
#==========================
update_news()


#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")


knitr::knit2html("vignettes/Introduction_to_pacman.Rmd", 
    "vignettes/Introduction_to_pacman.html", 
    stylesheet='vignettes/css/style.css'#, options = c('toc')
)


knitr::knit2html("vignettes/pacman_functions_quick_reference.Rmd", 
    "vignettes/pacman_functions_quick_reference.html", 
    stylesheet='vignettes/css/style.css'
)


