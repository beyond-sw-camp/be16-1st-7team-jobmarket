-- 지원 상태 변경(합격, 불합격)
delimiter //
create procedure changeresult (in memIdInput bigint, in postingIdInput bigint, in resumeIdInput bigint)
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'company' then
		if @state = 'online' then
			select state into @post_state from job_posting where id = postingIdInput;
			if @post_state = 'deadline' then
				update appli_record set result = 'passed' where posting_id = postingIdInput and resume_id = resumeIdInput;
				update appli_record set result = 'failed' where posting_id = postingIdInput and result = 'apply';
			else
				signal sqlstate '45000' set message_text = '채용중인 공고 입니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '회사 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;