-- Berapa rata-rata umur customer jika dilihat dari marital statusnya
select
c."Marital_Status" ,
round(avg(c."Age"),0) as average_age
from customer c
where c."Marital_Status" is not null 
group by "Marital_Status" ;

-- Berapa rata-rata umur customer jika dilihat dari gender nya
select 
case 
	when c."Gender"  = 0 then 'Woman'
	when c."Gender"  = 1 then 'Man'
	else 'unknown'
end as gender_label,
round(avg(c."Age"),0) as average_age
from customer c 
group by "Gender";

-- Tentukan nama store dengan total quantity terbanyak
select
s."StoreName",
sum(t."Quantity") as quantity
from store s
inner join "transaction" t on s."StoreID" = t."StoreID" 
group by s."StoreName" 
order by quantity desc 
limit 1;

-- Tentukan nama produk terlaris dengan total amount terbanyak
select 
p."Product_Name",
sum(t."TotalAmount") as sub_total
from product p 
inner join "transaction" t on p."ProductID" = t."ProductID" 
group by p."Product_Name" 
order by sub_total desc 
limit 1;