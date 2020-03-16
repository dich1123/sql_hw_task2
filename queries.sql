-- first task
select p.posit_name position, count(ews.ews_id) times
from position p
    left join emp_work_status ews
        on ews.position_id = p.posit_id
group by p.posit_name;

-- second task (2 variants) different realisations, same answer
select posit_name name from (
    select p.posit_name, count(ews.ews_id) times
    from position p
        left join emp_work_status ews
            on ews.position_id = p.posit_id
    group by p.posit_name
    ) as t
where t.times = 0;

select posit_name name
from position
    left join emp_work_status ews
        on position.posit_id = ews.position_id
group by name
having count(ews.position_id) = 0;

-- third task (2 variants) different realisations, different answers

select concat(proj_name, ' ', posit_name) project_position, count(posit_name) amount_positions from
    (select ews.position_id, ews.project_id, p.proj_name, pos.posit_name
    from emp_work_status ews
        left join project p
            on p.proj_id = ews.project_id
        left join position pos
            on ews.position_id = pos.posit_id
    order by p.proj_name) as t
group by proj_name, posit_name
;

select concat(proj_name, ' ', posit_name) project_position, count(ews.position_id) amount_positions from
    (select p.proj_id, p.proj_name, pos.posit_id, pos.posit_name
    from project p
        join position pos
    order by p.proj_name) as t

    left join emp_work_status ews
        on posit_id=ews.position_id and proj_id=ews.project_id
group by proj_name, posit_name
;


-- fourth task

/*
select proj_name, amount_tasks/employees avg_task_for_employee from
    (select proj_name, amount_tasks, count(ews.emp_id) employees from
        (select p.proj_id, p.proj_name, count(t.task_id) amount_tasks
        from project p
            left join task t
                on t.project_id = p.proj_id
        group by p.proj_name) as t

        left join emp_work_status ews
            on ews.project_id = proj_id
    group by proj_name) as t2
;
*/


select proj_name, amount_tasks/count(ews.emp_id) avg_task_for_employee from
        (select p.proj_id, p.proj_name, count(t.task_id) amount_tasks  -- tasks amount on each project
        from project p
            left join task t
                on t.project_id = p.proj_id
        group by p.proj_name) as t

        left join emp_work_status ews
            on ews.project_id = proj_id
    group by proj_name;


-- fifth task

select proj_name, timestampdiff(second, open_date, close_date) time_needed_in_seconds from project;

-- sixth task (not so wonderful as wanted)

select employee_id, name, not_closed_tasks from
    (select t.emp_st_ch_id employee_id, e.name, count( t.task_id) not_closed_tasks
    from task t
        left join employee e
            on t.emp_st_ch_id = e.emp_id
    where status not in ('closed')
    group by t.emp_st_ch_id
    order by e.name) as t

where not_closed_tasks = (select min(t2.not_closed_tasks) from -- one more select needed for take min value
        (select count( t.task_id) not_closed_tasks
        from task t
            left join employee e
                on t.emp_st_ch_id = e.emp_id
        where status not in ('closed')
        group by t.emp_st_ch_id
        order by e.name) as t2)
;


--  seventh task (same problem as in 6 task)

select employee_id, name, not_closed_tasks deadline_passed_tasks from
    (select t.emp_st_ch_id employee_id, e.name, count( t.task_id) not_closed_tasks
    from task t
        left join employee e
            on t.emp_st_ch_id = e.emp_id
    where status not in ('closed') and t.deadline < now()
    group by t.emp_st_ch_id
    order by e.name) as t

where not_closed_tasks = (select max(t2.not_closed_tasks) from -- one more select needed for take max value
        (select count( t.task_id) not_closed_tasks
        from task t
            left join employee e
                on t.emp_st_ch_id = e.emp_id
        where status not in ('closed') and t.deadline < now()
        group by t.emp_st_ch_id
        order by e.name) as t2)
;

-- eights task

select task_id, deadline
from task
where deadline < now();

update task
set deadline = date_add(deadline, INTERVAL 5 DAY)
where deadline < now()
;

select task_id, deadline
from task
where deadline < now();


-- ninths task (done for 'open' status tasks)

select p.proj_id, p.proj_name, count(t.task_id) open_tasks
from project p
    left join task t
        on t.project_id = p.proj_id
    where t.status = 'open'
group by p.proj_id
;


-- tenth task (huge piece of not good query)

/*
select id, name, date_last_done_task from  -- projects with all closed tasks, last date
    (select id, name, all_statuses, count(t2.status) closed_statuses, max(t2.date_st_changed) date_last_done_task from
        (select p.proj_id id, p.proj_name name, count(t.status) all_statuses
            from project p
                left join task t
                    on t.project_id = p.proj_id
        group by p.proj_id) as t

        left join task t2
            on t2.project_id = id
    where t2.status = 'closed'
    group by id) as t2
where all_statuses = closed_statuses
;


 */

