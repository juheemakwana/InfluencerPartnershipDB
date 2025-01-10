set search_path to influencer_partnership;
--populate all tables
--influencer
INSERT INTO influencer (first_name, last_name, platform, follower_count, email)
	VALUES ('Alice','Smith','Instagram',50000,'alice.smith@hotmail.com') ;
INSERT INTO influencer (first_name, last_name, platform, follower_count, email)
	VALUES ('Bob', 'Johnson', 'YouTube', 150000, 'bob.johnson@gmail.com') ;
INSERT INTO influencer (first_name, last_name, platform, follower_count, email)
	VALUES ('Charlie', 'Williams', 'TikTok', 75000, 'charlie.williams@yahoo.com') ;
INSERT INTO influencer (first_name, last_name, platform, follower_count, email)
	VALUES ('Diana', 'Brown', 'Instagram', 120000, 'diana.brown@gmail.com') ;
INSERT INTO influencer (first_name, last_name, platform, follower_count, email)
	VALUES ('Ethan', 'Davis', 'YouTube', 200000, 'ethan.davis@gmail.com') ;
--INSERT INTO influencer (first_name, last_name, platform, follower_count, email)
--	VALUES () ;


--brand
INSERT INTO brand (brand_name, industry, contact_info, website)
	VALUES ('TechGadgets', 'Technology', 'contact@techgadgets.com', 'https://www.techgadgets.com') ;
INSERT INTO brand (brand_name, industry, contact_info, website)
	VALUES ('FashionHub', 'Fashion', 'info@fashionhub.com', 'https://www.fashionhub.com') ;
INSERT INTO brand (brand_name, industry, contact_info, website)
	VALUES ('HealthPlus', 'Healthcare', 'support@healthplus.com', 'https://www.healthplus.com') ;
INSERT INTO brand (brand_name, industry, contact_info, website)
	VALUES ('AutoDrive', 'Automotive', 'sales@autodrive.com', 'https://www.autodrive.com') ;
INSERT INTO brand (brand_name, industry, contact_info, website)
	VALUES ('Foodies', 'Food & Beverage', 'hello@foodies.com', 'https://www.foodies.com') ;
--INSERT INTO brand (brand_name, industry, contact_info, website)
--	VALUES () ;


--product
INSERT INTO product (product_name, category, price, brand_id, manufacturer_country, rating)
	VALUES ('Smartphone X', 'Electronics', 999.99, 101, 'USA', 4.5) ;
INSERT INTO product (product_name, category, price, brand_id, manufacturer_country, rating)
	VALUES ('Designer Dress', 'Apparel', 199.99, 102, 'Italy', 4.7) ;
INSERT INTO product (product_name, category, price, brand_id, manufacturer_country, rating)
	VALUES ('Vitamin Supplements', 'Health', 29.99, 103, 'Germany', 4.3) ;
INSERT INTO product (product_name, category, price, brand_id, manufacturer_country, rating)
	VALUES ('Electric Car Model S', 'Vehicles', 49999.99, 104, 'USA', 4.8) ;
INSERT INTO product (product_name, category, price, brand_id, manufacturer_country, rating)
	VALUES ('Organic Coffee', 'Beverages', 15.99, 105, 'Colombia', 4.6) ;
--INSERT INTO product (product_name, category, price, brand_id, manufacturer_country, rating)
--	VALUES () ;


--contract
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (101, 101, '2024-01-01', '2024-06-30', 5000.00, '2023-12-15') ;
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (102, 102, '2024-02-01', '2024-07-31', 7000.00, '2024-01-10') ;
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (103, 103, '2024-03-01', '2024-08-31', 6000.00, '2024-02-20') ;
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (104, 104, '2024-04-01', '2024-09-30', 8000.00, '2024-03-25') ;
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (105, 105, '2024-05-01', '2024-10-31', 5500.00, '2024-04-15') ;
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (101, 103, '2024-06-01', '2024-11-30', 7500.00, '2024-05-15') ;
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (102, 104, '2024-06-01', '2024-11-30', 7500.00, '2024-05-15') ;
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (103, 105, '2024-07-01', '2024-12-31', 9000.00, '2024-06-01') ;
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (104, 101, '2024-03-01', '2024-08-30', 4000.00, '2024-02-15') ;
INSERT INTO contract (brand_id, influencer_id, start_date, end_date, pay, signed_date)
	VALUES (105, 102, '2024-02-01', '2024-05-31', 7000.00, '2024-01-20') ;

