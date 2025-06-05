delimiter //
create procedure logout (in emailInput varchar(255), in passwordInput varchar(255))
begin
	select password, state into @password, @state from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @password = passwordInput then
			if @state = 'online' then
				select "로그아웃 되었습니다.";
				update member set state = 'offline' where email = emailInput;
			else
				select "온라인 상태가 아닙니다.";
			end if;
		else
			select "비밀번호가 틀렸습니다.";
		end if;
	else 
		select "존재하지 않는 계정입니다.";
	end if;
end //
delimiter ;