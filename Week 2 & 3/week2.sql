use qa_analysis;
select * from code_quality;

select distinct Framework from code_quality;
select count(distinct Framework) from code_quality;
select distinct Language from code_quality;
select count(distinct Language) from code_quality;
select count(distinct Project_ID) from code_quality;

select framework, round(avg(bug_count),1) as avg_bugs from code_quality
group by framework order by avg_bugs desc;
select language, round(avg(bug_count),1) as avg_bugs from code_quality
group by language order by avg_bugs desc;
select Cloud_Platform, round(avg(bug_count),1) as avg_bugs from code_quality
group by Cloud_Platform order by avg_bugs desc;

select language, round(avg(bug_count),1) as avg_bugs, round(avg(code_coverage_percent),1) as avg_coverage from code_quality
group by language order by avg_bugs desc;

select project_id, technical_debt_hours, bug_count from code_quality
order by technical_debt_hours desc limit 5;
select project_id, bug_count from code_quality
order by bug_count desc;

create view quality_metrics as
select project_id, framework, language, bug_count, lines_of_code,
round((bug_count/lines_of_code)*1000,2) as bug_density,
round((code_coverage_percent/100)*maintainability_index,2) as quality_score,
round((technical_debt_hours/(commit_count + 1)),2) as debt_per_commit
from code_quality;
select * from quality_metrics;

select * from quality_metrics
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/quality_metrics.csv'
fields terminated by ',' enclosed by '"'lines terminated by '\n';

show variables like 'secure_file_priv';