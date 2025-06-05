-- 회원 가입 프로시저
delimiter //
create procedure signup (in emailInput varchar(255), in nameInput varchar(255), in passwordInput varchar(255), in typeInput int)
begin
	select state into @state from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
<<<<<<< HEAD
		if @state = 'online' then
			update member set name = nameInput, password = passwordInput where email = emailInput;
		else
			signal sqlstate '45000' set message_text = '오프라인 상태입니다.';
=======
		signal sqlstate '45000' set message_text = "이미 가입된 계정입니다.";
	else 
		if typeInput = 0 then
			insert into member(email, name, password) values(emailInput, nameInput, passwordInput);
		else 
			insert into member(email, name, password, member_type) values(emailInput, nameInput, passwordInput, 'company');
>>>>>>> 38c60fec5cfa9e943255b188aa27494b0714ce8c
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;