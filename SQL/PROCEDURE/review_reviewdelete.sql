-- 리뷰 삭제
delimiter //
create procedure reviewdelete (in memIdInput bigint, in reviewIdInput bigint)
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			if (select 1=1 from review where id = reviewIdInput and member_id = memIdInput) then
				delete from tag_review where review_id = reviewIdInput;
				delete from review where id = reviewIdInput;
			else
				signal sqlstate '45000' set message_text = '본인 리뷰가 아닙니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '개인 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
