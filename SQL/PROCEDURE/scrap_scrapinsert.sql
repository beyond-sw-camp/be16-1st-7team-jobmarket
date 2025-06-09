-- 스크랩 추가
delimiter //
create procedure scrapinsert (in memIdInput bigint, in postingIdInput bigint)
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			select state into @post_state from job_posting where id = postingIdInput;
			if @post_state = 'hiring' then
				insert into scrap(member_id, posting_id) values(memIdInput, postingIdInput);
                select '스크랩 추가 완료!' as message;
			else
				signal sqlstate '45000' set message_text = '채용중인 공고가 아닙니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '개인 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
