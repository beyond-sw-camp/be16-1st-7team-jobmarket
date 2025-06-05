-- 회사 정보 삭제 프로시저
delimiter //
create procedure companydel (in emailInput varchar(255))
begin
	select state, member_type, id into @state, @type, @id from member where email = emailInput;
	if (select 1=1 from member where email = emailInput) then
		if @state = 'online' then
			if @type = 'company' then
				if (select 1=1 from company where member_id = @id) then
					delete from company where member_id = @id;
				else
<<<<<<< HEAD
					signal sqlstate '45000' set message_text = '등록한 회사 정보가 없음';
				end if;
			else
				signal sqlstate '45000' set message_text = '회사 계정만 삭제 가능';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else 
		signal sqlstate '45000' set message_text = '존재하지 않는 계정입니다.';
=======
					signal sqlstate '45000' set message_text = "등록한 회사 정보가 없습니다.";
				end if;
			else
				signal sqlstate '45000' set message_text = "회사 계정이 아니라 삭제제할 수 없습니다.";
			end if;
		else
			signal sqlstate '45000' set message_text = "온라인 상태가 아닙니다.";
		end if;
	else 
		signal sqlstate '45000' set message_text = "존재하지 않는 계정입니다.";
>>>>>>> 38c60fec5cfa9e943255b188aa27494b0714ce8c
	end if;
end //
delimiter ;
