-- 리뷰 수정
delimiter //
create procedure reviewupdate (in memIdInput bigint, in reviewIdInput bigint, in ratingInput decimal(2,1), in contentsInput varchar(1000))
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			if(select 1=1 from review where id = reviewIdInput and member_id = memIdInput) then
				update review set rating = ratingInput, contents = contentsInput, update_time = now() where id = reviewIdInput;
                select '리뷰 수정 완료!' as message;
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
