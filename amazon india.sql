--sales analysis
create or alter view total_sales as
select  product as product_name, count(order_id) as orders_count , format(round(sum(amount),2),'0,0')as total_amount_per_product
from dbo.[amazon india] 
where status != 'cancelled'
group by product

select * from total_sales
                              -------------------------------------
create or alter view cancelled_orders as
select count(order_id) as cancelled_orders_count , product as product_name, 
format(round(sum(amount),2),'0,0') as total_cancelled_orders_amount
from dbo.[amazon india] india 
where status = 'cancelled'
group by product

select * from cancelled_orders
                                -----------------------------------

create or alter view damage_lost as
select product as product_name,count (order_id) as damaged_orders, 
format(round(sum(amount),2),'0,0') as total_amount_damage,shipper 
from [amazon india]
where status = 'damaged'
group by product , shipper

select * from damage_lost
                                   -----------------------------------------

create or alter view lost_in_transit as
select product as product_name , count(order_id) as lost_orders_count,
format(round(sum(amount),2),'0,0') as total_lost_amount,shipper
from [amazon india] 
where status = 'lost in transit'
group by product ,shipper

select * from lost_in_transit
                           ---------------------------------------

create or alter view buyer_reject as
select product as product_name , count(order_id) as reject_orders_count,
format(round(sum(amount),2),'0,0') as total_reject_amount
from [amazon india]
where Status = 'rejected by buyer'
group by product

select * from buyer_reject
                            ---------------------------------------
create or alter view seller_return as 
select Product as product_name,count(order_id) as seller_returned_ordered,
FORMAT(round(sum(amount),2),'0,0') as total_amount_returned,sum(qty) as total_qty_rejected
from [amazon india]
where status = 'returned to seller'
group by Product
select * from buyer_reject
----------------------------------------------------------------------------------------------------------------------
-- sales overtime

create or alter view sales_month as
with sales_march as
(select Product as product_name , format([Date],'yyyy-MM') as march,format(round(sum(Amount),2),'0,0') as sales_march
from [amazon india]
where date between '2022-3-1' and '2022-3-31'and status !='cancelled'
group by product, format([Date],'yyyy-MM')),

sales_april as
(select product as prodcut_name ,format([date],'yyyy-MM') as april,format(round(sum(amount),2),'0,0') as sales_april
from [amazon india]
where date between '2022-4-1' and '2022-4-30' and status !='cancelled'
group by product, format([date],'yyyy-MM')),

sales_may as
(select product as product_name , format([date],'yyyy-MM') as may , format(round(sum(amount),2),'0,0') as sales_may
from [dbo].[amazon india]
where date between '2022-5-1' and '2022-5-31' and status !='cancelled'

group by product, format([date],'yyyy-MM')),


sales_june as
(select product as product_name , format([date],'yyyy-MM') as june, format(round(sum(amount),2),'0,0') as sales_june
from [amazon india]
where date between '2022-6-1' and '2022-6-30' and status !='cancelled'
group by product, format([date],'yyyy-MM'))

select j.product_name as product_name ,mh.sales_march as march_sales,a.sales_april as april_sales ,
my.sales_may as may_sales , j.sales_june as june_sales
from sales_march as mh full outer join sales_april as a on mh.product_name = a.prodcut_name
full outer join sales_may as my on a.prodcut_name = my.product_name
full outer join sales_june as j on my.product_name = j.product_name;

select * from sales_month

                                 -----------------------------------
create or alter view peak_period as
select format([date],'MMMMMM') AS month , sum(amount) as total_sales_value
from [amazon india]
where status !='cancelled'
group by format([date],'MMMMMM')

select * from peak_period
order by total_sales_value desc
-----------------------------------------------------------------------------------------------------------------------
-- demographic analysis

create or alter view states_sales as
select ship_state as state , sum(amount) as total_sales_state,count(order_id) as orders_state
from [amazon india]
where status !='cancelled'
group by ship_state

select *
from states_sales
order by total_sales_state desc
                              ------------------------------------------
create or alter view product_per_state as
select ship_state as state , Product as product_name , sum(amount) as state_product_total
from [amazon india]
where Status !='cancelled'
group by ship_state , Product

select * from product_per_state
order by state_product_total desc
-----------------------------------------------------------------------------------------------------------------------
--inventory management 
create or alter view inventory as
select Product as product_name, size as ordered_size , sum(Qty) as total_qty_ordered
from [amazon india]
where Status != 'cancelled'
group by Product , size

select * from inventory
order by total_qty_ordered desc
                            --------------------------------------------------
create or alter view total_sales_month as
select format([date],'MMMM') AS month, sum(amount) as total_sales
from [amazon india]
where status != 'cancelled'
group by format([date],'MMMM')

select sum( total_sales) as total_sales_value
from total_sales_month

                                -------------------------------------------
create or alter view net_sales_orders_qty as
select SUM(amount) as net_sales , count (order_id) as net_orders_count , SUM(qty) as net_qty_sold
from [amazon india]
where Status != 'cancelled' and Status != 'damaged' and Status != 'lost in transit' 
and Status != 'rejected by buyer' and Status != 'renurned to seller'

select * from net_sales_orders_qty