--content_creation
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (101, 4501, 'Photo', '2024-01-15', 'https://www.techgadgets.com/smartphone-x-101', 1000, 150, 200) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (102, 4502, 'Long Form Video', '2024-02-20', 'https://www.fashionhub.com/designer-dress-102', 2000, 250, 300) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (102, 4502, 'Short Form Video', '2024-03-30', 'https://www.fashionhub.com/designer-dress-102', 2000, 250, 300) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (103, 4503, 'Short Form Video', '2024-03-25', 'https://www.healthplus.com/vitamin-supplements-103', 1500, 200, 250) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (104, 4504, 'Photo', '2024-04-30', 'https://www.autodrive.com/electric-car-model-s-104', 2500, 300, 400) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (105, 4505, 'Short Form Video', '2024-05-10', 'https://www.foodies.com/organic-coffee-105', 1800, 220, 280) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (105, 4505, 'Short Form Video', '2024-07-13', 'https://www.foodies.com/organic-coffee-105', 1600, 250, 300) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (105, 4505, 'Short Form Video', '2024-08-26', 'https://www.foodies.com/organic-coffee-105', 2000, 300, 430) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (103, 4501, 'Short Form Video','2024-07-13','https://www.techgadgets.com/smartphone-x-103', 1700, 130, 150) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (104, 4502, 'Photo', '2024-08-20', 'https://www.fashionhub.com/designer-dress-104', 5000, 430, 640) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (105, 4503, 'Long Form Video', '2024-09-25', 'https://www.healthplus.com/vitamin-supplements-105', 5700, 400, 1700) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (101, 4504, 'Photo', '2024-05-24', 'https://www.autodrive.com/electric-car-model-s-101', 1050, 100, 540) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (101, 4504, 'Short Form Video', '2024-07-24', 'https://www.autodrive.com/electric-car-model-s-101', 2070, 240, 1005) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (102, 4505, 'Long Form Video', '2024-05-10', 'https://www.foodies.com/organic-coffee-102', 3100, 420, 570) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (102, 4505, 'Short Form Video', '2024-07-10', 'https://www.foodies.com/organic-coffee-102', 2300, 260, 700) ;
INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
			discount_link, total_post_likes, total_post_shares, total_link_clicks)
	VALUES (101, 4501, 'Short Form Video', '2024-01-15', 'https://www.techgadgets.com/smartphone-x-101', 1300, 210, 370) ;
--INSERT INTO content_creation (influencer_id, product_id, content_type, date_posted, 
--			discount_link, total_post_likes, total_post_shares, total_link_clicks)
--	VALUES () ;

--performance_metrics
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (101, 4501, 2, 360, 570, 50, 49999.50);
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (102, 4502, 2, 500, 600, 30, 5999.70) ;
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (103, 4503, 1, 200, 250, 40, 1199.60) ;
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (104, 4504, 1, 300, 400, 20, 999999.80) ;
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (105, 4505, 3, 770, 1010, 60, 959.40) ;
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (103, 4501, 1, 130, 150, 30, 29999.70) ;
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (104, 4502, 1, 430, 640, 45, 8999.55) ;
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (105, 4503, 1, 400, 1700, 160, 4798.40) ;
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (101, 4504, 2, 340, 1545, 10, 499999.90) ;
INSERT INTO performance_metrics (influencer_id, product_id, total_posts, total_shares, 
			total_clicks, products_sold, revenue)
	VALUES (102, 4505, 2, 680, 1270, 230, 3677.70) ;