use mockdb;

select module, count(*) as no_of_high_severe_bugs from bugs
where severity='High'
group by module
order by no_of_high_severe_bugs desc;


select assigned_to, count(*) as no_of_bugs from bugs
group by assigned_to
order by no_of_bugs desc;


select module, avg(datediff(resolved_date,reported_date)) as avg_resolution_time
from bugs
group by module
order by avg_resolution_time desc;


select e.employee_name, count(*) as no_of_critical_bugs from bugs b
join employee e
on b.assigned_to = e.employee_name 
where severity = "critical"
group by employee_name
order by no_of_critical_bugs desc;


select  module, count(*) as no_of_failed_cases from bugs b
join test_execution t
on b.bug_id = t.bug_id
where result="Fail"
group by module
order by no_of_failed_cases desc;


select module, status, count(*) as no_of_bugs from bugs
group by module, status
order by module asc, no_of_bugs desc;


select module, count(*) as no_of_bugs from bugs
where reported_date >= curdate() - interval 30 day
group by module
order by no_of_bugs desc;
