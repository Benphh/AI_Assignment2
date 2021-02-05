library(readr)
x <- read.csv("Desktop/College/2.CSC2062 - Intro to Artificial Intelligence/Assignments/Assignment_2/AI_Assignment2/S2/Images/section1_images_csv/40266977_approxequal_1.csv", header = FALSE)
x
# Code for nr_pix #
num <- 1
total_black <- 0
for(row in 1:nrow(x)) {
  for(col in 1:ncol(x)) {
    if (x[row, col] == num){
      total_black <- total_black + 1
    }
  }
}
total_black
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


