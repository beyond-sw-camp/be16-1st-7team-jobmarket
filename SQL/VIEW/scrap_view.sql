-- 스크랩 관련 뷰
create view scrap_view
AS
    select  m.email as '이메일', 
            m.name as '성명',
            c.name as '회사명',
            j.title as '공고명',
            j.contents as '공고 내용'
    from    member m    inner join scrap s on m.id = s.member_id
                        inner join job_posting j on j.id = s.posting_id
                        inner join company c on c.id = j.company_id
