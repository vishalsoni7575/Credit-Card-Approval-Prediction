
use credit_card;

#Group the customers based on their income type and find the average of their annual income.
select Type_Income, 
		count(Ind_ID) as "Total Customers" ,  ## Counting the total customers aliasing as "Total Customers"
		round(avg(Annual_income),2) Average_Income  ## Average of Annual Income aliasing as "Average_Income"
		from credit_card_sql 
	group by Type_Income
	order by Average_Income desc;   ## Ordering in descending order


#Find the female owners of cars and property.
select GENDER, 
		Car_Owner, 
		Propert_Owner
		from credit_card_sql
	where GENDER = 0;   ### 0 represents Female


#Find the male customers who are staying with their families.
select  ind_id, gender, 
		family_members
		from credit_card_sql
	where (Family_Members is not null) and (gender = 1);   ## combining both Male and family members


#Please list the top five people having the highest income. 
select ind_id Customer_ID, 
		round(annual_income) Annual_income   ## Rounding of Annual Income aliasing as "Annual_income"
		from credit_card_sql
	order by Annual_income desc
limit 5;


#How many married people are having bad credit.
select Marital_status,
		count(ind_id) Customers,  ## Counting the total customers aliasing as "Customers"
        label Bad_Credit  ##  Aliasing as "Bad_Credit"
		from credit_card_sql
	where (Marital_status = "Married") and (label = 0)
	group  by Marital_status;


#What is the highest education level and what is the total count.
select EDUCATION, 
		count(EDUCATION) top_education ##  Aliasing as "top_education"
		from credit_card_sql
	group by EDUCATION
	order by top_education desc
limit 1;


#Between married males and females, who is having more bad credit.
select gender, 
		count(gender) Count_gender, ##  Aliasing as "Count_gender"
		label Bad_Credit ##  Aliasing as "Bad_Credit"
		from credit_card_sql
	where label = 0  ## Bad_Credit is 0
	group by gender
	order by Count_gender desc;


