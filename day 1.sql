use mockdb;
select * from mock_data;
alter table mock_data modify reported_date datetime;
alter table mock_data modify resolved_date datetime;
select * from mock_data where severity = "high";
select * from mock_data order by reported_date desc;