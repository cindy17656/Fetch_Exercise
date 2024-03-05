
-- After creating tables, I directly import my processed data(csv file attaced)

-- What are the top 5 brands by receipts scanned for most recent month?


with items_with_brand as (
	select
	 p.name
	 ,p.brand_id
	 ,ri.receipt_id
	from products as p
	join receipt_items as ri
	 on p.barcode = ri.barcode or p.barcode = ri.userFlaggedBarcode
),
brand_date as(
	select
	 ib.name
	 , ib.brand_id
	 , ib.receipt_id
	 , r.datescanned 
	from items_with_brand as ib
	left join receipts as r
	 on ib.receipt_id = r.receipt_id
)
select 
 name as top_5_brand
 , brand_id
from brand_date 
where date_trunc('month', datescanned) in (select max(date_trunc('month', datescanned)) from brand_date)
group by 1,2
order by count(distinct receipt_id) desc
limit 5
