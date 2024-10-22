# Rental-Price-Classification-KNN
**Overview:**

This project explores the classification of US apartments into rental segments (low, mid, high) based on various factors such as location, square footage, number of bedrooms, and amenities. By using the K-Nearest Neighbors (KNN) algorithm, we aim to develop a model that accurately classifies apartments into their respective rental price segments.

The analysis is carried out using two different platforms Python and R to compare their implementation of the KNN algorithm. The project not only demonstrates the steps for data preparation, model training, and evaluation but also highlights the strengths and weaknesses of each platform. The dataset used for this project is the Apartment for Rent Classified dataset from the UCI Machine Learning Repository.

**Motivation and Goal:**

The US real estate market is heavily influenced by factors that determine rental prices. Accurately classifying rental segments helps property managers and tenants make informed decisions about marketing strategies, pricing optimization, and real estate investment. The goal of this project is to:
- Implement the KNN algorithm in both Python and R to classify apartments into rental segments.
- Compare the performance metrics, accuracy, and ease of use of both platforms.
- Provide insights into which platform performs better for this specific classification problem.

**Results Summary:**

1. Python implementation:
+ Accuracy: 45%
+ Performance Metrics (Precision, Recall, F1-score): Highest scores in the medium segment.
+ Confusion Matrix: The model struggled the most with high-segment apartments, frequently misclassifying them as low or medium segments.
+ Key Insights: The KNN model performed best in classifying the medium segment but had challenges distinguishing between high and low segments.

2. R implementation:
+ Accuracy: 46.15%
+ 95% Confidence Interval: 43.95% to 48.36%
+ Performance Metrics (Sensitivity, Specificity): Moderate accuracy in the low segment; the model struggled with medium and high segments.
+ Statistical Insights: The R model provided more detailed statistical insights, such as p-values and confidence intervals, indicating model reliability.

**Comparison:**

Both models performed similarly in terms of accuracy, but the R model provided more detailed statistical insights, while the Python model offered smoother and more efficient implementation.
Python excelled in ease of use and flexibility, while R offered better reliability and variability measures through statistical analysis.
