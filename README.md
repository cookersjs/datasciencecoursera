<h3> README for run_analysis.R</h3>

This code downloads the zip file of the UCI HAR Dataset. The dataset is described in more detail in <a href="https://github.com/cookersjs/datasciencecoursera/blob/master/CodeBook.md">Codebook.md</a>, but briefly it is movement measurments taken from smartphones in 30 patients.

The script run_analysis.R, which can be run by loading the script and calling the 'runAnalysis()' function unpacks this zip file, reads in the training and test data, as well as their accompanying features. It cleans the data up by replacing numerical values with the proper descriptive activity names and then adds them to the raw data table.

After the training and test datasets are merged with descriptive activity names, the data is filtered down to just those columns that measured <b>mean</b> or <b>standard deviation</b>. 

Afterwards, header names are updated so that the short names are extended.

Finally, the data is processed so as to produce the aggregate mean and standard deviation of each group, as determined by the subjectIds and the activities. These are output in the table <a href="https://github.com/cookersjs/datasciencecoursera/blob/master/tidy_data.txt">tidy_data.txt</a>.
