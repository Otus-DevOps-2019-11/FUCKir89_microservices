# FUCKir89_microservices

## Первая домашка под докеру

### Научились работать с контенерами и писать докер файлы

#### Что мы сделали:
   :white_check_mark: Образ пакером с установленным докером

   :white_check_mark: Терраформ поднимает виртуалку

   :white_check_mark: Ансибл раскатывает приложуху в контейнере, который мы создали из докер файла



## Вторая домашка под докеру

#### Что мы сделали:
   :white_check_mark: Распилили монолитную приложуху на микросервисы

   :white_check_mark: Научились подключать к докеру сети, диски и тд

   :white_check_mark: Научились далть образа более компактными

Образ уменьшало только UI, остальные по аналогии, тратить время не стал (итак с опазданием сдаю домашку)

#### Как запустить сие чудо:

   1. Сбилдить контейнеры:
```bash
      docker build -t fuckir89/post:1.0 ./post-py
      docker build -t fuckir89/comment:1.0 ./comment
      docker build -t fuckir89/ui:3.0 ./ui
```

   2. Запустить контейнеры:
```bash
      docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
      docker run -d --network=reddit --network-alias=post fuckir89/post:1.0
      docker run -d --network=reddit --network-alias=comment fuckir89/comment:1.0
      docker run -d --network=reddit -p 9292:9292 fuckir89/ui:3.0
```

#### Как проверить:

    Зайти на внешний адрес docker-maschine на порт 9292

#### Как выключить:
```bash
    docker kill $(docker ps -q)
```
Gbgcrf
## Третья домашка под докеру

#### Что мы сделали:
   :white_check_mark: Научились компоуз файлы делать

   :white_check_mark: Научились делить по сеткам

   :white_check_mark: Научились парамектризовать с помощью переменных

#### Как запустить сие чудо:

```bash
      docker-compose up -d
```

   Имя проекта берется из папки в которой он находится. Если надо это изменить то есть ключик --project-name
```bash
      docker-compose --project-name test up -d
```

   Есть интересный нюанс, что если ключик указан для изменения имени проекта, то надо его указывать всегда:
```bash
      docker-compose --project-name test ps
      docker-compose --project-name test top
      docker-compose --project-name test logs
      docker-compose --project-name test down
      ets.
```

#### Как проверить:

   Зайти на внешний адрес docker-maschine на порт 9292

#### Как выключить:
   Без ключа:
```bash
      docker-compose down
```
   С ключом:
```bash
      docker-compose --project-name test down
```
