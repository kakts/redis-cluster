FROM redis:5.0.8

# redis confを所定のディレクトリにコピー
COPY redis.conf /usr/local/etc/redis/redis.conf
# /usr/local/etc/redisのオーナー修正
RUN chown -R redis.redis /usr/local/etc/redis

# redis-serverの起動 設定ファイルは上記でコピーしたものを使う
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
