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
    -- 개인 계정 확인
    declare v_resume_owner bigint;

    -- 이력서 소유자 확인
    select member_id into v_resume_owner from resume where id = resumeIdInput;

    if v_resume_owner = memberIdInput then
        insert into appli_record (resume_id, posting_id)
        values (resumeIdInput, postingIdInput);
    else
        signal sqlstate '45000' set message_text = '해당 이력서는 이 회원의 것이 아닙니다.';
    end if;
end //
delimiter ;
