# coursera Getting and Cleaning Data - project

# Libraries
library(data.table)
library(dplyr)

# Preparation
path.dir <- getwd()
train.dir<-paste0(path.dir,"/train/");
testsub.dir<-paste0(train.dir,"/Inertial Signals/");
test.dir<-paste0(path.dir,"/test/")
testsub.dir<-paste0(test.dir,"/Inertial Signals/");

# Step 1: Merges the training and the test sets to create one data set.

# Read and merge test+training data
xtrain<-read.table(file = paste0(train.dir,"X_train.txt"),header = F)
xtest<-read.table(file = paste0(test.dir,"X_test.txt"),header = F)
xdata <- rbind(xtrain, xtest)
rm(xtrain,xtest)

# Read and merge subject data
strain<-read.table(file = paste0(train.dir,"subject_train.txt"),header = F)
stest<-read.table(file = paste0(test.dir,"subject_test.txt"),header = F)
sdata <- rbind(strain, stest)
rm(strain,stest)

# Read and merge labels
ltrain<-read.table(file = paste0(train.dir,"y_train.txt"),header = F)
ltest<-read.table(file = paste0(test.dir,"y_test.txt"),header = F)
ldata <- rbind(ltrain, ltest)
rm(ltrain,ltest)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

# Get features
features<-read.table(file=paste0(path.dir,"/features.txt"), header = F, sep = " ",stringsAsFactors = F, col.names = c("no","feature"))

# Set names
colnames(xdata)<- features$feature
setnames(sdata,"V1","subject")
setnames(ldata,"V1","activity")

# Filter mean and std from freatures
features.filter <- grep("mean\\(\\)|std\\(\\)",features$feature,value=T)

# Extract only selected features filter
dataTable <- xdata[, features.filter]

# Merge columns
dataTableMS <- cbind(sdata,ldata,dataTable)
rm(xdata,ldata,sdata, dataTable)

# Step 3: Uses descriptive activity names to name the activities in the data set

#Get activity labels
activitylabels <-read.table(file=paste0(path.dir,"/activity_labels.txt"), header = F, sep = " ",stringsAsFactors = F, col.names = c("no","activiy"))

# Uses descriptive activity names in data table
dataTableMS$activity<-factor(dataTableMS$activity,levels = activitylabels$no,labels = activitylabels$activiy)

# Step 4: Appropriately labels the data set with descriptive variable names.

names(dataTableMS)<-gsub("^t", "time", names(dataTableMS))
names(dataTableMS)<-gsub("^f", "frequency", names(dataTableMS))
names(dataTableMS)<-gsub("Acc", "Accelerometer", names(dataTableMS))
names(dataTableMS)<-gsub("Gyro", "Gyroscope", names(dataTableMS))
names(dataTableMS)<-gsub("Mag", "Magnitude", names(dataTableMS))
names(dataTableMS)<-gsub("BodyBody", "Body", names(dataTableMS))
names(dataTableMS)<-gsub("std\\(\\)", "SD", names(dataTableMS))
names(dataTableMS)<-gsub("mean\\(\\)", "MEAN", names(dataTableMS))

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
dataTidy <- dataTableMS[,c(1,2,grep("STD", colnames(dataTableMS)), grep("MEAN", colnames(dataTableMS)))]

dataMean<-aggregate(. ~subject + activity, dataTidy, mean)
dataMean<-dataMean[order(dataMean$subject,dataMean$activity),]
write.table(dataMean, file = "tidyData.csv",row.name=FALSE)
