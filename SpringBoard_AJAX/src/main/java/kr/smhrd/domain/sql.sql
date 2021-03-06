create table springboard(
	idx number not null,
	title varchar2(100) not null,
	content varchar2(2000) not null,
	writer varchar2(20) not null,
	indate date default sysdate,
	count number default 0,
	constraint pk_sb primary key(idx)
);

alter table springboard add memId varchar2(20);

create sequence sboard_seq
start with 1
increment by 1
maxvalue 100
cycle
nocache;

insert into springboard(idx, title, content, writer) values (sboard_seq.nextval, '제목1', '내용1', '관리자');
insert into springboard(idx, title, content, writer) values (sboard_seq.nextval, '제목2', '내용2', '김헌찬');

select * from springboard;

-- Member 테이블 생성
create table springmember(
	memId varchar2(20) not null,
	memPw varchar2(20) not null,
	memUser varchar2(20) not null,
	constraint pk_sm primary key(memId)
)

select * from springmember;

insert into springmember values ('smhrd1','smhrd1','김헌찬');
insert into springmember values ('smhrd2','smhrd2','헌찬킴');
insert into springmember values ('smhrd3','smhrd3','헌찬');







