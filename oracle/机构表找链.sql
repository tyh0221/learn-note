1.创建机构表
select * from tyh_org for update;

org_id parent_org_id org_name   lst_mt
0      		     	     总公司     2017/9/8
1      0	     	     北京		    2017/9/8
11     1	     	     北京王府井  2017/9/8
2      0	     	     上海		    2017/9/8
21     2	     	     上海明珠塔  2017/9/8
22     2	     	     上海南京路  2017/9/8
3      0	     	     天津		    2017/9/8
31     3	     	     天津津东支  2017/9/8
32     3	     	     天津塘沽支  2017/9/8

2.机构链化处理
select a.* 
from tyh_org a
start with a.org_id=2
connect by prior a.org_id=a.parent_org_id

org_id parent_org_id org_name   lst_mt
2      0	     	     上海		     2017/9/8
21     2	     	     上海明珠塔   2017/9/8
22     2	     	     上海南京路   2017/9/8

