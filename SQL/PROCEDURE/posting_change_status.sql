-- 공고 상태 변경 프로시저
-- ✔️ 회사 계정 → 공고 마감시간 지날 시에 상태 변경
# (기본은 고용중(hiring) > 마감(deadline)으로 상태 변경)
delimiter //
create procedure POSTING_003()
begin
    update job_posting
    set state = 'deadline'
    where deadline < now()
    and state = 'hiring';
end //
delimiter ;
