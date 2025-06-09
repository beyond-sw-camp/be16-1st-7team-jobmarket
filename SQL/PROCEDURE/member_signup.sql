-- 회원가입 프로시저저
CREATE PROCEDURE signup (in emailInput varchar(255), in nameInput varchar(255), in passwordInput varchar(255), in typeInput int)
begin
	if (select 1=1 from member where email = emailInput) then
		signal sqlstate '45000' set message_text = '이미 가입된 계정입니다.';
	else 
		if typeInput = 0 then
			insert into member(email, name, password) values(emailInput, nameInput, passwordInput);
            select '개인계정 가입 완료!' as message;
		else 
			insert into member(email, name, password, member_type) values(emailInput, nameInput, passwordInput, 'company');
            select '회사계정 가입 완료!' as message;
		end if;
	end if;
end