-- 스크랩 삭제
delimiter //
create procedure scrapdelete (in memIdInput bigint, in scrapIdInput bigint)
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			if (select 1=1 from scrap where id = scrapIdInput) then
				if (select 1=1 from scrap where id = scrapIdInput and member_id = memIdInput) then
					delete from scrap where id = scrapIdInput;
                    select '스크랩 삭제 완료!' as message;
				else
					signal sqlstate '45000' set message_text = '본인 스크랩이 아닙니다.';
				end if;
			else
				signal sqlstate '45000' set message_text = '스크랩이 존재하지 않습니다.';
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '개인 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
