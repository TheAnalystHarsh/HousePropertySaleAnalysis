select *
from dbo.raw_sales

select *
from dbo.ma_lga

-- Verifying the data to be clean

select distinct propertyType
from dbo.raw_sales

select distinct postcode
from dbo.raw_sales

select distinct bedrooms
from dbo.raw_sales

-- Making sure that all postcode are of 4 character

select LEN(postcode) as numberOfCharacters, COUNT(postcode) as numberOfPostcode
from dbo.raw_sales
group by LEN(postcode)

-- Spliting date to form a year column seprately

alter table dbo.raw_sales
add year int

update dbo.raw_sales
set year = YEAR(datesold)

--Which date corresponds to highest number of sales

select top 1 datesold, COUNT(*)
from dbo.raw_sales
group by datesold
order by COUNT(*) desc

--Find out the post code with highest average price per sale

select top 1 postcode, AVG(price)
from dbo.raw_sales
group by postcode
order by AVG(price) desc

--Which year witnesses the lowest number of sales

select top 1 year, count(*)
from dbo.raw_sales
group by year
order by COUNT(*)

--Use the window function to deduce the top six postcodes by year's price.

SELECT YEAR(datesold) as year, postcode, price,
         dense_rank() OVER (PARTITION BY YEAR(datesold), postcode ORDER BY price DESC) rnk
INTO #sales2
FROM raw_sales

SELECT r.year, r.postcode, r.price
FROM(
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY year ORDER BY price DESC) row_num
    FROM #sales2
    WHERE rnk < 2) r
WHERE r.row_num BETWEEN 1 AND 6
