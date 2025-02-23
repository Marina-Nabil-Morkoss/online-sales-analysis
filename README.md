# online-sales-analysis


Case:
-----
This dataset provides detailed sales data from Online sales company, offering a comprehensive look at various products and their performance over time. It includes information on sales figures, order details, products, and customer demographics.

                          ------------------------------------------------
                          
data exploration (using python):
--------------------------------
	Data shape: 128976 row, 21 column 
	Columns are as follows:
•	index
•	Order ID
•	Date
•	Status
•	Fulfilment
•	Sales Channel
•	ship-service-level
•	Category
•	Size
•	Courier Status
•	Qty
•	currency
•	Amount
•	ship-city
•	ship-state
•	ship-postal-code
•	ship-country
•	B2B
•	fulfilled-by
•	New
•	PendingS


	Columns details as follows:
1	Column name: index
Type: int64
Count of null values: 0

2	Column name: Order ID
Type: object
Count of null values: 0

3	Column name: Date                
Type: object
Count of null values: 0
Dates for April, May, June and July 2022

4	Column name: Status              
Type: object
Count of null values: 0
Status includes: -Cancelled
                 -Pending
                 -Pending - Waiting for Pick Up
                 -Shipped
                 -Shipped – Damaged
                 -Shipped - Delivered to Buyer
                 -Shipped - Lost in Transit
                 -Shipped - Out for Delivery
                 -Shipped - Picked Up
                 -Shipped - Rejected by Buyer
                 -Shipped - Returned to Seller
                 -Shipped - Returning to Seller
                 -Shipping
     

5	Column name: Fulfilment
Type: object
Count of null values: 0
Fulfilment includes: - Amazon
                     - Merchant

6	Column name: Sales Channel       
Type: object
Count of null values: 0
Sales Channel includes: - Amazon.in
                        - Non-Amazon
7	Column name: ship-service-level  
Type: object
Count of null values: 0
ship-service-level includes: -Expedited 
                             -Urgent 
8	Column name: Category
Type: object
Count of null values: 0
Category includes: - Blazer
                   - Perfume
                   - Shirt
                   - Shoes
                   - Trousers
                   - T- Shirt
                   - Wallet
                   - Watch
                   
9	Column name: Size                
Type: object
Count of null values: 0
Size includes: - 3XL
               - 4XL
               - 5XL
               - 6XL
               - L
               - M
               - S
	             - XL
               - XS
               -XXL
               
10	Column name: Courier Status      
Type: object
Count of null values: 0
Courier Status includes: - on the way 
                         - cancelled
                         - shipped
                         - unshipped
                         
11	Column name: Qty                 
Type: int64
Count of null values: 0
Qty includes: 0,1,2,3,4,5,6,7,8,9,13,15

12	Column name: currency            
Type: object
Count of null values: 7,800
currency includes: INR

13	Column name: Amount
Type: float64
Count of null values: 7,800

14	Column name: ship-city           
Type: object
Count of null values: 35
ship-city written in many different ways: 
- sometimes written in upper case
- sometimes written in lower case
- sometimes write postal code with the city
- sometimes write full address 
- sometimes write city and state
- sometimes exists Spelling mistakes
- sometimes write city and street name 
- sometimes write city and extra spaces 
- sometimes write city and add point (.) or (,)
- no specific way to write ship-city
     
15	Column name: ship-state          
Type: object
Count of null values: 35
ship-state in different ways: - sometimes written in upper case
                              - sometimes written in lower case
                              - sometimes exists Spelling mistakes
16	Column name: ship-postal-code    
Type: float64
ship-postal-code of null values: 35

17	Column name: ship-country        
Type: object
Count of null values: 35
ship-country includes: IN

18	Column name: B2B
Type: Boolean
Count of null values: 0
B2B includes: - False 
              - True
              
19	Column name: fulfilled-by        
Type: object
Count of null values: 89613
fulfilled-by includes: Easy Ship

20	Column name: New                 
Type: float64
Count of null values: 128976

21	Column name: PendingS
Type: float64
Count of null values: 128976

                        -----------------------------------
                        
