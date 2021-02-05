library(readr)
x <- read.csv("Desktop/College/2.CSC2062 - Intro to Artificial Intelligence/Assignments/Assignment_2/AI_Assignment2/S2/Images/section1_images_csv/40266977_less_7.csv", header = FALSE)
x
# Code for nr_pix #
num <- 1
nr_pix <- 0
for(row in 1:nrow(x)) {
  for(col in 1:ncol(x)) {
    if (x[row, col] == num){
      nr_pix <- nr_pix + 1
    }
  }
}
nr_pix
# Code for rows_with_2
num <- 1
total_row_black <- 0
total_2_black_pixel_rows <- 0
for(row in 1:nrow(x)) {
  for(col in 1:ncol(x)) {
    if (x[row, col] == num){
      total_row_black <- total_row_black + 1
    }
  }
  if (total_row_black == 2){
    total_2_black_pixel_rows <- total_2_black_pixel_rows + 1
  }
  total_row_black <- 0
}
total_2_black_pixel_rows

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
total_2_black_pixel_cols

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
total_3p_black_pixel_rows

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
total_3p_black_pixel_cols

# Code for height
list_of_rows <- c()
height <- 0
for(row in 1:nrow(x)) {
  for(col in 1:ncol(x)) {
    if (x[row, col] == num){
      list_of_rows <- c(list_of_rows, row)
    }
  }

}
height <- (list_of_rows[length(list_of_rows)] - list_of_rows[1])
height

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
width <- (list_of_cols[length(list_of_cols)] - list_of_cols[1])
width
# Code for left2tile
left2tile <- 0
for(row in 1:24) {
  for(col in 1:24) {
    if ((x[row, col] == num)&(x[row+1, col] == num)&(x[row, col+1] == 0)&(x[row+1, col+1] == 0)){
      left2tile<- left2tile + 1
    }
  }
  
}
left2tile



# Code for right2tile
right2tile <- 0
for(row in 1:24) {
  for(col in 1:24) {
    if ((x[row, col] == 0)&(x[row+1, col] == 0)&(x[row, col+1] == 1)&(x[row+1, col+1] == 1)){
      right2tile<- right2tile + 1
    }
  }
  
}
right2tile

# Code for verticalness
verticalness <- (left2tile + right2tile) / nr_pix
verticalness

# Code for top2tile
top2tile <- 0
for(row in 1:24) {
  for(col in 1:24) {
    if ((x[row, col] == 1)&(x[row+1, col] == 0)&(x[row, col+1] == 1)&(x[row+1, col+1] == 0)){
      top2tile<- top2tile + 1
    }
  }
  
}
top2tile

# Code for bottom2tile
bottom2tile <- 0
for(row in 1:24) {
  for(col in 1:24) {
    if ((x[row, col] == 0)&(x[row+1, col] == 1)&(x[row, col+1] == 0)&(x[row+1, col+1] == 1)){
      bottom2tile<- bottom2tile + 1
    }
  }
  
}
bottom2tile

# Code for horizontalness
horizontalness <- (top2tile + bottom2tile) / nr_pix
horizontalness

# Code for left_to_right_diagonal
left_to_right_diagonal <- 0
for(row in 1:23) {
  for(col in 1:23) {
    if (((x[row+2, col] == num)|(x[row+1, col] == num)|(x[row+2, col+1] == num))&(x[row+1, col+1] == num)&(x[row, col+2] == num)){
      left_to_right_diagonal<- left_to_right_diagonal + 1
    }
  }
  
}
left_to_right_diagonal

# Code for right_to_left_diagonal
right_to_left_diagonal <- 0
for(row in 1:23) {
  for(col in 1:23) {
    if (((x[row+1, col+2] == num)|(x[row+2, col+1] == num)|(x[row+2, col+2] == num))&(x[row+1, col+1] == num)&(x[row, col] == num)){
      right_to_left_diagonal<- right_to_left_diagonal + 1
    }
  }
  
}
right_to_left_diagonal

# Code for diagonalness
diagonalness <- (left_to_right_diagonal + right_to_left_diagonal) / nr_pix

