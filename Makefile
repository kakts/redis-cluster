.PHONY: dbuild
dbuild:
	docker-compose build

.PHONY: dup
dup:
	docker-compose up -d --scale redis=6

.PHONY: ddown
ddown:
	docker-compose down