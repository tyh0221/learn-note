1.创建机构表
select * from tyh_org for update;

org_id parent_org_id org_name   lst_mt
0      		     总公司     2017/9/8
1      0	     北京	2017/9/8
11     1	     北京王府井 2017/9/8
2      0	     上海	2017/9/8
21     2	     上海明珠塔 2017/9/8
22     2	     上海南京路 2017/9/8
3      0	     天津	2017/9/8
31     3	     天津津东支 2017/9/8
32     3	     天津塘沽支 2017/9/8

2.机构拉平处理

select r.org_id2,r.org_name2,q.org_id2,q.org_name2,q.org_id1,q.org_name1
from (select a.org_id org_id1,a.org_name org_name1,b.org_id org_id2,b.org_name org_name2 
from tyh_org a join tyh_org b
on a.parent_org_id=b.org_id
where b.parent_org_id is not null) q
join 
(select a.org_id org_id1,a.org_name org_name1,b.org_id org_id2,b.org_name org_name2 
from tyh_org a join tyh_org b
on a.parent_org_id=b.org_id
where b.parent_org_id is null) r
on q.org_id2=r.org_id1

org_id1   	org_name1   org_id2   org_name2     org_id3 org_name3
0	        总公司	    1	      北京	    11	    北京王府井
0	        总公司	    2	      上海	    21	    上海明珠塔
0	        总公司	    3	      天津	    31	    天津津东支
0	        总公司	    3	      天津	    32	    天津塘沽支
0	        总公司	    2	      上海	    22	    上海南京路