data cleaning (using python):
-----------------------------
	Changing the type of <Order ID> from object to string, removing ‘ -’, replacing ‘s’ by ‘5’ and 
rechange the type to be int64

	Check duplicates existence and its count = 168, removing these duplicates

	Deleting unneeded columns which are <index>, <new> and <pendings>

	Replace the majority unique values of < Status > as following:
•	Pending - Waiting for Pick Up’ to become 'Pending'
•	'Shipped - Damaged' to become 'Damaged'
•	'Shipped - Delivered to Buyer' to become 'Delivered'
•	'Shipped - Lost in Transit' to become 'Lost in Transit'
•	'Shipped - Out for Delivery' to become 'Out for Delivery'
•	'Shipped - Picked Up' to become 'Picked Up'
•	'Shipped - Rejected by Buyer' to become 'Rejected by Buyer'
•	'Shipped - Returned to Seller' to become 'Returned to Seller'
•	'Shipped - Returning to Seller' to become 'Returned to Seller'
•	'Shipping' to become 'Shipped'z
So, the unique values of < Status > are: Cancelled, Damaged, Delivered,Lost in Transit,
Out for Delivery,Pending,Picked Up,Rejected by Buyer,Returned to Seller,Shipped

	Rename < Fulfilment> column to become <Executor>

	Rename < ship-service-level > column to become < ship_level >

	Replace the unique value of < ship_level> as follows:
  'Expedited' to become 'Urgent'
   So, the unique values of < ship_level > are: Urgent, Standard

	Rename < Category> column to become < Product>

	Fill null values exist in <Currency> column by ‘Other_currency’
  So, the unique values of <Currency> are: INR , Other_currency

	Replace the unique values of < ship-state> as follows:
•	"ANDAMAN & NICOBAR" to become "Andaman and Nicobar Islands"
•	"ANDHRA PRADESH" to become "Andhra Pradesh"
•	"ARUNACHAL PRADESH" to become "Arunachal Pradesh"
•	"AR" to become "Arunachal Pradesh"
•	"ASSAM" to become "Assam"
•	"BIHAR" to become "Bihar"
•	"CHANDIGARH" to become "Chandigarh"
•	"CHHATTISGARH" to become "Chhattisgarh"
•	"DADRA AND NAGAR" to become "Dadra and Nagar Haveli and Daman and Diu"
•	"DELHI" to become "Delhi"
•	"GOA" to become "Goa"
•	"GUJARAT" to become "Gujarat"
•	"HARYANA" to become "Haryana"
•	"HIMACHAL PRADESH" to become "Himachal Pradesh"
•	"JAMMU & KASHMIR" to become "Jammu and Kashmir"
•	"JHARKHAND" to become "Jharkhand"
•	"KARNATAKA" to become "Karnataka"
•	"KERALA" to become "Kerala"
•	"LADAKH" to become "Ladakh"
•	"LAKSHADWEEP" to become "Lakshadweep"
•	"MADHYA PRADESH" to become "Madhya Pradesh"
•	"MAHARASHTRA" to become "Maharashtra"
•	"MANIPUR" to become "Manipur"
•	"MEGHALAYA" to become "Meghalaya"
•	"MIZORAM" to become "Mizoram"
•	"NAGALAND" to become "Nagaland"
•	"ODISHA" to become "Odisha"
•	"ORISSA" to become "Odisha"
•	"PONDICHERRY" to become "Puducherry"
•	"PUDUCHERRY" to become "Puducherry"
•	"PUNJAB" to become "Punjab"
•	"RAJASTHAN" to become "Rajasthan"
•	"SIKKIM" to become "Sikkim"
•	"TAMIL NADU" to become "Tamil Nadu"
•	"TELANGANA" to become "Telangana"
•	"TRIPURA" to become "Tripura"
•	"UTTAR PRADESH" to become "Uttar Pradesh"
•	"UTTARAKHAND" to become "Uttarakhand"
•	"WEST BENGAL" to become "West Bengal"
•	"APO" to become "Delhi"  
•	"NL" to become "Nagaland"
•	"New Delhi" to become "Delhi"
•	"Rajshthan" to become "Rajasthan"
•	"Rajsthan" to become "Rajasthan"
•	"Punjab/Mohali/Zirakpur" to become "Punjab"
•	"PB" to become "Delhi"
•	"RJ" to become "Rajasthan"
•	"bihar" to become "Bihar"
•	"delhi" to become "Delhi"
•	"goa" to become "Goa"
•	"orissa" to become "Odisha"
•	"punjab" to become "Punjab"
•	"rajasthan" to become "Rajasthan"
•	"rajsthan" to become "Rajasthan"
So, the unique values of < ship-state> are: 
Andaman and Nicobar Islands, Andhra Pradesh,Arunachal Pradesh,Arunachal Pradesh, Assam, Bihar, Chandigarh, Chhattisgarh, Dadra and Nagar Haveli and Daman and Diu,Delhi,Goa, Gujarat, Haryana, Himachal Pradesh, Jammu and Kashmir, Jharkhand, Karnataka, Kerala, Ladakh, Lakshadweep, Madhya Pradesh, Maharashtra, Manipur, Meghalaya, Mizoram, Nagaland, Odisha, Orissa,Pondicherry, Puducherry, Punjab, Rajasthan, Sikkim, Tamil Nadu, Telangana,Tripura, Uttar Pradesh, Uttarakhand, West Bengal

	Rename < fulfilled-by> column to become < Shipper>

	Fill null values exist in < Shipper > column by ‘cancelled’ in case status is cancelled , while fill null values  by Other Shipper in case status isn’t cancelled
  So, the unique values of < Shipper > are: Easy Ship, Other Shipper , Cancelled 

	Changing the type of <Date> from object to become Datetime

	Exists outliers in Amount 

	Fill null values by 0 in case status is cancelled, while in case status isn’t cancelled so fill null values 
