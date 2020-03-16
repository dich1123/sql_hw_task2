create database if not exists task2;
use task2;

create table if not exists employee (
    emp_id INT(50) primary key auto_increment,
    name VARCHAR(50) not null
);

create table if not exists position (
    posit_id INT(50) primary key auto_increment,
    posit_name VARCHAR(50) not null
);

create table if not exists project (
    proj_id INT(50) primary key auto_increment,
    proj_name VARCHAR(50) not null,
    open_date DATETIME default NOW(),
    close_date DATETIME default NULL,
        status VARCHAR(15) check ( status in ('closed', 'in progress'))
);

create table if not exists task (
    task_id INT(50) primary key auto_increment,
    task_description VARCHAR(100) not null ,
    deadline DATETIME,
    status VARCHAR(20) check ( status in ('open', 'done', 'needs refinement', 'closed')),
    date_st_changed TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    emp_st_ch_id INT(50) not null,
    project_id INT(50) not null,
    FOREIGN KEY (emp_st_ch_id) REFERENCES employee (emp_id),
    FOREIGN KEY (project_id) REFERENCES project (proj_id)
);


create table if not exists emp_work_status (
    ews_id INT(50) primary key auto_increment,
    emp_id INT(50) not null,
    position_id INT(50) not null,
    project_id INT(50) not null,
    FOREIGN KEY (emp_id) REFERENCES employee (emp_id),
    FOREIGN KEY (position_id) REFERENCES position (posit_id),
    FOREIGN KEY (project_id) REFERENCES project (proj_id)
);




