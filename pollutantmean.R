#get working directory
getwd()
#place specdata folder into working director

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
    #create empty data frame  
    z <- data.frame()

    #get list of files in specdata folder
    AllFiles <- list.files(paste("./",directory,"/",sep = ''))

    #read data 1:332 depends on function's argument
    for (i in id) {
          x <- read.csv(paste("./",directory,"/",AllFiles[i],sep=''))
          z <- rbind(x,z)
    }

    #get mean for pollutant
    mean(z[,pollutant],na.rm = TRUE)
}

## Checking
## source("pollutantmean.R")
## pollutantmean("specdata", "sulfate", 1:10) 
## [1] 4.064128
## pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706047
## pollutantmean("specdata", "nitrate", 23)
## [1] 1.280833