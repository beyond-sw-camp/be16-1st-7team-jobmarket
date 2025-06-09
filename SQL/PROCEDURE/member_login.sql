-- 로그인 프로시저
delimiter //
create procedure login (in emailInput varchar(255), in passwordInput varchar(255))
begin
	select password into @password from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @password = passwordInput then
			update member set state = 'online' where email = emailInput;
			select '로그인 완료!' as message;
		else
			signal sqlstate '45000' set message_text = '비밀번호가 틀렸습니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;