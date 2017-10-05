select
  o_orderpriority,
  count(1) as order_count
from
  orders
where
  o_orderdate >= '1996-05-01'
and o_orderdate < '1996-08-01'
and exists (
  select
    DISTINCT l_orderkey 
  from
    lineitem
  where
    l_orderkey = o_orderkey
  and l_commitdate < l_receiptdate
  )
group by
  o_orderpriority
order by
  o_orderpriority;





