Clean Data Project for Coursera Data Cleaning Course
===========

I will attempt to describe the following

1. The raw data.
2. A [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf) 
3. A code book describing each variable and its values in the tidy data set.  
4. An explicit and exact recipe you used to go from 1 -> 2,3 

### The raw data

The raw data comes  a university project on wearable computing  
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the raw data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

by assuming that the data is downloaded and saved in the same folder as the script, you can run the script to obtain the clean data.

### The tidy data set
The data names are changed to descriptive names, the original_names.txt and descriptive_names.txt record the one to one correspondence
between the old name and new names. Average is the "mean" measurement of each variable. Volatility is the standard deviation measurement
of each variable. The names with the word fourier are measure that went through fourier transform. The names without fourier are normal
measures.
