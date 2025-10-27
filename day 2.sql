use mockdb;
select bug_id, module, employee_name, role, department, experience
from bugs b
inner join employee e
on b.assigned_to = e.employee_name;

select bug_id, module, status, employee_name
from bugs b
left join employee e
on b.assigned_to = e.employee_name
order by employee_name;

select department, count(*) as number_of_bugs
from bugs b
join employee e
on b.assigned_to = e.employee_name
group by department;

select module, count(*) as no_of_high_severe_bugs from bugs
where severity= 'high'
group by module
having count(*) > 10
order by no_of_high_severe_bugs desc;

select  b.module, t.result, count(*) as count
from bugs b
join test_execution t
on b.bug_id = t.bug_id
group by b.module, t.result
order by b.module;

select  b.module, count(*) as no_of_failed_cases
from bugs b
join test_execution t
on b.bug_id = t.bug_id
where t.result = "fail"
group by b.module
order by no_of_failed_cases desc
limit 1;

