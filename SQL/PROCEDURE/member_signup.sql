-- 회원 가입 프로시저
delimiter //
create procedure signup (in emailInput varchar(255), in nameInput varchar(255), in passwordInput varchar(255), in typeInput int)
begin
	select state into @state from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'online' then
			update member set name = nameInput, password = passwordInput where email = emailInput;
		else
			signal sqlstate '45000' set message_text = '오프라인 상태입니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;