by the median value 583.81

	Replace the unique value of < Sales Channel> as follows:
  'Non-Amazon' to become 'Other'
  So, the unique values are: Amazon.in, Other

	Recheck the final Data shape after cleaning is: 128775 row, 18 column.

                 ---------------------------------------------------------------
                 
 Retrieve data and get the following insights (using SQL):
----------------------------------------------------------
	sales analysis insight to show the total count of orders and total sales excluding cancelled orders for each product.

	Cancelled analysis insight to show the total count of orders and total cancelled orders value for each product.

	Damaged analysis insight to show the total count of orders and total damaged orders value for each product.

	Lost in transit analysis insight to show the total count of orders and total lost in transit orders value for each product.

	Rejected by buyer analysis insight to show the total count of orders and total rejected by buyer orders value for each product.

	Returned to seller analysis insight to show the total count of orders and total returned to seller orders value for each product.

	sales overtime analysis insight to show total sales for each product for March, April, May and June.

	peak period analysis insight to identify the highest total sales for which month.

	Inventory management analysis insight to identify the total sold quantity for each size of each product excluding cancelled orders.

	Total sales value insight for the whole period.

	Net sales, net orders count and net sold quantity excluding cancelled – damaged - lost in transit - rejected by buyer - returned to seller orders

                ----------------------------------------------------------------
                 
Data Analysis(using tableau):
----------------------------
** First: Dashboard **

	Net sales excluding cancelled, damaged, lost in transit, rejected buyer and rejected by seller orders amount is 73,057,526

	Net count of orders excluding cancelled, damaged, lost in transit, rejected buyer and rejected by seller orders is 110,454 

	Net sold quantity excluding cancelled, damaged, lost in transit, rejected buyer and rejected by seller orders is 110,802

	The highest net sales overtime is 1,121,079 on 4 May 2022

	The most sold product is T-Shirt as Net sold Quantity is 42,957 by value 36,322,277 (represent 49.72% of total net sales) from them 30,338 urgent orders and 12,533 
  standard orders (total orders = 42,871)

	The top 10 states based on net sales as follows:
