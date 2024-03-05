select * 
from products 
where barcode in (
	select barcode
	from products
	group by 1
	having count(*)!= 1
)
order by barcode