update project pr  -- set status closed
set pr.status = 'closed', pr.close_date = (select date_last_done_task from  -- projects with all closed tasks, last date
        (select id, name, all_statuses, count(t2.status) closed_statuses, max(t2.date_st_changed) date_last_done_task from
            (select p.proj_id id, p.proj_name name, count(t.status) all_statuses
                from project p
                    left join task t
                        on t.project_id = p.proj_id
            group by p.proj_id) as t

            left join task t2
                on t2.project_id = id
        where t2.status = 'closed'
        group by id) as t2
    where all_statuses = closed_statuses)


where pr.proj_id in (select id from  -- projects with all closed tasks, last date
    (select id, name, all_statuses, count(t2.status) closed_statuses, max(t2.date_st_changed) date_last_done_task from
        (select p.proj_id id, p.proj_name name, count(t.status) all_statuses
            from project p
                left join task t
                    on t.project_id = p.proj_id
        group by p.proj_id) as t

        left join task t2
            on t2.project_id = id
    where t2.status = 'closed'
    group by id) as t2
where all_statuses = closed_statuses)
;


-- elevenths task

/*

select t1.project_id, t1.emp_st_ch_id, count(status) statuses from -- how many times was status on each project_id
    (select t.project_id, t.task_id, t.emp_st_ch_id, t.status
    from task t
    order by t.project_id) as t1

group by t1.emp_st_ch_id, t1.project_id
;


select tt1.project_id, tt1.emp_st_ch_id, count(status) closed_statuses from -- how many times was status 'closed' on each project_id
    (select tt.project_id, tt.task_id, tt.emp_st_ch_id, tt.status
    from task tt
    order by tt.project_id) as tt1
where tt1.status = 'closed'
group by tt1.emp_st_ch_id, tt1.project_id
;

select jt1.project_id, jt1.emp_st_ch_id, jt1.statuses, jt2.closed_statuses  -- emp_id with all closed statuses on some concrete project
from (
         select t1.project_id, t1.emp_st_ch_id, count(status) statuses from -- how many times was status on each project_id
            (select t.project_id, t.task_id, t.emp_st_ch_id, t.status
            from task t
            order by t.project_id) as t1

        group by t1.emp_st_ch_id, t1.project_id
             ) as jt1

    right join (
        select tt1.project_id, tt1.emp_st_ch_id, count(status) closed_statuses from -- how many times was status 'closed' on each project_id
            (select tt.project_id, tt.task_id, tt.emp_st_ch_id, tt.status
            from task tt
            order by tt.project_id) as tt1
        where tt1.status = 'closed'
        group by tt1.emp_st_ch_id, tt1.project_id
    ) as jt2
        on jt2.project_id = jt1.project_id
where jt2.closed_statuses = jt1.statuses and jt2.project_id = jt1.project_id and jt2.emp_st_ch_id = jt1.emp_st_ch_id
;

*/

select t3.project_id, pro.proj_name, t3.emp_st_ch_id employee_id, emp.name emp_name_all_closed from
    (select jt1.project_id, jt1.emp_st_ch_id, jt1.statuses, jt2.closed_statuses  -- emp_id with all closed statuses on some concrete project
    from (
             select t1.project_id, t1.emp_st_ch_id, count(status) statuses from -- how many times was status on each project_id
                (select t.project_id, t.task_id, t.emp_st_ch_id, t.status
                from task t
                order by t.project_id) as t1

            group by t1.emp_st_ch_id, t1.project_id
                 ) as jt1

        right join (
            select tt1.project_id, tt1.emp_st_ch_id, count(status) closed_statuses from -- how many times was status 'closed' on each project_id
                (select tt.project_id, tt.task_id, tt.emp_st_ch_id, tt.status
                from task tt
                order by tt.project_id) as tt1
            where tt1.status = 'closed'
            group by tt1.emp_st_ch_id, tt1.project_id
        ) as jt2
            on jt2.project_id = jt1.project_id
    where jt2.closed_statuses = jt1.statuses and jt2.project_id = jt1.project_id and jt2.emp_st_ch_id = jt1.emp_st_ch_id) as t3

left join project pro
on t3.project_id = pro.proj_id
left join employee emp
on emp.emp_id = t3.emp_st_ch_id
order by pro.proj_name
;


-- twelfths task (not by name, by id. because in this variant of db we don't have field task.name)

drop procedure if exists task_change_owner;

delimiter //

create procedure  task_change_owner (update_id int(50))
begin
    update task
    set task.emp_st_ch_id = (
            select t1.emp_st_ch_id from  -- emp_id with minimum tasks on this project
            (select t.emp_st_ch_id, t.project_id, count(t.task_id) tasks
            from task t
            where t.project_id = (select project_id from task where task.task_id = update_id)
            group by t.emp_st_ch_id, t.project_id) as t1
        where t1.tasks = (select min(t2.tasks) from
            (select t.emp_st_ch_id, t.project_id, count(t.task_id) tasks
            from task t
            where t.project_id = (select project_id from task where task.task_id = update_id)
            group by t.emp_st_ch_id, t.project_id) as t2
            )
        limit 1
        )
    where task.task_id = update_id;
end //
delimiter ;

call task_change_owner(17);


mysqldump -u "user" -p --databases task2 > task2_dump.sql;
