USER_NAME = fuckir89

docker-build-all: 
    docker-build-ui docker-build-comment docker-build-post docker-build-prometheus docker-build-alertmanager docker-build-cadvisor docker-build-grafana docker-build-blackbox_exporter docker-build-mongodb_exporter docker-push-images

docker-build-ui:
	cd ./src/ui && bash ./docker_build.sh

docker-build-comment:
	cd ./src/comment && bash ./docker_build.sh

docker-build-post:
	cd ./src/post-py && bash ./docker_build.sh

docker-build-blackbox_exporter:
	cd ./monitoring/blackbox_exporter && docker build -t ${USER_NAME}/blackbox_exporter .

docker-build-mongodb_exporter:
	cd ./monitoring/mongodb_exporter && docker build -t ${USER_NAME}/mongodb_exporter .

docker-build-prometheus:
	cd ./monitoring/prometheus && docker build -t ${USER_NAME}/prometheus .

docker-build-alertmanager:
	cd ./monitoring/alertmanager && docker build -t ${USER_NAME}/alertmanager .

docker-build-cadvisor:
	cd ./monitoring/cadvisor && docker build -t ${USER_NAME}/cadvisor .

docker-build-grafana:
	cd ./monitoring/grafana && docker build -t ${USER_NAME}/grafana .

docker-push-images: docker-ui-push docker-comment-push docker-post-push docker-blackbox_exporter-push docker-prometheus-push docker-alertmanager-push docker-cadvisor-push docker-grafana-push docker-mongodb_exporter-push

docker-ui-push:
	docker push ${USER_NAME}/ui

docker-comment-push:
	docker push ${USER_NAME}/comment

docker-post-push:
	docker push ${USER_NAME}/post

docker-blackbox_exporter-push:
	docker push ${USER_NAME}/blackbox_exporter

docker-mongodb_exporter-push:
	docker push ${USER_NAME}/mongodb_exporter

docker-prometheus-push:
	docker push ${USER_NAME}/prometheus

docker-alertmanager-push:
	docker push ${USER_NAME}/alertmanager

docker-cadvisor-push:
	docker push ${USER_NAME}/cadvisor

docker-grafana-push:
	docker push ${USER_NAME}/grafana