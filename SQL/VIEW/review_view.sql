-- 리뷰관련 뷰
create view review_view
AS
    select  m.email as '이메일', 
            m.name as '성명',
            c.name as '회사명',
            r.rating as '평점',
            r.contents as '리뷰내용',
            concat('#', t.contents) as '태그'
    from    member m    inner join review r on m.id = r.member_id
                        inner join company c on c.id = r.company_id
                        inner join tag_review tr on r.id = tr.review_id
                        inner join tag t on t.id = tr.tag_id;
