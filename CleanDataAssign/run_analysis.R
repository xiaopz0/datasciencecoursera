# read data
setwd('UCI HAR Dataset/train')


# Merges the training and the test sets to create one data set.
X_train<-read.table('X_train.txt')

setwd('../test')
X_test<-read.table('X_test.txt')

# combine data
X_combined<-rbind(X_train, X_test)
Y_combined<-rbind(Y_train, Y_test)
all_combined<-cbind(X_combined, Y_combined)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_ind<-grep('mean[(]',colnames(X_combined))
X_mean <- X_combined[,mean_ind]

std_ind<-grep('std[(]',colnames(X_combined))
X_std <- X_combined[,std_ind]

X_required = cbind(X_mean, X_std)

#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 

# run analytics
col_mean<-colMeans(X_combined, na.rm=T)
col_std<-apply(X_combined, 2, sd)

setwd('..')

myvariables <- read.table('features.txt', header=F)
colnames(X_combined)<- myvariables[,2]

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
setwd('train/')
subject_train <- read.table('subject_train.txt', header=F)
setwd('../test')
subject_test <- read.table('subject_test.txt', header=F)

subject <- rbind(subject_train,subject_test)
dtf <- cbind(X_required,subject)

averageByRowname<- aggregate(. ~ V1, data=dtf, FUN=mean)
