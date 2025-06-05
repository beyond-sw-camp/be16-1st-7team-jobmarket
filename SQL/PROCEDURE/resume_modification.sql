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
