#Project;
#Download super store data from google
#create tables in sql (order , person , returns table)
#create new table using join tables based on keys order , person , returns table - orderid , person
#city wise sales , profit
#segment wise max sales , discounts, profit
#city wise top3 sales
#create stored procedure for all your above 6 tasks
#
#
###Created a schema as superstore by downloaded data and it automatically crated a table which have all information and I named it as 'Order':
use super_store;
describe orders;
#create table called Peron:
create table person as select distinct `Customer Name`, `Customer ID`, `Order ID`, `Country`, `City`, `State` from orders;
#create table called table returns:
create table returns as select `Order ID`, `Customer Name` from orders;
#city wise sales and profit:
select `City`, sum(Sales) as Total_sales, sum(profit) as total_profit from orders group by `City`;
#segment wise max sales , discounts, profit
select `Segment`, max(Sales) as Max_profit, max(Discount) as Max_discount from orders group by `Segment`;
#city wise top3 sales
select `City`, `Sales` from orders where `Sales` order by `Sales` desc limit 3;

##Stored procedure #create table called Peron::

DELIMITER //
CREATE PROCEDURE createtableforperson()
begin
	create table person as select distinct `Customer Name`, `Customer ID`, `Order ID`, `Country`, `City`, `State` from orders;
end //
DELIMITER ;

##Stored procedure #create table called table::
DELIMITER //
CREATE PROCEDURE createtablefortablereturns()
begin
	create table returns as select `Order ID`, `Customer Name` from orders;
end //
DELIMITER ;

##Stored procedure city wise sales and profit:::
DELIMITER //
CREATE PROCEDURE getcitywisesalesandprofit()
begin
	select `City`, sum(Sales) as Total_sales, sum(profit) as total_profit from orders group by `City`;
end //
DELIMITER ;

##Stored procedure segment wise max sales , discounts, profit::
DELIMITER //
CREATE PROCEDURE getsegmentwisesalesdiscountprofit()
begin
	select `Segment`, max(Sales) as Max_profit, max(Discount) as Max_discount from orders group by `Segment`;
end //
DELIMITER ;

##Stored procedure city wise top3 sales:
DELIMITER //
CREATE PROCEDURE getcitywisetopsales()
begin
	select `Segment`, max(Sales) as Max_profit, max(Discount) as Max_discount from orders group by `Segment`;
end //
DELIMITER ;