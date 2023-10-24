# For SF practice 11.5

1. Требуется настроить пайплайн, который будет запускаться при изменении SQL-скрипта, хранящегося в репозитории.
2. Пайплайн должен запускать изменившийся скрипт и выводить результат запроса.

---

Задача решается через Jenkins + Github hook. Dockerfile содержит образ jenkins:2.60.3, в нём установлен mysql-client для проверки.

Команды docker:
```
sudo docker build ./ -t jenkins_my_img
sudo docker run -d --name jenkins_mysql -p 8080:8080 jenkins_my_img
```

Pipeline Jenkins:

Task_1:
```
git clone https://github.com/m4fm4n/sf_ci_11.5 /tmp/sql/data/
sleep 10
cd /tmp/sql/data/
git pull https://github.com/m4fm4n/sf_ci_11.5
mysql --user rfamro --host mysql-rfam-public.ebi.ac.uk --port 4497 --database Rfam < /tmp/sql/data/sqlquery_1.sql > /tmp/test1.log
```
Task_2:
````
cd /tmp/sql/data/
git pull https://github.com/m4fm4n/sf_ci_11.5 
mysql --user rfamro --host mysql-rfam-public.ebi.ac.uk --port 4497 --database Rfam < /tmp/sql/data/sqlquery_2.sql > /tmp/test2.log

