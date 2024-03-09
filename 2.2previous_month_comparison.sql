-- After creating tables, I directly import my processed data(csv file attaced)

-- How does the ranking of the top 5 brands by receipts scanned for the recent month 
-- compare to the ranking for the previous month?


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
),
ranked_month as(
	select
	 name
	,receipt_id
	,datescanned
	, rank() over(partition by name order by date_trunc('month', datescanned) desc) as past_n_month
	from brand_date

),
count_brand as (
	select
	 name
	 ,past_n_month
	 , count(receipt_id) as brand_count
	from ranked_month
	group by name, past_n_month
),
ranked_brand as(
	select 
	 name
	,past_n_month
	,rank() over(partition by past_n_month order by brand_count desc) as top_n_brand
	from count_brand
)
select
 r1.name
 ,r1.top_n_brand as past_1_month_rank_for_top5_brand
 ,r2.top_n_brand as previous_month_rank_comparison

from ranked_brand as r1
left join ranked_brand as r2
on r1.name = r2.name and r1.past_n_month +1  = r2.past_n_month
where r1.top_n_brand <=5 and r1.past_n_month = 1
