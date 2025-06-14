-- 로그아웃 프로시저
delimiter //
create procedure logout (in emailInput varchar(255), in passwordInput varchar(255))
begin
	select password, state into @password, @state from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @password = passwordInput then
			if @state = 'online' then
				update member set state = 'offline' where email = emailInput;
				select '로그아웃 완료!' as message;
			else
				signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '비밀번호가 틀렸습니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;