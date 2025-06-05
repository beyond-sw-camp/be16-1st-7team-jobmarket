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