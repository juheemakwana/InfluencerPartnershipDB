--drop triggers
DROP TRIGGER IF EXISTS TRG_influencer on influencer ;
DROP TRIGGER IF EXISTS TRG_brand on brand ;
DROP TRIGGER IF EXISTS TRG_product on product ;
DROP TRIGGER IF EXISTS TRG_contract on contract ;
DROP TRIGGER IF EXISTS TRG_content on content_creation ;

DROP FUNCTION IF EXISTS trg_influencer() ;
DROP FUNCTION IF EXISTS trg_brand() ;
DROP FUNCTION IF EXISTS trg_product() ;
DROP FUNCTION IF EXISTS rg_contract() ;
DROP FUNCTION IF EXISTS trg_content() ;

--drop sequences
DROP SEQUENCE IF EXISTS influencer_id_seq ;
DROP SEQUENCE IF EXISTS brand_id_seq ;
DROP SEQUENCE IF EXISTS product_id_seq ;
DROP SEQUENCE IF EXISTS contract_id_seq ;
DROP SEQUENCE IF EXISTS content_id_seq ;

--drop views
DROP VIEW IF EXISTS InfluencerInfo ;
DROP VIEW IF EXISTS BrandInfo ;
DROP VIEW IF EXISTS ProductInfo ;
DROP VIEW IF EXISTS ContractInfo ;
DROP VIEW IF EXISTS PerformanceSummary ;

--drop indices
DROP INDEX IF EXISTS IDX_influencer_name ;
DROP INDEX IF EXISTS IDX_influencer_platform ;
DROP INDEX IF EXISTS IDX_brand_name ;
DROP INDEX IF EXISTS IDX_brand_industry ;
DROP INDEX IF EXISTS IDX_brand_contact_info ; 
DROP INDEX IF EXISTS IDX_product_name ;
DROP INDEX IF EXISTS IDX_product_brand_id_fk ;
DROP INDEX IF EXISTS IDX_product_category ;
DROP INDEX IF EXISTS IDX_product_price ;
DROP INDEX IF EXISTS IDX_product_rating ;
DROP INDEX IF EXISTS IDX_contract_brand_id_fk ;
DROP INDEX IF EXISTS IDX_contract_influencer_id_fk ;
DROP INDEX IF EXISTS IDX_contract_start_date ;
DROP INDEX IF EXISTS IDX_contract_end_date ;
DROP INDEX IF EXISTS IDX_contract_pay ;
DROP INDEX IF EXISTS IDX_content_influencer_id_fk ;
DROP INDEX IF EXISTS IDX_content_product_id_fk ;
DROP INDEX IF EXISTS IDX_content_creation_total_post_likes ;
DROP INDEX IF EXISTS IDX_content_creation_total_post_shares ;
DROP INDEX IF EXISTS IDX_content_creation_total_link_clicks ;
DROP INDEX IF EXISTS IDX_performance_influencer_id_fk ;
DROP INDEX IF EXISTS IDX_performance_product_id_fk ;
DROP INDEX IF EXISTS IDX_performance_metrics_total_posts ;
DROP INDEX IF EXISTS IDX_performance_metrics_total_shares ;
DROP INDEX IF EXISTS IDX_performance_metrics_products_sold ;
DROP INDEX IF EXISTS IDX_performance_metrics_revenue ;

--drop tables
DROP TABLE IF EXISTS performance_metrics ;
DROP TABLE IF EXISTS content_creation ;
DROP TABLE IF EXISTS contract ;
DROP TABLE IF EXISTS product ;
DROP TABLE IF EXISTS brand ;
DROP TABLE IF EXISTS influencer ;


--drop schema
DROP SCHEMA IF EXISTS Influencer_partnership CASCADE;

/*Create schema named project and tables*/
CREATE SCHEMA Influencer_partnership;
set search_path to Influencer_partnership;


