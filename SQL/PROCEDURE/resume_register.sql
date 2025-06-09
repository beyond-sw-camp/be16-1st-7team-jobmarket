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
