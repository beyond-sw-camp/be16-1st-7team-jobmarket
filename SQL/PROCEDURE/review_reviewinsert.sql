-- 리뷰 생성
delimiter //
create procedure reviewinsert (in memIdInput bigint, in companyIdInput bigint, in ratingInput decimal(2,1), in contentsInput varchar(1000), in tagInput varchar(255))
begin
	select state, member_type into @state, @type from member where id = memIdInput;
	if @type = 'user' then
		if @state = 'online' then
			if (select 1=1 from review where member_id = memIdInput and company_id = companyIdInput) then
				signal sqlstate '45000' set message_text = '이미 평가한 회사입니다.';
			else 
				insert into review(rating, contents, member_id, company_id) values(ratingInput, contentsInput, memIdInput, companyIdInput);
				select id into @review_id from review order by id desc limit 1;
				if (select 1=1 from tag where contents = tagInput) then
					select id into @tag_id from tag where contents = tagInput;
				else
					insert into tag(contents) values(tagInput);
					select id into @tag_id from tag order by id desc limit 1;
				end if;
				insert into tag_review(review_id, tag_id) values(@review_id, @tag_id);
                select '리뷰 등록 완료!' as message;
			end if;
		else
			signal sqlstate '45000' set message_text = '온라인 상태가 아닙니다.';
		end if;
	else
		signal sqlstate '45000' set message_text = '개인 계정으로 로그인 하세요.';
	end if;
end //
delimiter ;
