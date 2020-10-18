
################################################################################
################################### LOAD DATA ##################################
################################################################################
## First we download the data and we accommodate it in a directory I try
## to do this in a way that could fit if you already have run this script.
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
getWearableComputingDS<-function(pathToData,
                                 pathMainDir,
                                 label,
                                 fileSubject,
                                 fileData,
                                 fileActivities)
{
  Data<-fread(file.path(pathToData,fileData))
  names(Data)<-fread(file.path(pathMainDir,"features.txt"))[[2]]
  
  Data.Subjects<-fread(file.path(pathToData,fileSubject))
  names(Data.Subjects)<-c("Subject")
  
  Data.Subjects<-mutate(Data.Subjects,Type=label,.before="Subject")
  
  Data.Activities<-fread(file.path(pathToData,fileActivities))
  names(Data.Activities)<-c("Activity")
  
  cbind(Data.Subjects,Data.Activities,Data)
}

cleanColumns<-function(dataToProcess){
  Features.Names<-fread(file.path(Path.Main,"features.txt"))
  Columns.Good<-grep("(std\\())|(mean\\())",Features.Names$V2,value = TRUE)
  select(Data.Total,"Type","Subject","Activity",Columns.Good)
}

setActivitiesAsStrings<-function(dataToProcess){
  Data.Activities<-fread(file.path(Path.Main,"activity_labels.txt"))
  Data.Temp<-mutate(dataToProcess,
         ActivityName=Data.Activities$V2[match(Data.Total$Activity,Data.Activities$V1)],
         .before="Subject")
  Data.Temp<-mutate(Data.Temp,Activity=NULL)
  Data.Temp
}

# Now I get the datasets

Path.Main <- file.path(Directory.Name,"UCI HAR Dataset")
Path.Train <- file.path(Path.Main, "train")
Path.Test <- file.path(Path.Main, "test")

Data.Train<-getWearableComputingDS(Path.Train,
                                   Path.Main,
                                   "Train",
                                   "subject_train.txt",
                                   "X_train.txt",
                                   "y_train.txt")

Data.Test<-getWearableComputingDS(Path.Test,
                                   Path.Main,
                                   "Test",
                                   "subject_test.txt",
                                   "X_test.txt",
                                   "y_test.txt")


#Merge both datasets
Data.Total<-rbind(Data.Train,Data.Test)

# Now I eliminate what is not needed, the incise 2 says 
# "Extracts only the measurements on the mean and standard
# deviation for each measurement. "

Data.Total<-cleanColumns(Data.Total)

# I set the name of the activity as something more descriptive (incise 4) using
# activity_labels.txt file.

Data.Total<-setActivitiesAsStrings(Data.Total)

# Finally I summarize by Activity and Subject
Data.Grouped<-group_by(Data.Total,ActivityName,Subject)
Data.Final<-summarise_if(Data.Grouped,is.numeric,funs(mean))

write.table(Data.Final,file = "FinalData.txt", row.names = FALSE)

View(Data.Final)







