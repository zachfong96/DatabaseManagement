create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);


insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

select *
from courses
order by num asc;

create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);


insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

select *
from Prerequisites;

create or replace function PreReqsFor(int, refcursor) returns refcursor as 
$$
declare 
	vnum 	int:= $1;
	resultset 	refcursor:=$2;
begin 
	open resultset for 
                select preReqNum 
		from Prerequisites 
		where courseNum = vnum;
	return resultset;	
end;
$$
language plpgsql;



Select PreReqsFor(221, 'result');
fetch all from result;

create or replace function IsPreReqFor(int, refcursor) returns refcursor as 
$$
declare
        num int:=$1;
        resultset refcursor:=$2;
begin
        open resultset for 
                select courseNum
                from Prerequisites
                where num = PreReqNum;
        return resultset;
end;
$$
language plpgsql

 Select IsPreReqFor(220, 'results');
 fetch all from results;
           


