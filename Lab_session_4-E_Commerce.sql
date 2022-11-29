create schema E_Commerce;
use E_Commerce;

/*Creating tables */
create table Supplier(SUPP_ID int primary key,
					  SUPP_NAME varchar(50) not null,
                      SUPP_CITY varchar(50) not null,
                      SUPP_PHONE varchar(50) not null);
                      
                      
create table Customer(CUS_ID int primary key,
			          CUS_NAME varchar(20) not null,
                      CUS_PHONE varchar(10) not null,
                      CUS_CITY varchar(30) not null,
                      CUS_GENDER char);
                      
create table Category(CAT_ID int primary key,
                      CAT_NAME varchar(20) not null);
                      
create table Product(PRO_ID int primary key,
                     PRO_NAME varchar(20) default "Dummy",
                     PRO_DESC varchar(60),
                     CAT_ID int ,
                     foreign key(CAT_ID) references Category(CAT_ID));
                     
create table Supplier_Pricing(PRICING_ID int primary key,
                              PRO_ID int,
                              SUPP_ID int,
                              SUPP_PRICE int default 0,
                              foreign key(PRO_ID) references Product(PRO_ID),
                              foreign key(SUPP_ID) references Supplier(SUPP_ID));

create table Orders(ORD_ID int primary key,
                    ORD_AMOUNT int not null,
                    ORD_DATE date not null,
                    CUS_ID int ,
                    foreign key(CUS_ID) references Customer(CUS_ID),
                    PRICING_ID int,
                    foreign key(PRICING_ID) references Supplier_Pricing(PRICING_ID));
                    
 create table Rating(RAT_ID int primary key ,
                     ORD_ID int,
                     foreign key(ORD_ID) references Orders(ORD_ID),
                     RAT_RATSTARS int not null);

		
