delimiter //
create procedure userupdate (in emailInput varchar(255), in nameInput varchar(255), in passwordInput varchar(255))
begin
	select state into @state from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'online' then
			select "수정 완료";
			update member set name = nameInput, password = passwordInput where email = emailInput;
		else
			select "오프라인 상태입니다.";
		end if;
	else 
		select "존재하지 않는 계정입니다.";
	end if;
end //
delimiter ;