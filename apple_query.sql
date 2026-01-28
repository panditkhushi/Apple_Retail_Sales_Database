1. List all products with their category and price.

Select p.Product_ID, p.Product_Name, c.category_name, p.Price
from products p
join category c on p.Category_ID = c.category_id;
	
Insights:
Helps you see what Apple sells, which items belong to which category, and their prices. This gives a clear idea of the product range and pricing.

2. Display all store names and their cities.

Select Store_Name, City, Country from stores;

Insights:
Tells you where Apple’s stores are located and helps understand which cities or countries have the most presence. Useful for checking market reach.

3. Show all sales where quantity sold > 5.

Select * from sales where quantity > 5;

Insights:
Finds big sales where customers bought more than 5 units. These could be bulk orders or high demand.

4. Find all products with a price greater than 1000.

Select Product_Name, Price from products where Price > 1000;

Insights:
Shows expensive or premium products like MacBooks or iPhones. Helps identify high-value items and pricing.


5. List all warranty claims that are pending.

Select claim_id, sale_id, repair_status from warranty where repair_status = 'Pending';

Insights:
Shows which warranty cases are not yet completed. Useful for customer service teams to track and solve pending issues.

6. Find total quantity of products sold per store.

Select s.store_id, SUM(s.quantity) as total_quantity
from sales s
group by s.store_id;

Insights:
Helps compare store performance which store sells more products and which sells less. Great for sales performance analysis.

7. Show total number of products sold per category.

Select c.category_name, SUM(sa.quantity) as total_sold
from sales sa
join products p on sa.product_id = p.Product_ID
join category c on p.Category_ID = c.category_id
group by c.category_name;

Insights:
Lets you see which product category sells the most overall. Useful for knowing customer presence.

8. Find top 5 best-selling products by quantity.

Select p.Product_Name, SUM(s.quantity) as total_sold
from sales s
join products p on s.product_id = p.Product_ID
group by p.Product_Name
order by total_sold desc
limit 5;

Insights:
Lets you see which product category (e.g., iPhone, iPad, Accessories) sells the most overall. Useful for knowing customer preferences.

9. List all products sold in stores located in New York.

Select distinct p.Product_Name,st.City
from sales sa
join stores st on sa.store_id = st.Store_ID
join products p on sa.product_id = p.Product_ID
where st.City = 'New York';

Insights:
Helps understand what people in New York are buying useful for local demand analysis or city-specific marketing.

10. Show total sales quantity per month for 2024.

Select 
    date_format(str_to_date(sale_date, '%d-%m-%Y'), '%Y-%m') as Month,
    sum(quantity) as total_sold
from sales
where year(str_to_date(sale_date, '%d-%m-%Y')) = 2024
group by Month
order by Month;

Insights:
Shows how sales changed each month in 2024. You can identify peak months and low months.

11. Find the product that generated the highest total revenue.

Select p.Product_Name, SUM(s.quantity * p.Price) as total_revenue
from sales s
join products p on s.product_id = p.Product_ID
group by p.Product_Name
order by total_revenue desc
limit 1;

Insights:
Tells which product brings in the most money (quantity × price). Helps know your biggest money maker.

12. Display the store with the highest average sales quantity.

Select st.Store_Name, avg(s.quantity) as avg_sales
from sales s
join stores st on s.store_id = st.Store_ID
group by st.Store_Name
order by avg_sales desc
limit 5;

Insights:
Finds the store that sells the most on average. Helps recognize top performing stores.

13. Find each store’s top selling product.

Select store_id, product_id, total_sold
from (
    Select s.store_id, s.product_id, SUM(s.quantity) as total_sold,
           rank() over(partition by s.store_id order by SUM(s.quantity) desc) as rnk
    from sales s
    group by s.store_id, s.product_id
) ranked
where rnk = 1;

Insights:
For every store, shows which product sells the most. Helps stores focus on their best selling items.

14.Find the number of stores in each city.

Select City, COUNT(Store_ID) as total_stores
from stores
group by City;

Insights:
Shows how many Apple stores are in each city. Helps understand city wise market presence.

15. List all products launched after January 1, 2023. 
	
Select Product_Name, Launch_Date
from products
where Launch_Date > '2023-01-01';

Insights:
Shows new Apple product launches after 2023. Useful for tracking recent products and new revenue sources.

16. Show all stores located in the United States.

Select Store_Name, City
from stores
where Country = 'United States';

Insights:
Lists all U.S. stores. Helps focus analysis only on U.S. market performance.


