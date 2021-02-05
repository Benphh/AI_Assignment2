library(readr)
x <- as.matrix(read.csv("Desktop/College/2.CSC2062 - Intro to Artificial Intelligence/Assignments/Assignment_2/Rough Folder/Images/section1_images_pgm/40266977_lessequal_8.pgm", skip = 3),25,25)

x_byrow_matrix <- matrix(x,25,25, byrow=TRUE) #fill in by rows


row.names(x_byrow_matrix)<-NULL
for(row in 1:nrow(x_byrow_matrix)) {
  for(col in 1:ncol(x_byrow_matrix)) {
    if (x_byrow_matrix[row, col] < 128){
      x_byrow_matrix[row, col] = 1
    }else{
      x_byrow_matrix[row, col] = 0
    }
  }
}
write.csv(x_byrow_matrix,'Desktop/College/2.CSC2062 - Intro to Artificial Intelligence/Assignments/Assignment_2/Rough Folder/Images/section1_images_csv/X_40266977_lessequal_8.csv',row.names=FALSE)

