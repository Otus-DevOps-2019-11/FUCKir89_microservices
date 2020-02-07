# FUCKir89_microservices

## Первая домашка под докеру

Научились работать с контенерами и писать докер файлы.

Запилили инфру: 
    - образ пакером с установленным докером
    - терраформ поднимает виртуалку
    - ансибл раскатывает приложуху в контейнере, который мы создали из докер файла 



## Вторая домашка под докеру

Что мы сделали:
  1. Распилили монолитную приложуху на микросервисы
  2. Научились подключать к докеру сети, диски и тд
  3. Научились далть образа более компактными)

Образ уменьшало только UI, остальные по аналогии, тратить время не стал (итак с опазданием сдаю домашку)

Как запустить сие чудо:

  1. Сбилдить контейнеры:
     docker build -t fuckir89/post:1.0 ./post-py
     docker build -t fuckir89/comment:1.0 ./comment
     docker build -t fuckir89/ui:3.0 ./ui

  2. Запустить контейнеры:
     docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
     docker run -d --network=reddit --network-alias=post fuckir89/post:1.0
     docker run -d --network=reddit --network-alias=comment fuckir89/comment:1.0
     docker run -d --network=reddit -p 9292:9292 fuckir89/ui:3.0

Как проверить:
   Зайти на внешний адрес docker-maschine на порт 9292

Как выключить:
   docker kill $(docker ps -q)
