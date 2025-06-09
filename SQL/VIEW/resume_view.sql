-- 이력서 관련 뷰
create view resume_view
AS
    select  m.email as '이메일', 
            m.name as '성명' , 
            j.title as '공고 제목', 
            j.contents as '공고 내용', 
            r.title as '이력서 제목', 
            r.contents as '이력서 내용', 
            case 
                when a.result = 'apply' then '지원중'
                when a.result = 'passed' then '합격'
                when a.result = 'failed' then '불합격'
            end
    from    member m    inner join resume r on m.id = r.member_id
                        inner join appli_record a on r.id = a.resume_id
                        inner join job_posting j on j.id = a.posting_id;