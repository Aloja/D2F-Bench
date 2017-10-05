-- create the target table
drop table if exists q4_order_priority_tmp;
CREATE TABLE q4_order_priority_tmp (O_ORDERKEY INT);
drop table if exists q4_order_priority;
CREATE TABLE q4_order_priority (O_ORDERPRIORITY STRING, ORDER_COUNT INT);

set mapred.min.split.size=536870912;

-- the query
INSERT OVERWRITE TABLE q4_order_priority_tmp 
select 
  DISTINCT l_orderkey 
from 
  lineitem 
where 
  l_commitdate < l_receiptdate;
  
INSERT OVERWRITE TABLE q4_order_priority 
select 
	o_orderpriority, 
	count(1) as order_count 
from 
  orders o join q4_order_priority_tmp t 
  on 
  o.o_orderkey = t.o_orderkey 
and o.o_orderdate >= '1996-05-01' 
and o.o_orderdate < '1996-08-01' 
group by o_orderpriority 
order by o_orderpriority;