1-	Maharashtra, net sales is 12,473,898 (represent 21.68% of total net sales)
2-	Karnataka, net sales is 9,828,670 (represent 17.08% of total net sales)
3-	Telangana, net sales is 6,384,366 (represent 11.10% of total net sales)
4-	Uttar Pradesh, net sales is 6,325,691(represent 10.99% of total net sales)
5-	Tamil Nadu, net sales is 6,058,237 (represent 10.53% of total net sales)
6-	Delhi, net sales is 4,150,621(represent 7.21% of total net sales)
7-	Kerala, net sales is 3,417,560 (represent 5.94% of total net sales)
8-	West Bengal, net sales is 3,269,694 (represent 5.68% of total net sales)
9-	Andhra Pradesh, net sales is 2,917,733 (represent 5.07% of total net sales)
10-	Haryana, net sales is 2,712,920 (represent 4.71% of total net sales)

	The least profitable 5 States based on net sales as follows:
1-	Pondicherry, net sales is 529
2-	Arunachal Pradesh, net sales is 602
3-	Orissa, net sales is 1,140
4-	Lakshadweep, net sales is 2,441
5-	Ladakh, net sales is 34,970

	The highest selling size for each product based on net sum of quantity is as follows:
•	Blazer, the highest sold size is “L” by total quantity 2,457 pc (represent 18.33% of total sold blazers)
•	Perfume is only “Free” size by total quantity 1,014 pc 
•	Shirt, the highest sold size is “L” by total quantity 7,621 pc (represent 17.84% of total sold shirts)
•	Shoes is “Free” size by total quantity 147 pc 
•	Socks, the highest sold size is “L” by total quantity 65 pc (represent 16.93% of total sold socks)
•	T-Shirt, the highest sold size is “M” by total quantity 7,934 pc (represent 18.47% of total sold t-shirts)
•	Trousers, the highest sold size is “XL” by total quantity 1,638 pc (represent 17.52% of total sold trousers)
•	Wallet is only “Free” size by total quantity 831 pc
•	Watch is only “Free” size by total quantity 3 pc

	The highest status is “Shipped” based on Total Sales value 51,270,771 for 77,705 order  (represent 60.34% of total orders)

	In most orders, the executer is “Amazon” by Total orders 78,120 (77,086 Urgent orders and 1,034 Standard order), while the executer is “Merchant” by Total orders 32,334 order by Standard ship level)

	The highest courier status is “shipped” (31,816 order for Easy Ship and 77,499 order for other shipper)
                    ------------------------------------------
**Second: Product report **

This report provides an overview of the values, order count, and total quantity for each product by different order statuses.
________________________________________
	Blazer:
The total value of cancelled orders for Blazers is 1,005,714, with 2,120 orders and a total quantity of 525. There is 1 damaged order worth 1,136, while delivered orders amount to 3,927,329 in value, covering 5,185 orders and 5,211 total quantity. One order was lost in transit with a value of 584. Orders out for delivery have a total value of 4,590 from 6 orders and 6 total quantity. Pending orders stand at 130,419 in value, with 171 orders and 172 total quantity. Picked-up orders have a total value of 138,016, with 186 orders and 187 total quantity. One order was rejected by the buyer, worth 899. Orders returned to the seller total 258,314 in value, covering 342 orders and the same quantity. The shipped orders have the highest value at 5,880,884, with 7,475 orders and 7,487 total quantity.

	Perfume
Cancelled Perfume orders total 58,474 in value, covering 145 orders and a total quantity of 37. Delivered orders amount to 167,170 in value, with 232 orders and 235 total quantity. Pending orders have a total value of 5,704, with 7 orders and the same quantity. Picked-up orders account for 1,022 in value from 2 orders and a total quantity of 2. Orders returned to the seller have a total value of 11,689, with 16 orders and the same quantity. The total value of shipped orders is 564,627, covering 755 orders and 754 in total quantity.

	Shirt
Cancelled orders for Shirts total 1,868,320 in value, with 7,240 orders and 2,249 total quantity. Delivered orders have the highest value at 4,866,543, covering 10,421 orders and 10,466 in total quantity. Lost in transit orders account for 998 in value, with 2 orders and 2 total quantity. Out for delivery orders have a value of 2,609, with 5 orders and the same quantity. Pending orders total 152,544 in value, with 320 orders and the same quantity.
This report provides insights into the order flow, highlighting the high volume of delivered orders while also indicating potential concerns with cancelled and returned orders.

	Shoes
