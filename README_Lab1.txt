This repository hosts code for constructing a predictive model aimed at estimating student performance by considering various factors like study hours, quiz scores, forum participation, and previous grades. The model, developed in R, employs supervised learning techniques.

## Generating the Dataset

Simulated data resembling student performance records is generated, encompassing features such as study hours, quiz scores, forum participation, previous grades, and final grades. The generation process employs a fixed random seed to ensure reproducibility.

## Developing the Model

1. **Data Splitting**: The dataset is partitioned into training and testing subsets at an 80:20 ratio, enabling model training on a portion of the data and assessing its performance on unseen data.
  
2. **Model Specification**: Logistic regression is chosen as the predictive model owing to its suitability for binary classification tasks. The model is specified using the `{parsnip}` package, employing a generalized linear model (glm) engine for logistic regression.

3. **Feature Engineering**: A recipe is formulated to preprocess the data before model training. This recipe delineates the outcome variable (`FinalGrades`) and predictor variables (`StudyHours`, `QuizScores`, `ForumPosts`, `PreviousGrades`).

4. **Model Training**: Training the model entails utilizing the designated workflow, encompassing both the model and recipe components, on the training dataset.

5. **Model Evaluation**: The trained model is evaluated on the testing dataset to gauge its predictive performance. Evaluation metrics like accuracy and prediction interval are computed to assess the model's efficacy in predicting student grades.

## Implementation

To execute the code:

1. Clone this repository to your local machine.
2. Open the R script or R Markdown file in your preferred R development environment.
3. Install the required packages as listed in the script.
4. Execute the code sequentially to generate simulated data, train the model, and evaluate its performance.

## Required Packages

Executing the code necessitates the following R packages:

- `{tidymodels}`: For data modeling and preprocessing.
- `{rsample}`: For data partitioning and resampling.
- `{parsnip}`: For specifying machine learning models.
- `{dplyr}`: For data manipulation.
- `{ggplot2}`: For data visualization.

Install these packages using the `install.packages()` function if not already installed.
