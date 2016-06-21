pollutantmean <- function(directory, pollutant, id = 1:332){
	# directory is a character vector of length 1 indicating the location of the csv files
	setwd(directory)
	filenames <- list.files(".", pattern = "*.csv")
	datalist <- lapply(filenames[id], read.csv)
    pollutants <- c("sulfate" = 2, "nitrate" = 3)
    summ <- 0
    num <- 0
    for(data in datalist){
        summ <- summ + sum(data[, pollutants[pollutant]], na.rm = TRUE)
        sub <- subset(data, data[, pollutants[pollutant]] != "NA")
        num <- num + nrow(sub)
    }    
    summ/num
    #sumlist <- lapply(datalist, takesum, pollutants, pollutant)
    #print(sumlist)
    #mean(sumlist, na.rm = TRUE)
}

takesum <- function(dataframe, pollutants, pollutant){
    sum(dataframe[, pollutants[pollutant]], na.rm = TRUE)
}