The total value of cancelled orders for Shoes is 9,240, with 21 orders and a total quantity of 5. Delivered orders amount to 18,171 in value, covering 22 orders and 23 total quantity. There is 1 picked-up order worth 756, and 1 returned order to the seller valued at 998. The total value of shipped orders is 95,353, with 119 orders and 122 total quantity.

	Socks
Cancelled Socks orders total 14,945 in value, covering 59 orders and a total quantity of 14. Delivered orders amount to 50,950, with 139 orders and 142 total quantity. Pending orders stand at 1,186 in value, with 3 orders and the same quantity. Picked-up orders have a total value of 3,455, with 10 orders and the same quantity. Orders returned to the seller total 2,563 in value, covering 6 orders and the same quantity. The shipped orders have a total value of 84,889, with 222 orders and 223 total quantity.



	T-shirt
Cancelled orders for T-shirts total 3,464,861 in value, with 7,328 orders and 2,252 total quantity. Delivered orders have the highest value at 8,946,752, covering 10,623 orders and 10,654 in total quantity. Lost in transit orders account for 1,583 in value, with 2 orders and the same quantity. Out for delivery orders have a value of 17,254, with 19 orders and the same quantity. Pending orders total 305,611 in value, with 360 orders and the same quantity. Picked-up orders account for 350,029 in value from 406 orders and 408 total quantity. Rejected by buyer orders have a total value of 4,492, with 6 orders and the same quantity. Orders returned to the seller amount to 706,243 in value, with 837 orders and 840 total quantity. The total value of shipped orders is 25,996,389, covering 30,626 orders and 30,670 in total quantity.

	Trousers
Cancelled orders for Trousers amount to 443,726 in value, with 1,275 orders and a total quantity of 535. Delivered orders have a total value of 969,640, covering 1,917 orders and 1,921 total quantity. Orders out for delivery are valued at 2,518, with 5 orders and the same quantity. Pending orders total 41,125, with 74 orders and the same quantity. Picked-up orders amount to 33,641 in value, covering 69 orders and the same quantity. Orders rejected by buyers account for 815 in value, with 2 orders and the same quantity. Orders returned to the seller total 71,642 in value, with 132 orders and 136 total quantity. Shipped orders for Trousers have the highest value at 3,884,640, with 7,131 orders and 7,145 in total quantity.

	Wallet
Cancelled Wallet orders total 40,019 in value, covering 116 orders and 32 total quantity. Delivered orders have a total value of 88,947, with 169 orders and 172 total quantity. Pending orders stand at 2,167, with 4 orders and the same quantity. Picked-up orders total 689 in value, with 2 orders and the same quantity. Orders returned to the seller amount to 6,728, with 12 orders and the same quantity. Shipped orders for Wallets have a total value of 335,037, covering 623 orders and 641 in total quantity.

	Watch
Shipped orders for Watches total 915 in value, with 3 orders and the same quantity.
                    
                          --------------------------------------------------------------

Conclusion
----------
•	Delivered orders have the highest value and order count across all product categories.
•	Cancelled orders represent a significant portion of the total, especially for Shirts and Blazers.
•	Returned to Seller and Rejected by Buyer values indicate potential issues in customer satisfaction or delivery processes.
•	Pending orders indicate transactions that are still in progress and need follow-up.

                            -----------------------------------------------------
Recommendation
--------------
	As most orders are urgent, so increase the stock amount from the following products by these sizes:
•	“L” size for Blazer 
•	“L” size for Shirt
•	“L” size for Socks
•	“M” size for T-Shirt
•	“XL” size for Trousers

	Considering the less profitable states, increasing the sales through street advertisements, make offers to be announced on social media specially on Facebook and Instagram as it is the most used applications

	Excellent packages for product to avoid damage

	Tracking orders by GPS  through barcode to be inserted on the box and scanned to avoid losing in transit 

	Make a survey on social media for customers about your service rating and the cause of not purchasing from your company to enable identifying the problem and solve it  
                          


                           











