#!/bin/bash


REDIS_NETWORK=redis-cluster_redis_network
REDIS_SERVICE_NAME=redis

REDIS_PORT=6379
CLUSTER_REPLICAS=1

# 該当するノードの ip:portの一覧を取得
NODES=`docker network inspect ${REDIS_NETWORK} | jq '.[0].Containers | .[].IPv4Address' | perl -wp -e 's!"(.+)/.+"\r?\n!$1:6379 !g'`

# クラスターのレプリカ数1でクラスターノード作成
docker-compose exec ${REDIS_SERVICE_NAME} bash -c "yes yes | redis-cli --cluster create ${NODES} --cluster-replicas ${CLUSTER_REPLICAS}"
