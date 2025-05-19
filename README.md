# Data Analyst Assessment

### Assessment_Q1
#### Challenges
- The business requires records of customers who have at least one funded savings account and one funded investment account. I initially struggled with the script because I was unfamiliar with the table structures, which resulted in null values in the output that did not meet the requirements.
- After revising my understanding, I created a correct script; however, it timed out during execution which became a challenge to me.

#### Solutions
- To resolve timed out, I increased the execution time and rewrote the script to improve its performance. I did this by examining the data structure carefully and selecting all entries from the relevant tables. I then joined the `plans_plan` table with the `user_customuser` table to create the initial output.
- After adding a third table and verifying its functionality, I faced challenges determining if an account was funded. I resolved this by calculating the difference between the total `confirmed_amount` and the total `deduction_amount`.

### Assessment_Q2
#### Challenges
- 

#### Solutions
- 

### Assessment_Q3
#### Challenges
-

#### Solutions
-

### Assessment_Q4
#### Challenges
-

#### Solutions
-
