# read data
setwd('UCI HAR Dataset/train')

X_train<-read.table('X_train.txt')
Y_train<-read.table('Y_train.txt')

setwd('../test')
X_test<-read.table('X_test.txt')
Y_test<-read.table('Y_test.txt')

# combine data
X_combined<-rbind(X_train, X_test)
Y_combined<-rbind(Y_train, Y_test)
all_combined<-cbind(X_combined, Y_combined)

# run analytics
col_mean<-colMeans(X_combined, na.rm=T)
col_std<-apply(X_combined, 2, sd)

setwd('../..')
mylabels <- read.table('activity_labels.txt', header=F)
rownames(X_combined)<- mylabels[Y_combined[,1],2]

myvariables <- read.table('features.txt', header=F)
colnames(X_combined)<- myvariables[,2]
all_combined<-cbind(X_combined, Y_combined)

averageByRowname<- aggregate(. ~ V1, data=all_combined, FUN=mean)
