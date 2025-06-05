-- 회원 복구 프로시저
delimiter //
create procedure recovery (in emailInput varchar(255), in passwordInput varchar(255))
begin
	select state, password into @state, @password from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'withdraw' then
			if @password = passwordInput then
				select "복구 완료";
				update member set state = 'offline' where email = emailInput;
			else
				select "비밀번호가 틀렸습니다.";
			end if;
		else
			select "탈퇴한 계정이 아닙니다.";
		end if;
	else 
		select "탈퇴한 계정이 아닙니다.";
	end if;
end //
delimiter ;
