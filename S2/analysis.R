library(readr)
# This makes a csv file that holds all of the file names for us to loop through 
fileNames <- Sys.glob("Desktop/College/2.CSC2062 - Intro to Artificial Intelligence/Assignments/Assignment_2/AI_Assignment2/S2/Images/section1_images_csv/*.csv")
fileNames
# Initialise the lists that will be the columns for the csv file
label <- c()
index <- c()
nr_pix <- c()
rows_with_2 <- c()
cols_with_2 <- c()
rows_with_3p <- c()
cols_with_3p <- c()
height <- c()
width <- c()
left2tile <- c()
right2tile <- c()
top2tile <- c()
bottom2tile <- c()
horizontalness <- c()
verticalness <- c()
diagonalness <- c()

# This loops through all of the files
for (file in fileNames){
  file_name_list <- strsplit(file, "/")
  file_name <- file_name_list[[1]][10]
  file_name_without_csv <- substr(file_name,1, nchar(file_name)-4)
  file_name_without_csv
  stripped_name_list <- strsplit(file_name_without_csv, "_")
  stripped_name <- stripped_name_list[[1]]
  var_label <- stripped_name[2]
  label <- c(label,var_label)
  var_index <- stripped_name[3]
  index <- c(index, var_index)
  x <- read.csv(file, header = FALSE)
  


# Code for nr_pix #
num <- 1
var_nr_pix <- 0
for(row in 1:nrow(x)) {
  for(col in 1:ncol(x)) {
    if (x[row, col] == num){
      var_nr_pix <- var_nr_pix + 1
    }
  }
}
nr_pix <- c(nr_pix, var_nr_pix)

# Code for rows_with_2
num <- 1
total_row_black <- 0
var_rows_with_2 <- 0
for(row in 1:nrow(x)) {
  for(col in 1:ncol(x)) {
    if (x[row, col] == num){
      total_row_black <- total_row_black + 1
    }
  }
  if (total_row_black == 2){
    var_rows_with_2 <- var_rows_with_2 + 1
  }
  total_row_black <- 0
}
rows_with_2 <- c(rows_with_2, var_rows_with_2)

# Code for cols_with_2
total_cols_black <- 0
total_2_black_pixel_cols <- 0
for(col in 1:ncol(x)) {
  for(row in 1:nrow(x)) {
    if (x[row, col] == num){
      total_cols_black <- total_cols_black + 1
    }
  }
  if (total_cols_black == 2){
    total_2_black_pixel_cols <- total_2_black_pixel_cols + 1
  }
  total_cols_black <- 0
}
cols_with_2 <- c(cols_with_2, total_2_black_pixel_cols)

# Code for rows_with_3p
total_row_black <- 0
total_3p_black_pixel_rows <- 0
for(row in 1:nrow(x)) {
  for(col in 1:ncol(x)) {
    if (x[row, col] == num){
      total_row_black <- total_row_black + 1
    }
  }
  if (total_row_black >= 3){
    total_3p_black_pixel_rows <- total_3p_black_pixel_rows + 1
  }
  total_row_black <- 0
}
rows_with_3p <- c(rows_with_3p, total_3p_black_pixel_rows)

# Code for cols_with_3p
total_cols_black <- 0
total_3p_black_pixel_cols <- 0
for(col in 1:ncol(x)) {
  for(row in 1:nrow(x)) {
    if (x[row, col] == num){
      total_cols_black <- total_cols_black + 1
    }
  }
  if (total_cols_black >=  3){
    total_3p_black_pixel_cols <- total_3p_black_pixel_cols + 1
  }
  total_cols_black <- 0
}
cols_with_3p <- c(cols_with_3p, total_3p_black_pixel_cols)

# Code for height
list_of_rows <- c()
height <- 0
for(row in 1:nrow(x)) {
  for(col in 1:ncol(x)) {
    if (x[row, col] == num){
      list_of_rows <- c(list_of_rows, row) #makes a list of all the rows that black pixels appear on
    }
  }

}
var_height <- (list_of_rows[length(list_of_rows)] - list_of_rows[1])
height <- c(height, var_height)

# Code for width
list_of_cols <- c()
width <- 0
for(col in 1:ncol(x)) {
  for(row in 1:nrow(x)) {
    if (x[row, col] == num){
      list_of_cols <- c(list_of_cols, col)
    }
  }
  
}
var_width <- (list_of_cols[length(list_of_cols)] - list_of_cols[1]) # makes a list of all the cols that black pixels appear on
width <- c(width, var_width)


# Code for left2tile
var_left2tile <- 0
for(row in 1:24) {
  for(col in 1:24) {
    if ((x[row, col] == num)&(x[row+1, col] == num)&(x[row, col+1] == 0)&(x[row+1, col+1] == 0)){
      var_left2tile<- var_left2tile + 1
    }
  }
  
}
left2tile <- c(left2tile, var_left2tile)



# Code for right2tile
var_right2tile <- 0
for(row in 1:24) {
  for(col in 1:24) {
    if ((x[row, col] == 0)&(x[row+1, col] == 0)&(x[row, col+1] == 1)&(x[row+1, col+1] == 1)){
      var_right2tile<- var_right2tile + 1
    }
  }
}
right2tile <- c(right2tile, var_right2tile)

# Code for verticalness
var_verticalness <- (var_left2tile + var_right2tile) / var_nr_pix
verticalness <- c(verticalness, var_verticalness)

# Code for top2tile
var_top2tile <- 0
for(row in 1:24) {
  for(col in 1:24) {
    if ((x[row, col] == 1)&(x[row+1, col] == 0)&(x[row, col+1] == 1)&(x[row+1, col+1] == 0)){
      var_top2tile<- var_top2tile + 1
    }
  }
  
}
top2tile <- c(top2tile, var_top2tile)

# Code for bottom2tile
var_bottom2tile <- 0
for(row in 1:24) {
  for(col in 1:24) {
    if ((x[row, col] == 0)&(x[row+1, col] == 1)&(x[row, col+1] == 0)&(x[row+1, col+1] == 1)){
      var_bottom2tile<- var_bottom2tile + 1
    }
  }
  
}
bottom2tile <- c(bottom2tile, var_bottom2tile)

# Code for horizontalness
var_horizontalness <- (var_top2tile + var_bottom2tile) / var_nr_pix
horizontalness <- c(horizontalness, var_horizontalness)

# Code for left_to_right_diagonal
left_to_right_diagonal <- 0
for(row in 1:23) {
  for(col in 1:23) {
    if (((x[row+2, col] == num)|(x[row+1, col] == num)|(x[row+2, col+1] == num))&(x[row+1, col+1] == num)&(x[row, col+2] == num)){
      left_to_right_diagonal<- left_to_right_diagonal + 1
    }
  }
  
}

# Code for right_to_left_diagonal
right_to_left_diagonal <- 0
for(row in 1:23) {
  for(col in 1:23) {
    if (((x[row+1, col+2] == num)|(x[row+2, col+1] == num)|(x[row+2, col+2] == num))&(x[row+1, col+1] == num)&(x[row, col] == num)){
      right_to_left_diagonal<- right_to_left_diagonal + 1
    }
  }
  
}

# Code for diagonalness
var_diagonalness <- (left_to_right_diagonal + right_to_left_diagonal) / var_nr_pix
diagonalness <- c(diagonalness, var_diagonalness)



}

# Code for writing to the csv file
features_df <- cbind(label, index,nr_pix, rows_with_2,cols_with_2, rows_with_3p, cols_with_3p,height, width, left2tile, right2tile, verticalness, top2tile, bottom2tile, horizontalness, diagonalness)
write.csv(features_df, "Desktop/College/2.CSC2062 - Intro to Artificial Intelligence/Assignments/Assignment_2/AI_Assignment2/S2/40266977_features.csv",row.names=FALSE)


