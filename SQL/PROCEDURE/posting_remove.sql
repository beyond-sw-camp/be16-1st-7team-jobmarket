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
    if exists(select 1 from member where id = memberIdInput and member_type = 'company') then
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
