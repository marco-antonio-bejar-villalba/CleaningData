# Codebook

The data is collected as described in the original publication [^1]:

*"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz."*

*"Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)."* 

*"Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."*

*"These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."*

The variables gotten by the approach are the following:

1. tBodyAcc-X
2. tBodyAcc-Y
3. tBodyAcc-Z
4. tGravityAcc-X
5. tGravityAcc-Y
6. tGravityAcc-Z
7. tBodyAccJerk-X
8. tBodyAccJerk-Y
9. tBodyAccJerk-Z
10. tBodyGyro-X
11. tBodyGyro-Y
12. tBodyGyro-Z
13. tBodyGyroJerk-X
14. tBodyGyroJerk-Y
15. tBodyGyroJerk-Z
16. tBodyAccMag
17. tGravityAccMag
18. tBodyAccJerkMag
19. tBodyGyroMag
20. tBodyGyroJerkMag
21. fBodyAcc-X
22. fBodyAcc-Y
23. fBodyAcc-Z
24. fBodyAccJerk-X
25. fBodyAccJerk-Y
26. fBodyAccJerk-Z
27. fBodyGyro-X
28. fBodyGyro-Y
29. fBodyGyro-Z
30. fBodyAccMag
31. fBodyAccJerkMag
32. fBodyGyroMag
33. fBodyGyroJerkMag

For each variable the following estimates are considered for the final data.

- mean(): Mean value
- std(): Standard deviation

Additional for descriptional purposes the following columns are also included.

- Subject
- ActivityName




[^1]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012