# ft_server
ft_server project for School 21

Это проект в рамках заданий курса Школы 21.
Проект совершенно искуственный и создан с целью познакомить учеников с рядом технологий:
* Docker
* Nginx
* phpMyAdmin
* Wordpress
* MariaDB

Благодаря ему мы учимся немного работать с контейнером и сервисами внутри него.
На продакшне, конечно, используется принцип  - "один контейнер - один сервис".

## Описание проекта.
Внутри контейнера запускаются сервисы:
* nginx
* phpMyAdmin
* Wordpress
* MariaDB
Доступна страница по адресу https://localhost. По-умолчанию включен листинг папок. В корне доступны два адреса - wordpress и phpMyAdmin.
Так же создается база данных с которой работает Wordpress и phpMyAdmin.

Сборка образа:
```docker build -t ft_server .```

Запуск контейнера:
```docker run -d -p 80:80 -p 443:443 --name ft_server ft_server```

Включение выключение листинга папок:
```bash autoindex_onoff.sh on\off```
