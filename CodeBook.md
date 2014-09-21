#Variables

####dir - directory of files
####dirTrain - Directory of training files
####dirTest  - Directory of test files
####activityLables - labels of activites dataset
####features -  dataset with names for columns in the others datasets
####testdata - dataset with test information
####testSubject - dataset with information about test subject
####testLabels  - dataset with information about test activity 
####traindata - dataset with train information
####trainSubject - dataset with information about train subjects
####trainLabels  - dataset with information about train activity 
####meanColumns - columns functions mean
####stdColumns - columns funtions standar deviation
####colsToSelect - columns to select (mean and standard deviation)
####tydiTestData - tidy test dataset (only columns mean and std)
####tydiTrainData - tidy train dataset (only columns mean and std)
####activityTestLabels - activity test dataset with activities and labeles 
####activityTrainLabels - activity train dataset with activities and labeles 
####tydiDataSet - combination training and test tidy datasets
####meltData - Dataset for subject and activity
####tidyMeanData - Dataset with each variable average for subject and activity



#Transformations
1. adding names to datasets (testData, trainData)
2. Selection columns mean and standard deviation
3. adding column subject, 
4. naming activityLAbels
5. merging activy labels 
6. adding column activity
7. comining tidy datasets
8. melting data for subject and activity
9. casting data 