--CREATE TABLES
--create influencer table
CREATE TABLE influencer (
	influencer_id	INT	PRIMARY KEY,
	first_name	VARCHAR(25)	NOT NULL,
	last_name	VARCHAR(25)	NOT NULL,
	platform	VARCHAR(25)	NOT NULL,
	follower_count	INT	NOT NULL,
	email	VARCHAR(50)	NOT NULL
);

--create brand table
CREATE TABLE brand (
	brand_id	INT	PRIMARY KEY,
	brand_name	VARCHAR(50)	NOT NULL,
	industry	VARCHAR(50)	NOT NULL,
	contact_info	VARCHAR(50)	NOT NULL,
	website	VARCHAR(100)	NOT NULL
);

--create product table
CREATE TABLE product (
	product_id	INT	PRIMARY KEY,
	product_name	VARCHAR(50)	NOT NULL,
	category	VARCHAR(50)	NOT NULL,
	price	NUMERIC(7,2)	NOT NULL,
	brand_id	INT	NOT NULL,
	manufacturer_country	VARCHAR(50)	NOT NULL,
	rating	NUMERIC(2,1)	NOT NULL,
	CONSTRAINT fk_product_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

--create contract table
CREATE TABLE contract(
	contract_id	INT	PRIMARY KEY,
	brand_id	INT	NOT NULL,
	influencer_id	INT	NOT NULL,
	start_date	DATE	NOT NULL,
	end_date	DATE	NOT NULL,
	pay	NUMERIC(7,2)	NOT NULL,
	signed_date	DATE	NOT NULL,
	CONSTRAINT fk_contract_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
	CONSTRAINT fk_contract_influencer FOREIGN KEY (influencer_id) REFERENCES influencer(influencer_id)
);

--create content_creation table
CREATE TABLE content_creation(
	post_id	INT	PRIMARY KEY,
	influencer_id	INT	NOT NULL,
	product_id	INT	NOT NULL,
	content_type	VARCHAR(50)	NOT NULL,
	date_posted	DATE	NOT NULL,
	discount_link	VARCHAR(255)	NOT NULL,
	total_post_likes	INT	NOT NULL,
	total_post_shares	INT	NOT NULL,
	total_link_clicks	INT	NOT NULL,
	CONSTRAINT fk_content_influencer FOREIGN KEY (influencer_id) REFERENCES	influencer(influencer_id),
	CONSTRAINT fk_content_product FOREIGN KEY (product_id) REFERENCES product(product_id)
);

--create performance_metrics table
CREATE TABLE performance_metrics (
	influencer_id	INT	NOT NULL,
	product_id	INT	NOT NULL,
	total_posts	INT	NOT NULL,
	total_shares	INT	NOT NULL,
	total_clicks	INT NOT NULL,
	products_sold	INT	NOT NULL,
	revenue	NUMERIC(8,2)	NOT NULL,
	PRIMARY KEY (influencer_id, product_id),
	CONSTRAINT fk_performance_influencer FOREIGN KEY (influencer_id) REFERENCES influencer(influencer_id),
	CONSTRAINT fk_performance_product FOREIGN KEY (product_id) REFERENCES product(product_id)
	
);

--CREATE INDICES
--influencer
--natural keys
CREATE INDEX IDX_influencer_name ON influencer(first_name, last_name) ;
--frequently queried
CREATE INDEX IDX_influencer_platform ON influencer(platform) ;

--brand
--natural keys
CREATE INDEX IDX_brand_name ON brand(brand_name) ;
--frequently queried
CREATE INDEX IDX_brand_industry ON Brand (industry);
CREATE INDEX IDX_brand_contact_info ON Brand (contact_info); 

--product
CREATE INDEX IDX_product_name ON product(product_name) ;
--foreign keys
CREATE INDEX IDX_product_brand_id_fk ON product(brand_id) ;
--frequently queried
CREATE INDEX IDX_product_category ON product(category);
CREATE INDEX IDX_product_price ON product(price);
CREATE INDEX IDX_product_rating ON product(rating);

--contract
--foreign keys
CREATE INDEX IDX_contract_brand_id_fk ON contract(brand_id) ;
CREATE INDEX IDX_contract_influencer_id_fk ON contract(influencer_id) ;
--frequently queried
CREATE INDEX IDX_contract_start_date ON contract(start_date);
CREATE INDEX IDX_contract_end_date ON contract(end_date);
CREATE INDEX IDX_contract_pay ON contract(pay);

--content
--foreign keys
CREATE INDEX IDX_content_influencer_id_fk ON content_creation(influencer_id) ;
CREATE INDEX IDX_content_product_id_fk ON content_creation(product_id) ;
--frequently queried
CREATE INDEX IDX_content_creation_total_post_likes ON content_creation(total_post_likes);
CREATE INDEX IDX_content_creation_total_post_shares ON content_creation(total_post_shares);
CREATE INDEX IDX_content_creation_total_link_clicks ON content_creation(total_link_clicks);

--performance metrics
--foreign keys
CREATE INDEX IDX_performance_influencer_id_fk ON performance_metrics(influencer_id) ;
CREATE INDEX IDX_performance_product_id_fk ON performance_metrics(product_id) ;
--frequently queried
CREATE INDEX IDX_performance_metrics_total_posts ON performance_metrics(total_posts);
CREATE INDEX IDX_performance_metrics_total_shares ON performance_metrics(total_shares);
CREATE INDEX IDX_performance_metrics_products_sold ON performance_metrics(products_sold);
CREATE INDEX IDX_performance_metrics_revenue ON performance_metrics(revenue);

--CREATE VIEWS
CREATE OR REPLACE VIEW InfluencerInfo AS
	SELECT influencer_id, first_name, last_name, platform, follower_count 
	FROM influencer ;

CREATE OR REPLACE VIEW BrandInfo AS
	SELECT brand_id, brand_name, industry, website
	FROM brand ;

CREATE OR REPLACE VIEW ProductInfo AS
	SELECT b.brand_name, p.product_id, p.product_name, p.category, p.price, p.rating
	FROM product p LEFT JOIN brand b
		ON p.brand_id = b.brand_id ;

CREATE OR REPLACE VIEW ContractInfo AS
	SELECT c.contract_id, b.brand_name, i.first_name, i.last_name, c.start_date, c.end_date
	FROM contract c LEFT JOIN brand b
		ON c.brand_id = b.brand_id
	LEFT JOIN influencer i
		ON c.influencer_id = i.influencer_id ;

CREATE OR REPLACE VIEW PerformanceSummary AS
	SELECT CONCAT(i.first_name, ' ', i.last_name) AS influencer_name, p.product_name, pm.total_posts, pm.total_shares, pm.products_sold, pm.revenue
	FROM performance_metrics pm LEFT JOIN influencer i
		ON pm.influencer_id = i.influencer_id
	LEFT JOIN product p
		ON pm.product_id = p.product_id ;

--CREATE SEQUENCES
--create sequence influencer_id_seq
CREATE SEQUENCE influencer_id_seq
	INCREMENT BY 1
	START WITH 101
	NO MAXVALUE
	MINVALUE 101
	NO CYCLE;

--create sequence brand_id_seq
CREATE SEQUENCE brand_id_seq
	INCREMENT BY 1
	START WITH 101
	NO MAXVALUE
	MINVALUE 101
	NO CYCLE;

--create sequence product_id_seq
CREATE SEQUENCE product_id_seq
	INCREMENT BY 1
	START WITH 4501
	NO MAXVALUE
	MINVALUE 4501
	NO CYCLE;

--create sequence contract_id_seq
CREATE SEQUENCE contract_id_seq
	INCREMENT BY 1
	START WITH 3101
	NO MAXVALUE
	MINVALUE 3101
	NO CYCLE;

--create sequence content_id_seq
CREATE SEQUENCE content_id_seq
	INCREMENT BY 1
	START WITH 10031
	NO MAXVALUE
	MINVALUE 10031
	NO CYCLE;

--create trigger functions
--create trigger function trg_influencer
CREATE OR REPLACE FUNCTION trg_influencer() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.influencer_id IS NULL THEN
        NEW.influencer_id := nextval('influencer_id_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--create trigger function trg_brand
CREATE OR REPLACE FUNCTION trg_brand() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.brand_id IS NULL THEN
        NEW.brand_id := nextval('brand_id_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--create trigger function trg_product
CREATE OR REPLACE FUNCTION trg_product() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.product_id IS NULL THEN
        NEW.product_id := nextval('product_id_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--create trigger function trg_contract
CREATE OR REPLACE FUNCTION trg_contract() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.contract_id IS NULL THEN
        NEW.contract_id := nextval('contract_id_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--create trigger function trg_content
CREATE OR REPLACE FUNCTION trg_content() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.post_id IS NULL THEN
        NEW.post_id := nextval('content_id_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--create triggers
--create trigger TRG_influencer
CREATE TRIGGER TRG_influencer
    BEFORE INSERT OR UPDATE ON influencer
    FOR EACH ROW
    EXECUTE FUNCTION trg_influencer();

--create trigger TRG_brand
CREATE TRIGGER TRG_brand
    BEFORE INSERT OR UPDATE ON brand
    FOR EACH ROW
    EXECUTE FUNCTION trg_brand();

--create trigger TRG_product
CREATE TRIGGER TRG_product
    BEFORE INSERT OR UPDATE ON product
    FOR EACH ROW
    EXECUTE FUNCTION trg_product();

--create trigger TRG_contract
CREATE TRIGGER TRG_contract
    BEFORE INSERT OR UPDATE ON contract
    FOR EACH ROW
    EXECUTE FUNCTION trg_contract();

--create trigger TRG_content
CREATE TRIGGER TRG_content
    BEFORE INSERT OR UPDATE ON content_creation
    FOR EACH ROW
    EXECUTE FUNCTION trg_content();

-- Check the status and creation details of objects related to the Influencer Partnership Management System
-- Check table details in the influencer_partnership schema
SELECT TABLE_NAME, 
       TABLE_SCHEMA, 
       TABLE_TYPE 
FROM information_schema.tables
WHERE TABLE_SCHEMA = 'influencer_partnership'
  AND TABLE_NAME IN ('influencer', 'content_creation', 'contract', 'brand', 'product', 'performance_metrics');

-- Check indices details in influencer_partnership schema
SELECT indexname AS INDEX_NAME, 
       tablename AS TABLE_NAME 
FROM pg_indexes
WHERE schemaname = 'influencer_partnership';

--Check Views details in influencer_partnership schema
SELECT TABLE_NAME AS VIEW_NAME 
FROM information_schema.views
WHERE TABLE_SCHEMA = 'influencer_partnership';

--Check trigger details in influencer_partnership schema
SELECT tgname AS TRIGGER_NAME, 
       relname AS TABLE_NAME 
FROM pg_trigger
JOIN pg_class ON pg_trigger.tgrelid = pg_class.oid
JOIN pg_namespace ON pg_class.relnamespace = pg_namespace.oid
WHERE pg_namespace.nspname = 'influencer_partnership';

--Check function details in influencer_partnership schema
SELECT routine_name AS FUNCTION_NAME,
       routine_type AS FUNCTION_TYPE,
       data_type AS RETURN_TYPE
FROM information_schema.routines
WHERE specific_schema = 'influencer_partnership';

-- Check for sequences in influencer_partnership schema
SELECT sequence_name 
FROM information_schema.sequences
WHERE sequence_schema = 'influencer_partnership';