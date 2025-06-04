-- Problem 5 : Customers with Strictly Increasing Purchases	(https://leetcode.com/problems/customers-with-strictly-increasing-purchases/)

with cte as (
    select customer_id, year(order_date) as 'year', sum(price) as price 
    from orders
    group by year, customer_id
)
select customer_id
from cte c1
left join cte c2 on c1.customer_id=c2.customer_id 
and c1.year+1 = c2.year 
and c1.price < c2.price
group by c1.customer_id
having count(*) - count(c2.customer_id) = 1