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
