create table user(
id int not null auto_increment,
firstname varchar(10) not null,
lastname varchar(10) not null,
dob date not null,
gender varchar(10) not null,
phone int not null,
email varchar(50) not null,
password varchar(30) not null,
confirm_password varchar(30) not null,
primary key(id)
);
insert into user values
(null,"mani","kandan","1997-05-25","male",78542,"abc@gmail.com","abc123","abc123"),
(null,"surendar","kumar","1999-03-23","male",32566,"def@gmail.com","def123","def123"),
(null,"elaki","s","2005-08-15","female",98745,"ghi@gmail.com","ghi123","ghi123"),
(null,"somu","raj","2001-01-15","male",20014,"jkl@gmail.com","jkl123","jkl456"),
(null,"harini","sree","1996-02-14","female",36900,"mno@gmail.com","mno123","pqr123");

select * from user;

create table login_history(
lid int not null auto_increment,
id int not null,
login_time timestamp not null,
logout_time timestamp not null,
primary key(lid),
foreign key(id) references user(id)
);

insert into login_history values
(null,1,current_timestamp(),current_timestamp()),
(null,3,current_timestamp(),current_timestamp()),
(null,5,current_timestamp(),current_timestamp());
insert into login_history values
(null,1,current_timestamp(),current_timestamp()),
(null,2,current_timestamp(),current_timestamp()),
(null,3,current_timestamp(),current_timestamp()),
(null,4,current_timestamp(),current_timestamp());


select * from user;

select user.password,user.confirm_password,
case 
  when (user.password = user.confirm_password) then "DONE"
  else "ERR"
end as reg_status
from user;

update user set confirm_password="mno123" where user.id=5;

select * from login_history;

create view total as
select user.id,login_history.login_time,login_history.logout_time,timediff(login_history.logout_time,login_history.login_time)as total_hrs from user
inner join login_history on user.id=login_history.id;

select * from user;
select * from login_history;
select * from total;

select * from  total where id=1;

create table game_type(
gid int not null auto_increment,
game_name varchar(50) not null,
game_type varchar(50) not null,
primary key(gid)
);
insert into game_type values
(null,"ludo","version-2015"),
(null,"ludo","version-2019"),
(null,"carrom","version-2020"),
(null,"car race","version-2019"),
(null,"pupg","version-2018");

select * from game_type;

create table skills(
sid int not null auto_increment,
id int not null,
gid int not null,
matches int not null,
matches_win int not null,
matches_lose int not null,
levels int not null,
coins int not null,
energy int not null,
primary key(sid),
foreign key(gid) references game_type(gid),
foreign key(id) references user(id)
);
insert into skills values
(null,1,1,10,7,3,2,1000,4),
(null,1,4,17,12,5,3,300,5),
(null,3,5,6,2,4,1,450,4),
(null,4,2,34,23,11,5,2800,2),
(null,2,3,12,8,4,2,600,4),
(null,5,1,3,3,0,1,200,5);

select * from skills;

create view user_skill as
select user.id,user.firstname,user.lastname,skills.gid,skills.matches,skills.matches_win,skills.matches_lose,skills.levels,
skills.coins,skills.energy from user
inner join skills on skills.id=user.id;

select * from skills;
select * from user_skill where id=1;

create table characters(
cid int not null auto_increment,
id int not null,
character_name varchar(30) not null,
sid int not null,
primary key(cid),
foreign key(id) references user(id),
foreign key(sid) references skills(sid)
);
insert into characters values
(null,1,"rolex",1),
(null,2,"gamer",5),
(null,3,"rocky",3);

create table opponent(
oid int not null auto_increment,
id int not null,
opponent_name varchar(30) not null,
sid int not null,
primary key(oid),
foreign key(id) references user(id),
foreign key(sid) references skills(sid)
);
insert into opponent values
(null,4,"spider",4),
(null,5,"beater",6),
(null,1,"racer",2);

select * from characters;
select * from opponent;

create table game_method(
gmid int not null auto_increment,
id int not null,
method varchar(30) not null,
primary key(gmid),
foreign key(id) references user(id)
);
insert into game_method values
(null,1,"free trail"),
(null,2,"payment"),
(null,3,"payment"),
(null,4,"payment"),
(null,5,"free trail");

select * from game_method;

create table free_trail(
ftid int not null auto_increment,
id int not null,
gmid int not null,
finished_trail int not null,
trail_start_time timestamp not null,
primary key(ftid),
foreign key(id) references user(id),
foreign key(gmid) references game_method(gmid)
);
insert into free_trail values
(null,1,1,3,current_timestamp()),(null,5,5,5,current_timestamp());

select * from free_trail;

create table payment(
pid int not null auto_increment,
id int not null,
gmid int not null,
payment_method varchar(20) not null,
bank varchar(20) not null,
upi varchar(4) not null,
primary key(pid),
foreign key(id) references user(id),
foreign key(gmid) references game_method(gmid)
); 
insert into payment values
(null,2,2,"phone pay","canara","1234"),
(null,3,3,"gpay","sbi","5678"),
(null,4,4,"paytm","iob","9012");

select * from payment;
