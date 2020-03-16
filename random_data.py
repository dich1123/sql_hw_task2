import mysql.connector as mc
import random

config = {'user': None, 'password': None, 'host': '127.0.0.1', 'database': None,
          'raise_on_warnings': True}  # you can insert setting into config straight

"""or add your info here"""
config['user'] = 'user'
config['password'] = 'Hardpas!1123'
config['database'] = 'task2'

cnx = mc.connect(**config)
cursor = cnx.cursor()

names = ['Petro', 'Kolyan', 'Katka', 'Dimych', 'SamyiKrutoiNaSele']
positions = ['dev', 'lead', 'superman', 'BA', 'bUhGAlTeR', 'nanny', 'kent', 'superpuper', 'employee']
projects = ['CoolIgra', 'BankStuff', 'StavkiNaSport', 'DreamLand', 'Cheburek', 'BigWall', 'SmallKek', 'DreamFood']
task_status = ['open', 'done', 'needs refinement', 'closed']

for i in range(50):
    query = f"INSERT INTO employee (name) VALUES ('{random.choice(names)}');"
    cursor.execute(query)

for i in positions:
    query = f"INSERT INTO position (posit_name) VALUES ('{i}');"
    cursor.execute(query)

for i in projects:
    query = f"INSERT INTO project (proj_name, close_date, status) VALUES" \
            f" ('{i}', '{'2020-11-10'}', '{'in progress'}');"
    cursor.execute(query)
cnx.commit()

for i in range(150):
    query = f"INSERT INTO task (task_description, deadline, status, emp_st_ch_id, project_id) VALUES" \
            f" ('link to task description' ,'{'2020-11-10'}'," \
            f" '{random.choice(task_status)}', {random.randint(3, 45)}, {random.randint(1, 7)});"
    cursor.execute(query)

for i in range(70):
    query = f"INSERT INTO emp_work_status (emp_id, position_id, project_id) VALUES" \
            f" ({random.randint(3, 45)}, {random.randint(1, len(positions))}, {random.randint(1, 7)});"
    cursor.execute(query)

cnx.commit()