-- 이력서 등록 프로시저
-- 개인 계정 -> 이력서 등록 (제목, 내용)
DELIMITER //
create procedure RESUME_001(
    in titleInput varchar(255),
    in contentsInput varchar(1000),
    in memberIdInput bigint
)
begin
    if exists(select 1 from member where id = memberIdInput and member_type = 'user') then
        insert into resume (title, contents, member_id)
        values (titleInput, contentsInput, memberIdInput);

        select LAST_INSERT_ID() as resume_id;
    else
        -- 개인 계정이 아닌 경우 오류 발생
        signal sqlstate '45000' set message_text = '개인 계정만 등록 가능!';
    end if;
end //
delimiter ;
