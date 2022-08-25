# Sun8877777_microservices
Sun8877777 microservices repository

### ДЗ-12.Технология контейнеризации.контейнеризации.
Введение в Docker

План
Создание docker host
Создание своего образа
Работа с Docker Hub

Выполнены все пункты задания и задания со *.

### ДЗ-13. Docker-образы. Микросервисы

Цели задания

1. Научиться описывать и собирать Docker-образы для сервисного приложения
2. Научиться оптимизировать работу с Docker-образами
3. Запуск и работа приложения на основе Docker-образов, оценка удобства
запуска контейнеров при помощи docker run

План
1. Разбить наше приложение на несколько компонентов
2. Запустить наше микросервисное приложение

Задание со ⭐
1. Остановите контейнеры
   --- docker kill $(docker ps -q)
2. Запустите контейнеры с другими сетевыми алиасами

3. Адреса для взаимодействия контейнеров задаются через ENV - переменные внутри Dockerfile 'ов
4. При запуске контейнеров ( docker run ) задайте им переменные окружения соответствующие новым сетевым алиасам, не пересоздавая образ
5. Проверьте работоспособность сервиса
#### commands
docker run -d --network=reddit --network-alias=post_db_mongo --network-alias=comment_db_mongo mongo:latest
docker run -d --network=reddit --network-alias=post_new -e POST_DATABASE_HOST='post_db_mongo' -e POST_DATABASE='posts_db' sun8877777/post:1.0
docker run -d --network=reddit --network-alias=comment_new -e COMMENT_DATABASE_HOST='comment_db_mongo' -e COMMENT_DATABASE='comments_db' sun8877777/comment:1.0
docker run -d --network=reddit -e POST_SERVICE_HOST='post_new' -e COMMENT_SERVICE_HOST='comment_new' -p 9292:9292 sun8877777/ui:1.0

Выполнено

Задания со ⭐
Попробуйте собрать образ на основе Alpine Linux
Придумайте еще способы уменьшить размер образа
Можете реализовать как только для UI сервиса, так и для остальных
( post , comment )
Все оптимизации проводите в Dockerfile сервиса. Дополнительные
варианты решения уменьшения размера образов можете оформить в
виде файла Dockerfile.<цифра> в папке сервиса

Выполнено
------------------
