complete <- function(directory, id = 1:332){
    # directory is a character vector of length 1 indicating the location of the csv files
    setwd(directory)
    filenames <- list.files(".", pattern = "*.csv")
    datalist <- lapply(filenames[id], read.csv)
    nobslist <- lapply(datalist, countnobs)
    numbers <- unlist(nobslist)
    ids <- id
	data.frame(ID = ids, nobs = numbers)
}

countnobs <- function(dataframe){
    nobs <- subset(dataframe, dataframe$sulfate != "NA" & dataframe$nitrate != "NA")
    return(nrow(nobs))
}