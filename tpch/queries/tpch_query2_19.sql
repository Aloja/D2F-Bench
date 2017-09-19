select
	sum(l_extendedprice * (1 - l_discount) ) as revenue
from
	lineitem l join part p
 	on 
	p.p_partkey = l.l_partkey    
where
	(
		p_brand = 'Brand#32'
		and p_container REGEXP 'SM CASE||SM BOX||SM PACK||SM PKG'
		and l_quantity >= 7 and l_quantity <= 17
		and p_size >= 1 and p_size <= 5
		and l_shipmode REGEXP 'AIR||AIR REG'
		and l_shipinstruct = 'DELIVER IN PERSON'
	) 
	or 
	(
		p_brand = 'Brand#35'
		and p_container REGEXP 'MED BAG||MED BOX||MED PKG||MED PACK'
		and l_quantity >= 15 and l_quantity <= 25
		and p_size >= 1 and p_size <= 10
		and l_shipmode REGEXP 'AIR||AIR REG'
		and l_shipinstruct = 'DELIVER IN PERSON'
	)
	or
	(
		p_brand = 'Brand#24'
		and p_container REGEXP 'LG CASE||LG BOX||LG PACK||LG PKG'
		and l_quantity >= 26 and l_quantity <= 36
		and p_size >= 1 and p_size <= 15
		and l_shipmode REGEXP 'AIR||AIR REG'
		and l_shipinstruct = 'DELIVER IN PERSON'
	);