/* Inserting values in all tables */
/* Supplier table */
INSERT INTO SUPPLIER Values(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER Values(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER Values(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER Values(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER Values(5,"Mittal Ltd.","Lucknow",'7898456532');

/* Customer table */
INSERT INTO CUSTOMER Values(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER Values(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER Values(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER Values(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER Values(5,"PULKIT",'7895999999',"LUCKNOW",'M');

/* Category table */
INSERT INTO CATEGORY Values(1,"BOOKS");
INSERT INTO CATEGORY Values(2,"GAMES");
INSERT INTO CATEGORY Values(3,"GROCERIES");
INSERT INTO CATEGORY Values(4,"ELECTRONICS");
INSERT INTO CATEGORY Values(5,"CLOTHES");

/* Product table */
INSERT INTO PRODUCT Values(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT Values(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT Values(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT Values(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT Values(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT Values(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT Values(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT Values(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT Values(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT Values(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT Values(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT Values(12,"Train Your Brain","By Shireen Stephen",1);

/* Supplier_Pricing table */
INSERT INTO SUPPLIER_PRICING Values(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING Values(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING Values(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING Values(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING Values(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING Values(6,12,2,780);
INSERT INTO SUPPLIER_PRICING Values(7,12,4,789);
INSERT INTO SUPPLIER_PRICING Values(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING Values(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING Values(10,4,2,999);
INSERT INTO SUPPLIER_PRICING Values(11,7,3,549);
INSERT INTO SUPPLIER_PRICING Values(12,7,4,529);
INSERT INTO SUPPLIER_PRICING Values(13,6,2,105);
INSERT INTO SUPPLIER_PRICING Values(14,6,1,99);
INSERT INTO SUPPLIER_PRICING Values(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING Values(16,5,2,2999);

/* Orders table */
INSERT INTO ORDERS Values(101,1500,"2021-10-06",2,1);
INSERT INTO ORDERS Values(102,1000,"2021-10-12",3,5);
INSERT INTO ORDERS Values(103,30000,"2021-09-16",5,2);
INSERT INTO ORDERS Values(104,1500,"2021-10-05",1,1);
INSERT INTO ORDERS Values(105,3000,"2021-08-16",4,3);
INSERT INTO ORDERS Values(106,1450,"2021-08-18",1,9);
INSERT INTO ORDERS Values(107,789,"2021-09-01",3,7);
INSERT INTO ORDERS Values(108,780,"2021-09-07",5,6);
INSERT INTO ORDERS Values(109,3000,"2021-09-10",5,3);
INSERT INTO ORDERS Values(110,2500,"2021-09-10",2,4);
INSERT INTO ORDERS Values(111,1000,"2021-09-15",4,5);
INSERT INTO ORDERS Values(112,789,"2021-09-16",4,7);
INSERT INTO ORDERS Values(113,31000,"2021-09-16",1,8);
INSERT INTO ORDERS Values(114,1000,"2021-09-16",3,5);
INSERT INTO ORDERS Values(115,3000,"2021-09-16",5,3);
INSERT INTO ORDERS Values(116,99,"2021-09-17",2,14);

/* Rating table */
INSERT INTO RATING Values(1,101,4);
INSERT INTO RATING Values(2,102,3);
INSERT INTO RATING Values(3,103,1);
INSERT INTO RATING Values(4,104,2);
INSERT INTO RATING Values(5,105,4);
INSERT INTO RATING Values(6,106,3);
INSERT INTO RATING Values(7,107,4);
INSERT INTO RATING Values(8,108,4);
INSERT INTO RATING Values(9,109,3);
INSERT INTO RATING Values(10,110,5);
INSERT INTO RATING Values(11,111,3);
INSERT INTO RATING Values(12,112,4);
INSERT INTO RATING Values(13,113,2);
INSERT INTO RATING Values(14,114,1);
INSERT INTO RATING Values(15,115,1);
INSERT INTO RATING Values(16,116,0);
                    
/* Queries */

/* 3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. */

select c.cus_gender as Gender,count(c.cus_id) as Total_Customers from customer c
inner join
(select cus_id from orders where ord_amount>=3000)as p on p.cus_id=c.cus_id group by c.cus_gender;



/* 4)	Display all the orders along with product name ordered by a customer having Customer_Id=2  */

 select Q.Ord_id as Order_Id,p.pro_name as Products,p.pro_desc as Descriptions from product p inner join
 (select o.ord_id,o.pricing_id,s.pro_id from orders o join supplier_pricing s on o.pricing_id=s.pricing_id where cus_id=2)
 as Q on Q.pro_id=p.pro_id;


/* 5)	Display the Supplier details who can supply more than one product.  */


 Select supplier.* from supplier where supp_id in
(select supp_id  from supplier_pricing group by supp_id having count(pro_id)>1);


/* 6)	Find the least expensive product from each category and print the table with 
		category id, name, product name and price of the product  */
        
  
select f.Cat_id,f.Cat_name,f.pro_name as Product,F.supp_price as Least_Price from
(select C.cat_id,C.cat_name,Q.pro_name ,Q.supp_price,rank()over(partition by C.cat_id order by Q.supp_price)as rnk 
from category C,     
(select s.pricing_Id,p.pro_id,p.pro_name,p.cat_id,s.supp_price from supplier_pricing s join product p on s.pro_id=p.pro_id)
as Q where Q.cat_id=C.cat_id )as F where rnk=1;

        
        
/* 7)	Display the Id and Name of the Product ordered after “2021-10-05”.  */

select Pro_id,pro_name as Product_Name from product where pro_id in
(select pro_id from supplier_pricing ,
(select pricing_id from orders where ord_date>"2021-10-05" )as p where supplier_pricing.pricing_id=p.pricing_id);



/* 8)	Display customer name and gender whose names start or end with character 'A'.  */

select cus_name,cus_gender from customer where cus_name like "%a" or cus_name like "a%";


/* 9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
        For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”,
        If rating >2 print “Average Service” else print “Poor Service”. */
        
 DELIMITER &&
 CREATE PROCEDURE Review()
 BEGIN
 select Q.Supplier_id,S.supp_name as Supplier_Name,Q.Rating ,
 case  
        when rating=5 then "Excellent Service "
        when rating>4 then "Good Service"
        when rating>2 then "Average Service"
        else "Poor Service"
 end as Type_Of_Service
 from Supplier S 
 join
 (select p.pricing_id,s.supp_id as Supplier_Id,avg(p.rat_ratstars) as Rating from supplier_pricing s 
 join
 (select orders.ord_id,rat_ratstars,pricing_id from rating,orders where rating.ord_id=orders.ord_id)
 as p on p.pricing_id=s.pricing_id group by s.supp_id )
 as Q on Q.Supplier_id=S.supp_id ;
 END &&
        
 CALL   e_commerce.Review();
				
                              
                            
                              
                              
                              
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                      
                      
                      
                      
                      
                      



