create table players(
	pid char(4) not null,
	fname text, 
	lname text,
	address text,
	phonenum bigint,
Primary key (pid)
);

create table AssistantCoach (
	aid char(4) not null,
	fname text,
	lname text, 
	address text, 
	phonenum bigint,
	yearscoached int,
primary key (aid)
);

create table headcoach (
	cid char(4) not null,
	fname text,
	lname text,
	address text,
	phonenum bigint, 
	yearscoached int,
primary key (cid)
);

create table league_under_10 (
	le_id char(4) not null,
	pid char(4) not null references players(pid),
	cid char(4)not null references headcoach(cid),
	aid char(4) not null refernces AssistantCoach(aid),
primary key (le_id)
);

create table league_10 (
	lea_id char(4) not null,
	pid char(4) not null references players(pid),
	cid char(4)not null references headcoach(cid),
	aid char(4) not null refernces AssistantCoach(aid),
primary key (le_id)
);

create table league_10_through_14 (
	leag_id char(4) not null,
	pid char(4) not null references players(pid),
	cid char(4)not null references headcoach(cid),
	aid char(4) not null refernces AssistantCoach(aid),
primary key (le_id)
);

create table league_over_14 (
	lid char(4) not null,
	pid char(4) not null references players(pid),
	cid char(4)not null references headcoach(cid),
	aid char(4) not null refernces AssistantCoach(aid),
primary key (le_id)
);