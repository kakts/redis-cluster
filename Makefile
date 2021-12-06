.PHONY: dbuild
dbuild:
	docker-compose build

.PHONY: dup
dup:
	docker-compose up -d --scale redis=6

.PHONY: ddown
ddown:
	docker-compose down

.PHONY: dnet
dnet:
	docker network inspect redis-cluster_redis_network

.PHONY: create_cluster
create_cluster:
	./create_cluster.sh

.PHONE: show_cluster
show_cluster:
	docker-compose exec redis redis-cli cluster nodes
