-- DB 생성
create database jobmarket;
use jobmarket;

-- 회원 테이블 
create table member (
	id				bigint primary key auto_increment,
    email			varchar(255) not null unique,
    name			varchar(255) not null,
    password		varchar(255) not null,
    account_date	datetime not null,
    member_type		enum('user', 'company') default 'user',
    state			enum('online', 'offline', 'withdraw') default 'offline'
);

-- 회사 테이블 
create table company (
	id				bigint primary key auto_increment,
	name			varchar(255) not null,
    address			varchar(255) not null,
    hompage			varchar(255) not null,
    phone_numbrer	varchar(255) not null,
    member_id		bigint not null,
    foreign key(member_id) references member(id)
);

-- 이력서 테이블 
create table resume (
	id				bigint primary key auto_increment,
	title			varchar(255) not null,
    contents		varchar(1000) not null,
    create_time		datetime not null,
    update_time		datetime,
    member_id		bigint not null,
    foreign key(member_id) references member(id)
);

-- 채용공고 테이블
create table job_posting (
	id				bigint primary key auto_increment,
	title			varchar(255) not null,
    contents		varchar(255) not null,
    career			varchar(1000) not null,
    salary			varchar(255) not null,
    category		varchar(255) not null,
    state			enum('hiring', 'deadline') default 'hiring',
    create_time		datetime not null,
    deadline		datetime not null,
    company_id		bigint not null,
    foreign key(company_id) references company(id)
);

-- 지원내역 테이블
create table appli_record (
	id				bigint primary key auto_increment,
    member_id		bigint not null,
    posting_id		bigint not null,
    appli_time		datetime not null,
    foreign key(member_id) references member(id),
    foreign key(posting_id) references job_posting(id)
);

-- 스크랩 테이블
create table scrap (
	id				bigint primary key auto_increment,
    member_id		bigint not null,
    posting_id		bigint not null,
    scrap_time		datetime not null,
    foreign key(member_id) references member(id),
    foreign key(posting_id) references job_posting(id)
);

-- 기업리뷰 테이블
create table review (
	id				bigint primary key auto_increment,
    rating			decimal(2, 2) not null,
    contents		varchar(1000) not null,
    create_time		datetime not null,
    update_time		datetime,
    member_id		bigint not null,
    company_id		bigint not null,
    foreign key(member_id) references member(id),
    foreign key(company_id) references company(id)
);

-- 태그 테이블
create table tag (
	id				bigint primary key auto_increment,
    contents		varchar(255)
);

-- 태그_리뷰 테이블
create table tag_review (
	id				bigint primary key auto_increment,
    tag_id			bigint not null,
    review_id		bigint not null,
    foreign key(review_id) references review(id),
    foreign key(tag_id) references tag(id)
);