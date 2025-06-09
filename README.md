<img src="https://capsule-render.vercel.app/api?type=waving&color=auto&height=250&section=header&text=7%20Team%20Job%20Market&desc=DB%20프로젝트&fontAlignY=35&descAlign=80&descAlignY=50&fontSize=80" />

## 📚 목차

- [📌 프로젝트 개요](#-프로젝트-개요)

- [🫂 팀원 소개](#-팀원-소개)

- [🛠️ 기반 기술](#%EF%B8%8F-기반-기술)

- [📄 테이블 명세서 및 요구사항 명세서](#-테이블-명세서-및-요구사항-명세서)
    
- [🗂️ WBS(Work Breakdown Structure)](#%EF%B8%8F-wbswork-breakdown-structure)
    
- [🧩 ERD 모델링](#-erd-모델링)
    
- [📌 구축 쿼리 (DDL)](#-구축-쿼리-ddl)

- [📌 프로시저 구현](#-프로시저-구현)
    
- [🧪 테스트](#-테스트)
    

## 📌 프로젝트 개요

### 채용 플랫폼 기반 데이터베이스 설계 (사람인 클론 DB)

이 프로젝트는 채용 사이트(예: 사람인)를 모델로 한 데이터베이스를 설계 및 구현하는 것을 목표로 합니다. 사용자, 기업, 채용공고, 지원 이력 등 주요 엔티티를 포함한 ERD 모델링과 DB 아키텍처를 수립하고, 이를 기반으로 테스트용 DML 쿼리를 작성합니다.


## 🫂 팀원 소개

<table align="center">
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/kishinoa"><img src="https://avatars.githubusercontent.com/u/109147221?v=4" width="100px;" alt=""/><br /><sub><b> 최승휘 </b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/jh-story"><img src="https://avatars.githubusercontent.com/u/189600163?v=4" width="100px;" alt=""/><br /><sub><b> 한주희 </b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/chaserChoi"><img src="https://avatars.githubusercontent.com/u/146907065?v=4" width="100px;" alt=""/><br /><sub><b> 최재혁 </b></sub></a><br /></td>
    </tr>
  </tbody>
</table>


## 🛠️ 기반 기술

<p align="center">
  <img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white" />
  <img src="https://img.shields.io/badge/ERDCloud-1F1F1F?style=for-the-badge&logo=cloud&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL%20Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/DataGrip-000000?style=for-the-badge&logo=datagrip&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=sqlite&logoColor=white" />
</p>


## 📄 테이블 명세서 및 요구사항 명세서

![requirement_statement_1](https://github.com/user-attachments/assets/f3e5c12f-6f44-44a5-93f1-c57533d88471)
![requirement_statement_2](https://github.com/user-attachments/assets/8eefa237-f1a0-4689-9983-7061393b32e3)
![requirement_statement_3](https://github.com/user-attachments/assets/59865f17-67d1-4515-8535-c439ab07c543)

[테이블 명세서](https://docs.google.com/spreadsheets/d/1hTqacqHRHbYbnGm-4wQmmA5KcH_lW9ZH21sl9GiFgTY/edit?gid=356922980#gid=356922980)

[요구사항 명세서](https://docs.google.com/spreadsheets/d/1hTqacqHRHbYbnGm-4wQmmA5KcH_lW9ZH21sl9GiFgTY/edit?gid=933404418#gid=933404418)


## 🗂️ WBS(Work Breakdown Structure)

![wbs](https://github.com/user-attachments/assets/ee96ccc6-54c3-4564-a292-d3ab4e0475fa)

[WBS 링크](https://docs.google.com/spreadsheets/d/1hTqacqHRHbYbnGm-4wQmmA5KcH_lW9ZH21sl9GiFgTY/edit?gid=0#gid=0)


## 🧩 ERD 모델링

![jeo3ePugp7CADroBu](https://github.com/user-attachments/assets/ed9d11ec-1453-4edf-8ab0-c659f78f169d)

[ERD Link](https://www.erdcloud.com/d/jeo3ePugp7CADroBu)


## 📌 구축 쿼리 (DDL)

<details>
<summary>🙆 회원 테이블</summary>
<div>

```sql
create table member (
    id			bigint primary key auto_increment,
    email			varchar(255) not null unique,
    name			varchar(255) not null,
    password		varchar(255) not null,
    account_date	datetime not null default CURRENT_TIMESTAMP,
    member_type		enum('user', 'company') default 'user',
    state			enum('online', 'offline', 'withdraw') default 'offline'
)
```

</div>
</details>
<details>
<summary>🏢 회사 테이블</summary>
<div markdown="1">

```sql
create table company (
    id			bigint primary key auto_increment,
    name			varchar(255) not null,
    address			varchar(255) not null,
    homepage		varchar(255) not null,
    phone_number	varchar(255) not null,
    member_id		bigint not null,
    foreign key(member_id) references member(id)
);
```

</div>
</details>
<details>
<summary>📋 이력서 테이블</summary>
<div markdown="1">

```sql
create table resume (
    id			bigint primary key auto_increment,
    title			varchar(255) not null,
    contents		varchar(1000) not null,
    create_time		datetime not null default CURRENT_TIMESTAMP,
    update_time		datetime,
    member_id		bigint not null,
    foreign key(member_id) references member(id)
);
```

</div>
</details>
<details>
<summary>📣 채용 공고 테이블</summary>
<div markdown="1">

```sql
create table job_posting (
    id			bigint primary key auto_increment,
    title			varchar(255) not null,
    contents		varchar(255) not null,
    career			varchar(1000) not null,
    salary			varchar(255) not null,
    category		varchar(255) not null,
    state			enum('hiring', 'deadline') default 'hiring',
    create_time		datetime not null default CURRENT_TIMESTAMP,
    deadline		datetime,
    company_id		bigint not null,
    foreign key(company_id) references company(id)
);
```

</div>
</details>
<details>
<summary>⏲ 지원 내역 테이블</summary>
<div markdown="1">

```sql
create table appli_record (
    id			bigint primary key auto_increment,
    resume_id		bigint not null,
    posting_id		bigint not null,
    appli_time		datetime not null default CURRENT_TIMESTAMP,
    result          enum('apply', 'passed', 'failed') not null default 'apply',
    foreign key(resume_id) references resume(id),
    foreign key(posting_id) references job_posting(id)
);
```

</div>
</details>
<details>
<summary>📎 스크랩 테이블</summary>
<div markdown="1">

```sql
create table scrap (
    id			bigint primary key auto_increment,
    member_id		bigint not null,
    posting_id		bigint not null,
    scrap_time		datetime not null default CURRENT_TIMESTAMP,
    foreign key(member_id) references member(id),
    foreign key(posting_id) references job_posting(id)
);
```

</div>
</details>
<details>
<summary>⭐ 기업 리뷰 테이블</summary>
<div markdown="1">

```sql
create table review (
    id			bigint primary key auto_increment,
    rating			decimal(2, 1) not null default 0.0,
    contents		varchar(1000) not null,
    create_time		datetime not null default CURRENT_TIMESTAMP,
    update_time		datetime,
    member_id		bigint not null,
    company_id		bigint not null,
    foreign key(member_id) references member(id),
    foreign key(company_id) references company(id)
);
```

</div>
</details>
<details>
<summary>🔖 태그 테이블</summary>
<div markdown="1">

```sql
create table tag (
    id			bigint primary key auto_increment,
    contents		varchar(255)
);
```

</div>
</details>
<details>
<summary>🔖 태그 리뷰 테이블</summary>
<div markdown="1">

```sql
create table tag_review (
    id			bigint primary key auto_increment,
    tag_id			bigint not null,
    review_id		bigint not null,
    foreign key(review_id) references review(id),
    foreign key(tag_id) references tag(id)
);
```

</div>
</details>


## 📌 프로시저 구현

<details>
<summary>🙆 회원 프로시저</summary>
<div>    
<details>  
<summary> 회원 가입 </summary>
    
```sql
delimiter //
CREATE PROCEDURE signup (in emailInput varchar(255), in nameInput varchar(255), in passwordInput varchar(255), in typeInput int)
begin
	if (select 1=1 from member where email = emailInput) then
		signal sqlstate '45000' set message_text = '이미 가입된 계정입니다.';
	else 
		if typeInput = 0 then
			insert into member(email, name, password) values(emailInput, nameInput, passwordInput);
            select '개인계정 가입 완료!' as message;
		else 
			insert into member(email, name, password, member_type) values(emailInput, nameInput, passwordInput, 'company');
            select '회사계정 가입 완료!' as message;
		end if;
	end if;
end //
delimiter ;
```

```sql
call signup('aa@naver.com', '호날두', '1234', 0);
call signup('ab@naver.com', '손흥민', '1234', 0);
call signup('ac@naver.com', '김민재', '1234', 0);
call signup('ad@naver.com', '메시', '1234', 1);
call signup('ae@naver.com', '홍명보', '1234', 1);
```

![회원_등록](https://github.com/user-attachments/assets/dd52741d-81ce-48cf-9937-88d74274ec56)

</details>
<details>
    
<summary> 로그인 </summary>
    
```sql
-- 로그인 프로시저
delimiter //
create procedure login (in emailInput varchar(255), in passwordInput varchar(255))
begin
	select password into @password from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @password = passwordInput then
			update member set state = 'online' where email = emailInput;
			select '로그인 완료!' as message;
		else
			signal sqlstate '45000' set message_text = '비밀번호가 틀렸습니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;
```

```sql
call login('aa@naver.com', '1234');
```

![로그인](https://github.com/user-attachments/assets/e210efa2-6bee-405c-8f10-2373390c7e89)

</details>
<details>
    
<summary> 로그아웃 </summary>
    
```sql
-- 로그아웃 프로시저
delimiter //
create procedure logout (in emailInput varchar(255), in passwordInput varchar(255))
begin
	select password, state into @password, @state from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @password = passwordInput then
			if @state = 'online' then
				update member set state = 'offline' where email = emailInput;
				select '로그아웃 완료!' as message;
			else
				signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '비밀번호가 틀렸습니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;
```

```sql
call logout('aa@naver.com', '1234');
```

![로그아웃](https://github.com/user-attachments/assets/8e6f551b-4831-48d1-9108-f980b539fc19)

</details>
<details>
    
<summary> 유저 정보 수정 </summary>
    
```sql
-- 유저 정보 수정 프로시저
delimiter //
create procedure userupdate (in emailInput varchar(255), in nameInput varchar(255), in passwordInput varchar(255))
begin
	select state into @state from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'online' then
			update member set name = nameInput, password = passwordInput where email = emailInput;
			select '회원정보 수정 완료!' as message;
		else
			signal sqlstate '45000' set message_text = '오프라인 상태입니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;
```

```sql
call userupdate('aa@naver.com', '호날두', '0123');
```

![유저_정보_수정](https://github.com/user-attachments/assets/62df38c0-3609-40e3-8609-9d8bc21a222e)

</details>
<details>
    
<summary> 회원 탈퇴 </summary>
    
```sql
-- 회원 탈퇴 프로시저
delimiter //
create procedure withdrawal (in emailInput varchar(255), in passwordInput varchar(255))
begin
	select state, password into @state, @password from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'online' then
			if @password = passwordInput then
				update member set state = 'withdraw' where email = emailInput;
				select '회원 탈퇴 완료!' as message;
			else
				signal sqlstate '45000' set message_text = '비밀번호가 틀렸습니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '오프라인 상태입니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;
```

```sql
call withdrawal('aa@naver.com', '0123');
```

![회원_탈퇴](https://github.com/user-attachments/assets/23d23bc0-8600-4e04-83c0-3bf6e7d045c5)

</details>
<details>
    
<summary> 회원 복구 </summary>
    
```sql
-- 회원 복구 프로시저
delimiter //
create procedure recovery (in emailInput varchar(255), in passwordInput varchar(255))
begin
	select state, password into @state, @password from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'withdraw' then
			if @password = passwordInput then
				update member set state = 'offline' where email = emailInput;
				select '회원복구 완료!' as message;
			else
				signal sqlstate '45000' set message_text = '비밀번호가 틀렸습니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '탈퇴한 계정이 아닙니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '탈퇴한 계정이 아닙니다.';
	end if;
end //
delimiter ;
```

```sql
call recovery('aa@naver.com', '0123');
```

![회원_복구](https://github.com/user-attachments/assets/5d2d4054-69e7-45f5-9c1c-485bc62eeec3)

</details>
</div>
</details>

<details>
<summary>🏢 회사 프로시저</summary>
<div markdown="1">

<details>  
<summary> 회사 정보 등록 & 수정 </summary>
    
```sql
-- 회사 정보 등록 and 수정 프로시저
delimiter //
create procedure companyinup (in emailInput varchar(255), in companynameInput varchar(255), in addressInput varchar(255), in homepageInput varchar(255), in phonenumInput varchar(255))
begin
	select state, member_type, id into @state, @type, @id from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'online' then
			if @type = 'company' then
				if (select 1=1 from company where member_id = @id) then
					update company set name = companynameInput, address = addressInput, homepage = homepageInput, phone_number = phonenumInput where member_id = @id;
					select '회사정보 수정 완료!' as message;
				else
					insert into company(name, address, homepage, phone_number, member_id) values(companynameInput, addressInput, homepageInput, phonenumInput, @id);
					select '회사정보 등록 완료!' as message;
				end if;
			else
				signal sqlstate '45000' set message_text = '회사 계정만 등록 가능';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인상태가 아닙니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;
```

```sql
-- 등록
call companyinup('ad@naver.com', '바르셀로나', '스페인 바르셀로나', 'www.ad.com', '010-1234-5678');

-- 수정 (프로시저 같음)
call companyinup('ad@naver.com', '바르셀로나', '스페인 바르셀로나', 'www.ad.com', '010-1234-1234');
```

![회사_정보_등록](https://github.com/user-attachments/assets/05c5db8b-55b7-4976-b135-e9f4add1e74f)

![회사_수정](https://github.com/user-attachments/assets/10b0d88b-2d60-4f8c-979d-c6df71c48a9c)

</details>
<details>
    
<summary> 회사 정보 삭제 </summary>
    
```sql
-- 회사 정보 삭제 프로시저
delimiter //
create procedure companydel (in emailInput varchar(255))
begin
	select state, member_type, id into @state, @type, @id from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'online' then
			if @type = 'company' then
				if (select 1=1 from company where member_id = @id) then
					delete from company where member_id = @id;
					select '회사 정보 삭제 완료!' as message;
				else
					signal sqlstate '45000' set message_text = '등록한 회사 정보가 없음';
				end if;
			else
				signal sqlstate '45000' set message_text = '회사 계정만 삭제 가능';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;
```

```sql
call companydel('ad@naver.com');
```

![회사_삭제](https://github.com/user-attachments/assets/741a9363-4f33-4732-b569-3eb2a29558a9)

</details>
</div>
</details>

<details>
<summary>📋 이력서 프로시저</summary>
<div markdown="1">

<details>  
<summary> 이력서 등록 </summary>
    
```sql
-- 이력서 등록 프로시저
-- 개인 계정 -> 이력서 등록 (제목, 내용)
DELIMITER //
create procedure RESUME_001(
    in titleInput varchar(255),
    in contentsInput varchar(1000),
    in memberIdInput bigint
)
begin
    if exists(select 1 from member where id = memberIdInput and member_type = 'user' and state = 'online') then
        if (select 1 from resume where member_id = memberIdInput and title = titleInput) then
            -- 이미 등록된 이력서 제목이 존재하는 경우 오류 발생
            signal sqlstate '45000' set message_text = '이미 등록된 이력서 제목이 존재합니다.';
        else
            insert into resume (title, contents, member_id)
                values (titleInput, contentsInput, memberIdInput);

            -- 이력서 등록 성공 메세지
            select '이력서 등록 완료!' as message;
        end if;
    else
        -- 개인 계정이 아닌 경우 오류 발생
        signal sqlstate '45000' set message_text = '개인 계정만 등록 가능!';
    end if;
end //
delimiter ;
```

```sql
call RESUME_001('이력서1', '바르셀로나 지원합니다.', 1);
call RESUME_001('이력서2', '국가대표 공격수 지원합니다.', 2);
call RESUME_001('이력서3', '국가대표 수비수 지원합니다.', 3);
```

![이력서_등록](https://github.com/user-attachments/assets/95aa9992-c1d0-4407-85b5-dc434d025f4b)

</details>
<details>
    
<summary> 이력서 수정 </summary>
    
```sql
-- 이력서 수정 프로시저
-- 이력서 내용 수정
delimiter //
create procedure RESUME_002(
    in memberIdInput bigint, 
    in idInput bigint,
    in titleInput varchar(255),
    in contentsInput varchar(1000))
begin
    -- 이력서 ID가 존재하는지 확인
    if exists(select 1 from member where id = memberIdInput and member_type = 'user' and state = 'online') then
        update resume
        set title = titleInput,
            contents = contentsInput,
            update_time = CURRENT_TIMESTAMP
        where id = idInput;

        select '이력서가 수정되었습니다.' as message;
    else
        -- 개인 계정이 아닌 경우 오류 발생
        signal sqlstate '45000' set message_text = '개인 계정 및 online 상태만 수정 가능!';
    end if;
end //
delimiter ;
```

```sql
call RESUME_002(3, 3, '이력서4', '국가대표 수비수 지원합니다.');
```

![이력서_수정](https://github.com/user-attachments/assets/89e552f1-8f08-45b1-8072-30c122e4b75d)

</details>
<details>
    
<summary> 이력서 삭제 </summary>
    
```sql
-- 이력서 삭제 프로시저
-- ✔️ 회사 계정 → 공고 삭제
delimiter //
create procedure RESUME_003(
    in memberIdInput bigint, 
    in idInput bigint
)
begin
    if exists(select 1 from member where id = memberIdInput and member_type = 'user' and state = 'online') then
        delete from resume
        where id = idInput;

        select '이력서가 삭제되었습니다.' as message;
    else
        -- 개인 계정이 아닌 경우 오류 발생
        signal sqlstate '45000' set message_text = '개인 계정 및 online 상태만 삭제 가능!';
    end if;
end //
delimiter ;
```

```sql
call RESUME_003(3, 3);
```

![이력서_삭제](https://github.com/user-attachments/assets/bf7a025d-c5f5-471c-ba8f-b31541d7cd6d)

</details>

</div>
</details>

<details>
<summary>📣 채용 공고 프로시저</summary>
<div markdown="1">

<details>  
<summary> 공고 등록 </summary>
    
```sql
-- 공고 등록 프로시저
-- ✔️ 회사 계정 → 공고 등록 가능
-- 제목, 내용, 경력, 연봉, 마감시간, 카테고리, 상태
delimiter //
create procedure POSTING_001(
    IN memberIdInput BIGINT,
    IN titleInput VARCHAR(255),
    IN contentsInput VARCHAR(255),
    IN careerInput VARCHAR(1000),
    IN salaryInput VARCHAR(255),
    IN categoryInput VARCHAR(255),
    IN deadlineInput DATETIME
)
begin
    -- 회사 계정 ID 변수
    declare v_company_id bigint;

    -- 회사 계정 확인
    if exists(select 1 from member where id = memberIdInput and member_type = 'company' and state = 'online') then
        -- 회사 ID 조회
        select id into v_company_id from company where member_id = memberIdInput;

        -- 채용 공고 등록
        insert into job_posting(title, contents, career, salary, category, deadline, company_id)
            VALUES (titleInput, contentsInput, careerInput, salaryInput, categoryInput, deadlineInput, v_company_id);
    else
        -- 회사 계정이 아닌 경우 오류 발생
        signal sqlstate '45000' set message_text = '회사 계정만 등록 가능';
    end if;
end //
delimiter ;
```

```sql
call POSTING_001(4, '선수모집', '선수 구합니다', '1년', '3000만원', '스포츠', '2025-06-10');
call POSTING_001(5, '국가대표 모집', '선수 구합니다', '1년', '3000만원', '스포츠', '2025-06-09');
```

![공고_등록](https://github.com/user-attachments/assets/d59500f8-6ca7-4d48-b1ef-6d6d56b1809a)

</details>
<details>
    
<summary> 공고 수정 </summary>
    
```sql
-- 공고 수정 프로시저
-- ✔️ 회사 계정 → 원하는 공고 수정 가능
-- 제목, 내용, 경력, 연봉, 마감시간, 카테고리
delimiter //
create procedure POSTING_002(
    in memberIdInput bigint,
    in postingIdInput bigint,
    in titleInput varchar(255),
    in contentsInput varchar(255),
    in careerInput varchar(1000),
    in salaryInput varchar(255),
    in categoryInput varchar(255),
    in deadlineInput datetime
)
begin
    -- 회사 계정 ID 변수
    declare v_company_id bigint;

    -- 회사 계정 확인
    if exists(select 1 from member where id = memberIdInput and member_type = 'company' and state = 'online') then
        select id into v_company_id from company where member_id = memberIdInput;

        -- 공고 ID & 회사 ID 일치한지 확인
        if exists(select 1 from job_posting where id = postingIdInput and company_id = v_company_id) then
            update job_posting
            set title = titleInput,
                contents = contentsInput,
                career = careerInput,
                salary = salaryInput,
                category = categoryInput,
                deadline = deadlineInput
            where id = postingIdInput;
        else
            -- 공고가 존재하지 않거나 수정 권한이 없는 경우(회사ID 다른 경우) 오류 발생
            signal sqlstate '45000' set message_text = '수정 권한이 없거나 존재하지 않는 공고입니다.';
        end if;
    else
        -- 회사 계정이 아닌 경우 오류 발생
        signal sqlstate '45000' set message_text = '회사 계정만 수정 가능!';
    end if;
end //
delimiter ;
```

```sql
call POSTING_002(4, 1, '선수모집', '선수 구합니다', '1년', '3500만원', '스포츠', '2025-06-10');
```

![공고_수정](https://github.com/user-attachments/assets/beab0ec5-fb90-4fb6-924c-5d854bd1bbcf)

</details>
<details>
    
<summary> 공고 상태 변경 </summary>
    
```sql
-- 공고 상태 변경 프로시저
-- ✔️ 회사 계정 → 공고 마감시간 지날 시에 상태 변경
# (기본은 고용중(hiring) > 마감(deadline)으로 상태 변경)
delimiter //
create procedure POSTING_003()
begin
    update job_posting
    set state = 'deadline'
    where deadline < now()
    and state = 'hiring';
end //
delimiter ;
```

```sql
call POSTING_003();
```

![공고_상태_등록](https://github.com/user-attachments/assets/609e72f5-c132-4329-9275-c32e523de93d)

</details>
<details>
    
<summary> 공고 삭제 </summary>
    
```sql
-- 공고 삭제 프로시저
-- ✔️ 회사 계정 → 공고 삭제
delimiter //
create procedure POSTING_004(
    in memberIdInput bigint,
    in postingIdInput bigint
)
begin
    -- 회사 계정 ID 변수
    declare v_company_id bigint;

    -- 회사 계정 확인
    if exists(select 1 from member where id = memberIdInput and member_type = 'company' and state = 'online') then
        select id into v_company_id from company where member_id = memberIdInput;

        -- 공고 ID & 회사 ID 일치한지 확인
        if exists(select 1 from job_posting where id = postingIdInput and company_id = v_company_id) then
            delete from job_posting where id = postingIdInput;
        else
            -- 공고가 존재하지 않거나 삭제 권한이 없는 경우(회사ID 다른 경우) 오류 발생
            signal sqlstate '45000' set message_text = '삭제 권한 없거나 존재하지 않는 공고입니다!';
        end if;
    else
        -- 회사 계정이 아닌 경우 오류 발생
        signal sqlstate '45000' set message_text = '회사 계정만 삭제 가능!';
    end if;
end //
delimiter ;
```

```sql
call POSTING_004(5, 2);
```

![공고_삭제](https://github.com/user-attachments/assets/83d57fd1-bd4f-4d2a-914f-a1d1496d0e04)

</details>

</div>
</details>

<details>
<summary>⏲ 지원 내역 프로시저</summary>
<div markdown="1">

<details>
    
<summary> 이력서 지원 </summary>
    
```sql
-- 지원 내역 프로시저
-- 이력서 지원
-- ✔️ 사용자의 이력서를 공고에 지원
delimiter //
create procedure APPLY_001(
    in memberIdInput bigint,
    in resumeIdInput bigint,
    in postingIdInput bigint
)
begin
    declare v_resume_owner bigint;
    declare v_deadline datetime;

    -- 회원 상태 확인
    IF EXISTS (
        select 1 from member
        where id = memberIdInput and state = 'online'
    ) then
        -- 이력서 소유자 확인
        select member_id into v_resume_owner from resume where id = resumeIdInput;
        select deadline into v_deadline from job_posting where id = postingIdInput;

        if v_resume_owner = memberIdInput then
            if v_deadline is null or v_deadline > now() then
                insert into appli_record (resume_id, posting_id)
                values (resumeIdInput, postingIdInput);
            else
                signal sqlstate '45000'
                    set message_text = '해당 공고는 마감되었습니다. 지원할 수 없습니다.';
            end if;
        else
            signal sqlstate '45000'
                set message_text = '해당 이력서는 이 회원의 것이 아닙니다.';
        end if;
    else
        signal sqlstate '45000'
            set message_text = '회원 상태가 online일 경우에만 지원할 수 있습니다.';
    end if;
end //
delimiter ;
```

```sql
call APPLY_001(1, 1, 1);
call APPLY_001(2, 2, 3);
call APPLY_001(3, 4, 3);
```

![지원_내역_조회](https://github.com/user-attachments/assets/6f5d3434-8a03-4362-b67e-d63a4c29b8cc)

</details>
<details>
    
<summary> 지원 상태 변경 (합/불) </summary>
    
```sql
-- 지원 상태 변경(합격, 불합격)
delimiter //
create procedure changeresult (in memIdInput bigint, in postingIdInput bigint, in resumeIdInput bigint)
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'company' then
		if @state = 'online' then
			select state into @post_state from job_posting where id = postingIdInput;
			if @post_state = 'deadline' then
				update appli_record set result = 'passed' where posting_id = postingIdInput and resume_id = resumeIdInput;
				update appli_record set result = 'failed' where posting_id = postingIdInput and result = 'apply';
			else
				signal sqlstate '45000' set message_text = '채용중인 공고 입니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '회사 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
```

```sql
call changeresult(5, 3, 2);
```

![지원결과상태변경](https://github.com/user-attachments/assets/f7967d1f-ebc4-4c97-b99e-319c9513adb6)

</details>

</div>
</details>

<details>
<summary>📎 스크랩 프로시저</summary>
<div markdown="1">

<details>
    
<summary> 스크랩 추가 </summary>
    
```sql
-- 스크랩 추가
delimiter //
create procedure scrapinsert (in memIdInput bigint, in postingIdInput bigint)
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			select state into @post_state from job_posting where id = postingIdInput;
			if @post_state = 'hiring' then
				insert into scrap(member_id, posting_id) values(memIdInput, postingIdInput);
                select '스크랩 추가 완료!' as message;
			else
				signal sqlstate '45000' set message_text = '채용중인 공고가 아닙니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '개인 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
```

```sql
call scrapinsert(1, 1);
```

![스크랩_추가](https://github.com/user-attachments/assets/3ba6b88e-37eb-4d29-8862-315c22fa0cb0)

</details>
<details>
    
<summary> 스크랩 삭제 </summary>
    
```sql
-- 스크랩 삭제
delimiter //
create procedure scrapdelete (in memIdInput bigint, in scrapIdInput bigint)
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			if (select 1=1 from scrap where id = scrapIdInput) then
				if (select 1=1 from scrap where id = scrapIdInput and member_id = memIdInput) then
					delete from scrap where id = scrapIdInput;
                    select '스크랩 삭제 완료!' as message;
				else
					signal sqlstate '45000' set message_text = '본인 스크랩이 아닙니다.';
				end if;
			else
				signal sqlstate '45000' set message_text = '스크랩이 존재하지 않습니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '개인 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
```

```sql
call scrapdelete(1, 1);
```

![스크랩_삭제](https://github.com/user-attachments/assets/90a37e59-35fc-4db2-b7cc-8d180b2d785a)

</details>

</div>
</details>

<details>
<summary>⭐ 기업 리뷰 프로시저</summary>
<div markdown="1">

<details>
    
<summary> 리뷰 생성 </summary>
    
```sql
-- 리뷰 생성
delimiter //
create procedure reviewinsert (in memIdInput bigint, in companyIdInput bigint, in ratingInput decimal(2,1), in contentsInput varchar(1000), in tagInput varchar(255))
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			if (select 1=1 from review where member_id = memIdInput and company_id = companyIdInput) then
				signal sqlstate '45000' set message_text = '이미 평가한 회사입니다.';
			else 
				insert into review(rating, contents, member_id, company_id) values(ratingInput, contentsInput, memIdInput, companyIdInput);
				select id into @review_id from review order by id desc limit 1;
				if (select 1=1 from tag where contents = tagInput) then
					select id into @tag_id from tag where contents = tagInput;
				else
					insert into tag(contents) values(tagInput);
					select id into @tag_id from tag order by id desc limit 1;
				end if;
				insert into tag_review(review_id, tag_id) values(@review_id, @tag_id);
                select '리뷰 등록 완료!' as message;
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '개인 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
```

```sql
call reviewinsert(1, 2, 4.0, '좋아요', 'good');
```

![리뷰_생성](https://github.com/user-attachments/assets/7c45eac7-14d4-4dae-87e4-f2147f6a6cf2)

</details>
<details>
    
<summary> 리뷰 수정 </summary>
    
```sql
-- 리뷰 수정
delimiter //
create procedure reviewupdate (in memIdInput bigint, in reviewIdInput bigint, in ratingInput decimal(2,1), in contentsInput varchar(1000))
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			if(select 1=1 from review where id = reviewIdInput and member_id = memIdInput) then
				update review set rating = ratingInput, contents = contentsInput, update_time = now() where id = reviewIdInput;
                select '리뷰 수정 완료!' as message;
			else
				signal sqlstate '45000' set message_text = '본인 리뷰가 아닙니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '개인 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
```

```sql
call reviewupdate(1, 1, 3.5, '좋아요');
```

![리뷰_수정](https://github.com/user-attachments/assets/1ad067df-0f61-4deb-abfc-6acc934b89cf)

</details>
<details>
    
<summary> 리뷰 삭제 </summary>
    
```sql
-- 리뷰 삭제
delimiter //
create procedure reviewdelete (in memIdInput bigint, in reviewIdInput bigint)
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			if (select 1=1 from review where id = reviewIdInput and member_id = memIdInput) then
				delete from tag_review where review_id = reviewIdInput;
				delete from review where id = reviewIdInput;
                select '리뷰 삭제 완료!' as message;
			else
				signal sqlstate '45000' set message_text = '본인 리뷰가 아닙니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '개인 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
```

```sql
call reviewdelete(1, 1);
```

![리뷰_삭제](https://github.com/user-attachments/assets/d8c8ac2f-878e-4843-b5a8-34de04800601)

</details>

</div>
</details>


## 🧪 테스트
