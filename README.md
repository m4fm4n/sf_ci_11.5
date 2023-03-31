For SF practice 11.5


1. Требуется настроить пайплайн, который будет запускаться при изменении SQL-скрипта, хранящегося в репозитории (его выбор также на ваше усмотрение).
2. Пайплайн должен запускать изменившийся скрипт и выводить результат запроса.


Задача решается через Docker. Dockerfile содержит образ jenkins:2.60.3, установлен mysql-client для проверки.


#Команды сборки:


#task1:


git clone https://github.com/m4fm4n/sf_ci_11.5 /mytasks/sql/
mysql --user rfamro --host mysql-rfam-public.ebi.ac.uk --port 4497 --database Rfam < /mytasks/sql/sqlquery_1.sql > /tmp/test1.log


#task2:


git clone https://github.com/m4fm4n/sf_ci_11.5 /mytasks/sql/
mysql --user rfamro --host mysql-rfam-public.ebi.ac.uk --port 4497 --database Rfam < /mytasks/sql/sqlquery_2.sql > /tmp/test2.log

