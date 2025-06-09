-- 회원 탈퇴 프로시저
delimiter //
create procedure withdrawal (in emailInput varchar(255), in passwordInput varchar(255))
begin
	select state, password into @state, @password from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'online' then
			if @password = passwordInput then
				update member set state = 'withdraw' where email = emailInput;
				select '회원 탈퇴 완료!' as message;
			else
				signal sqlstate '45000' set message_text = '비밀번호가 틀렸습니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '오프라인 상태입니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;
