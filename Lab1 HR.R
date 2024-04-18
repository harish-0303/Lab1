# Load necessary libraries
library(tidymodels)

# Read in the data
students <- read.csv(r"(C:\Users\peddo\OneDrive\Desktop\Lab1\studentInfo.csv)")  # Ensure the file 'studentInfo.csv' exists and correct the path if needed

# Examine the structure of the data
str(students)

# Mutate variables
students$pass <- ifelse(students$final_result == "Pass", 1, 0)
students$pass <- as.factor(students$pass)
students$disability <- as.factor(students$disability)

# Feature engineering
students$imd_band <- factor(students$imd_band, levels = c("0-10%", "10-20%", "20-30%", "30-40%", "40-50%", "50-60%", "60-70%", "70-80%", "80-90%", "90-100%"))
students$imd_band <- as.integer(students$imd_band)

# Split data
set.seed(20230712)
train_test_split <- initial_split(students, prop = 0.80)
data_train <- training(train_test_split)
data_test <- testing(train_test_split)

# Create a recipe
my_rec <- recipe(pass ~ disability + imd_band, data = data_train)

# Specify the model
my_mod <- 
  logistic_reg() %>% 
  set_engine("glm") %>% 
  set_mode("classification")

# Add model and recipe to workflow
my_wf <- 
  workflow() %>% 
  add_model(my_mod) %>% 
  add_recipe(my_rec)

# Fit model
fitted_model <- fit(my_wf, data = data_train)

# Create a resampling object for the testing data
test_split <- initial_split(data_test, prop = 0.8)  # Use initial_split instead of rsample::initial_split

# Fit the model using the testing data
final_fit <- last_fit(my_wf, split = test_split)

# View the final fitted model
final_fit

# Collect predictions
final_fit %>%
  collect_predictions()

# Interpret accuracy
final_fit %>%
  collect_predictions() %>%
  select(.pred_class, pass) %>%
  mutate(correct = .pred_class == pass) %>%
  count(correct)  # Use count instead of tabyl for tabulation
