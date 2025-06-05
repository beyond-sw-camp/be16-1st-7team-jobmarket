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
    if exists(select 1 from member where id = memberIdInput and member_type = 'company') then
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
