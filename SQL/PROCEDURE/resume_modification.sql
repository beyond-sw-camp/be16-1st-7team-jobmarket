-- 이력서 수정 프로시저
-- 이력서 내용 수정
delimiter //
create procedure RESUME_002(
    in idInput bigint,
    in titleInput varchar(255),
    in contentsInput varchar(1000))
begin
    update resume
    set title = titleInput,
        contents = contentsInput,
        update_time = CURRENT_TIMESTAMP
    where id = idInput;

    select '이력서가 수정되었습니다.' as message;
end //
delimiter ;
