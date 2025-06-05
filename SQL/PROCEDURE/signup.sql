delimiter //
create procedure signup (in emailInput varchar(255), in nameInput varchar(255), in passwordInput varchar(255), in typeInput int)
begin
	if (select 1=1 from member where email = emailInput) then
		select "이미 가입된 계정입니다.";
	else 
		if typeInput = 0 then
			insert into member(email, name, password) values(emailInput, nameInput, passwordInput);
		else 
			insert into member(email, name, password, member_type) values(emailInput, nameInput, passwordInput, 'company');
		end if;
	end if;
end //
delimiter ;