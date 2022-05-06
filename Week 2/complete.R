## Write a function that reads a directory full of files and reports the number of completely observed cases in each data file.
## The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases.
## A prototype of this function follows
complete <- function(directory, id = 1:332) {

    ## Get a list of filenames
    filenames <- list.files(path=directory, pattern="*.csv")

    ## Initialize variables
    ids <-vector()
    counts = vector()

    ## Loop over the passed id's
    for(i in id) {

        ## Pad the i to create a filename
        filename <- sprintf("%03d.csv", i)
        filepath <- paste(directory, filename, sep="/")

        ## Load the data
        data <- read.csv(filepath)

        ## Store the id
        ids <- c(ids, i)

        ## Calculate and store the count of complete cases
        completeCases <- data[complete.cases(data),]
        counts <- c(counts, nrow(completeCases))
    }

    ## Return the data frame
    data.frame(id=ids, nobs=counts)
}

# question 5
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

# question 6
cc <- complete("specdata", 54)
print(cc$nobs)

# question 7
RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

