-- 회사 정보 등록 and 수정 프로시저
delimiter //
create procedure companyinup (in emailInput varchar(255), in companynameInput varchar(255), in addressInput varchar(255), in homepageInput varchar(255), in phonenumInput varchar(255))
begin
	select state, member_type, id into @state, @type, @id from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'online' then
			if @type = 'company' then
				if (select 1=1 from company where member_id = @id) then
					update company set name = companynameInput, address = addressInput, homepage = homepageInput, phone_number = phonenumInput where member_id = @id;
					select '회사정보 수정 완료!' as message;
				else
					insert into company(name, address, homepage, phone_number, member_id) values(companynameInput, addressInput, homepageInput, phonenumInput, @id);
					select '회사정보 등록 완료!' as message;
				end if;
			else
				signal sqlstate '45000' set message_text = '회사 계정만 등록 가능';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인상태가 아닙니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
	end if;
end //
delimiter ;
