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

## Write a function that takes a directory of data files and a threshold for
## complete cases and calculates the correlation between sulfate and nitrate for
## monitor locations where the number of completely observed cases (on all
## variables) is greater than the threshold.
## The function should return a vector of correlations for the monitors that
## meet the threshold requirement. If no monitors meet the threshold
## requirement, then the function should return a numeric vector of length 0.
corr <- function(directory, threshold = 0) {

    completes <- complete(directory, 1:332)
    completes <- subset(completes, nobs > threshold )

    ## Initialize variables
    correlations <- vector()

    ## Loop over the passed id's
    for(i in completes$id ) {

        ## Pad the i to create a filename
        filename <- sprintf("%03d.csv", i)
        filepath <- paste(directory, filename, sep="/")

        ## Load the data
        data <- read.csv(filepath)

        ## Calculate and store the count of complete cases
        completeCases <- data[complete.cases(data),]
        count <- nrow(completeCases)

        ## Calculate and store the count of complete cases
        ## if threshhold is reached
        if( count >= threshold ) {
            correlations <- c(correlations, cor(completeCases$nitrate, completeCases$sulfate) )
        }
    }

    ## Return a numeric vector of correlations
    correlations
}

# question 8
cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

# questions 9
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

# question 10
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
