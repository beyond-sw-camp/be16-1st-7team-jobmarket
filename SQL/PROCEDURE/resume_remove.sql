-- 이력서 삭제 프로시저
-- ✔️ 회사 계정 → 공고 삭제
delimiter //
create procedure RESUME_003(
    in idInput bigint
)
begin
    delete from resume
    where id = idInput;

    select '이력서가 삭제되었습니다.' as message;
end //
delimiter ;
