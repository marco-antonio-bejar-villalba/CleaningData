
################################################################################
################################### LOAD DATA ##################################
################################################################################
## First we download the data and we accommodate it in a directory I try
## to do this in a way taht could fit if you already have run this script.
################################################################################
require("data.table")
require("dplyr")

URL.Origin = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
Zip.File.Name = "GalaxyPhoneData.zip"
Directory.Name = "Data"

Zip.File.Destiny = file.path(Directory.Name,Zip.File.Name)

if(!dir.exists(Directory.Name))
  dir.create(Directory.Name)

if(!file.exists(Zip.File.Destiny)){
  download.file(URL.Origin, Zip.File.Destiny)
  unzip(Zip.File.Destiny,exdir = Directory.Name)
}

################################################################################
############################## CREATE THE DATASETS #############################
################################################################################
## We need to consider 5 datasets for train and 5 for test in this way:
## 1) The data itself which is contained in x_train.txt and x_test.txt
## 2) The activities that matches each row in 1) that are in y_train.txt 
## and y_test.txt
## 3) The subjects for each row in 1) which are contained in subject_train.txt 
## and subject_train.txt
################################################################################



Path.Main <- file.path(Directory.Name,"UCI HAR Dataset")
Path.Train <- file.path(Path.Main, "train")
Path.Test <- file.path(Path.Main, "test")

Data.Train<-fread(file.path(Path.Train,"X_train.txt"))
names(Data.Train)<-fread(file.path(Path.Main,"features.txt"))[[2]]

Data.Train.Subjects<-fread(file.path(Path.Train,"subject_train.txt"))
names(Data.Train.Subjects)<-c("Subject")

Data.Train.Activities<-fread(file.path(Path.Train,"y_train.txt"))
names(Data.Train.Activities)<-c("Activity")

Data.Train<-cbind(Data.Train.Subjects,Data.Train.Activities,Data.Train)

#Data.Train<-fread(file.path(Path.Train,"subject_train.txt"))
#Data.Train<-cbind(Data.Train, fread(file.path(Path.Train,"y_train.txt")))
#Data.Train<-cbind(Data.Train, fread(file.path(Path.Train,"X_train.txt")))





