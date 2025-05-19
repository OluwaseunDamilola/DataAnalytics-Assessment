# Data Analyst Assessment

### Assessment_Q1
#### Challenges
- The business requires records of customers who have at least one funded savings account and one funded investment account. I initially struggled with the script because I was unfamiliar with the table structures, which resulted in null values in the output that did not meet the requirements.
- After revising my understanding, I created a correct script; however, it timed out during execution which became a challenge to me.

#### Approach and Solutions
- To resolve timed out, I increased the execution time and rewrote the script to improve its performance. I did this by examining the data structure carefully and selecting all entries from the relevant tables. I then joined the `plans_plan` table with the `user_customuser` table to create the initial output.
- After adding a third table and verifying its functionality, I faced challenges determining if an account was funded. I resolved this by calculating the difference between the total `confirmed_amount` and the total `deduction_amount`.

### Assessment_Q2
#### Challenges
- I didn't encounter many challenges while writing this script because I am already familiar with the process. The question is straightforward, and I found the requirements easy to understand since I had previously studied the tables while working on the first question.

#### Approach and Solutions
- The finance team aims to analyze customer transaction frequency in order to segment them into categories such as frequent and occasional users. I identified these segments and established specific criteria in the process. Firstly, I utilized a CASE WHEN statement to apply these criteria. Secondly, I divided the total count of unique customer IDs by the distinct count of transaction dates to calculate the average number of transactions per month for each category. 

### Assessment_Q3
#### Challenges
- I didn't encounter many challenges while writing this script because I am already familiar with the process. The question is straightforward, and I found the requirements easy to understand since I had previously studied the tables while working on the previous questions.

#### Approach and Solutions
- The business is looking for customers who have not made any transactions in the past year, along with their last transaction dates. This task is fairly straightforward. I joined the necessary tables and used the MAX function on the transaction_date to retrieve the most recent transaction date. Additionally, I wrote a query to identify customers who have not transacted within the last year.

### Assessment_Q4
#### Challenges
- I didn't encounter many challenges while writing this script because I am already familiar with the process. The question is straightforward, and I found the requirements easy to understand since I had previously studied the tables while working on the previous questions.

#### Approach and Solutions
- The business aims to estimate Customer Lifetime Value (CLV) based on account tenure and transaction volume. Essentially, they want to analyze each account's tenure, transaction volume, and corresponding customer lifetime value. This is a straightforward request since the formula is provided. To determine account tenure, I wrote a script that calculates how long each customer has been active, measured in months, and then apply the specified formula accordingly.
