select * from emp_master;

select custno, 
	   custname, 
	   phone, 
	   address, 
	   to_char(joindate, 'yyyy-mm-dd'),
	   case when grade = 'A' then 'VIP'
	   		when grade = 'B' then '일반'
	   		else '직원' end grade,
	   city
	   from member_tbl_02;

//update.jsp
select custno, custname, phone, address
      , to_char(joindate, 'yyyy-mm-dd') joindate, grade
      , city from member_tbl_02;

//join
select a.custno, a.custname,  
	   case when grade = 'A' then 'VIP'
	   		when grade = 'B' then '일반'
	   		else '직원' end grade,
	   sum(b.price) price
	   from member_tbl_02 a, money_tbl_02 b
	   where a.custno = b.custno and nvl(b.price,0) > 0
	   		group by a.custno, a.custname, a.grade
	   		order by sum(b.price) desc;
	   		
//z_inquiry
select custno, custname, phone, address,
       to_char(joindate, 'yyyy-mm-dd') joindate, grade, city
       from member_tbl_02
       where custno=