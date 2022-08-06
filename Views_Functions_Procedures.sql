--Using last class created database
use db_7pm_july;
/*
Views: 
a) Logical object for physical collection of tables
b) Also called as Window to the table or virtual object
c) Majorly used to get required rows and column from the tables
d) Contains single select statement without semi colon and order by clause
e) When user calls the view, it contacts tables and fetch the data
Syn:
--Creating
Create view <viewname> 
as
(single select statement)
--Calling view
select * from <viewname>

*/

--Create a view for hyd location data
create view vw_hyd
as
(
select * from human_resource.emp where eloc='hyd'
)
--Calling view 
select * from vw_hyd

--Create a view for che location data
create view vw_che
as
(
select * from human_resource.emp where eloc='che'
)
--Calling view 
select * from vw_che

--Conclusion: Multiple views required to provide multiple sets of data

/*
Function:
a) Perform set of operations [medium level] and return result [mandatory]
b) Takes input arguments
Syntax:

Create:
Create function <functionname>
returns <datatype>
as
operations
return <result>

Calling:
select * from <functioname>

*/
--Create a simple function which takes user input for location and provides respective location data
create function fn_loc (@loc varchar(30))
returns table
return select * from human_resource.emp where eloc=@loc;

--Calling function to get hyd data
select * from fn_loc('hyd')

--Calling function to get che data
select * from fn_loc('che')

--Conclusion: Multiple views required for multiple outputs, whereas single function sufficient
--			to get desired output

/*
Procedure:
a) Complex object inside database to perform set of operations [ more ]
b) Rich functionality implemented using this.
c) Takes input and output arguments
d) As it is complex scientists adopted a new mechanism to save compilation time.
  At the time of creation, system compiles and saves the code in a table, when we call
  procedure, it simply bypasses compilation and goes to execution. Hence, we use 
  EXEC or EXECUTE statements to work with procedures.

  Create procedure <procedurename> (arguments)
  as
  begin
  operations
  end;

  Calling:
  Exec or Execute <procedurename> <arguments>
  */
  --Creating procedure without arguments
  create procedure pr
  as
  begin
  select * from human_resource.emp;
  end;
  --Calling procedure
  exec pr

  --Creating procedure with user input for location
  create procedure pr1(@loc varchar(20))
  as
  begin
  select * from human_resource.emp where eloc=@loc;
  end;
  --Calling procedure
  exec pr1 'mum'

  --Conclusion: single procedure to get desired data