corr <- function(directory, threshold = 0){
    # directory is a character vector of length 1 indicating the location of the csv files
    setwd(directory)
    filenames <- list.files(".", pattern = "*.csv")
    datalist <- lapply(filenames, read.csv)
    nobslist <- lapply(datalist, checknobs, threshold)
    qualified <- subset(nobslist, nobslist != "NA")
    lapply(qualified, correlation)
}

checknobs <- function(dataframe, threshold){
    nobs <- subset(dataframe, dataframe$sulfate != "NA" & dataframe$nitrate != "NA")
    if(nrow(nobs)<threshold){
        return("NA")
    }
    else{
        return(nobs)
    }
}

correlation <- function(dataframe){
    cor(dataframe[,2], dataframe[, 3])
}