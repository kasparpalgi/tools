# Cleaning

```
docker container prune --force
docker image prune --all --force
docker system prune -af --volumes
sudo truncate -s 0 /var/lib/docker/containers/*/*-json.log
sudo find /var/lib/docker/volumes/captain--iot-eclipse-log/_data -type f -exec truncate -s 0 {} \;
```

## Check usage

* Check disc usage: `df -h`
* Check which directories use the most space: `sudo du -sh /var/lib/docker/volumes/* | sort -h | tail -n 20`

## Clean unused volumes

1. ` docker volume ls`
2. If something seems unused then check if any container using in: `docker ps -a --filter volume=VOLUME_NAME_HERE`
3. if nothing uses: `docker volume rm VOLUME_NAME_HER`

## Vacuum PostgreSQL

1. Identify PostgreSQL container `docker ps`
2. `docker exec -it <NAME_HERE.. eg. srv-captain--api-db.1.n86kik1mbqh5h0c2trj4wuul1> psql -U postgres -d default`
3. `VACUUM (FULL,);`

## Auto cleanup

1. create `/etc/cron.weekly/docker-cleanup`

```bash
#!/bin/bash
# Cleanup Docker images, containers, logs

docker container prune --force
docker image prune --all --force
docker system prune -af --volumes

# Truncate container logs
find /var/lib/docker/containers/ -type f -name "*-json.log" -exec truncate -s 0 {} \;

# Truncate iot-eclipse-log files
find /var/lib/docker/volumes/captain--iot-eclipse-log/_data -type f -exec truncate -s 0 {} \;
```

2. Make it executable: `chmod +x /etc/cron.weekly/docker-cleanup`

### PostgreSQL vacuum

1. File `/etc/cron.daily/vacuum-api-db`

```bash
#!/bin/bash
CONTAINER=$(docker ps -q -f name=srv-captain--api-db)
if [ -n "$CONTAINER" ]; then
  docker exec "$CONTAINER" \
    psql -U postgres -d default -c "VACUUM;"
fi

CONTAINER=$(docker ps -q -f name=srv-captain--perroz-woo-db-data)
if [ -n "$CONTAINER" ]; then
  docker exec "$CONTAINER" \
      mysql -u root -pYOURPASSWORD -e "OPTIMIZE TABLE wp_posts; ANALYZE TABLE wp_posts;" wordpress
fi

CONTAINER=$(docker ps -q -f name=srv-captain--automate-db)
if [ -n "$CONTAINER" ]; then
  docker exec "$CONTAINER" \
    psql -U n8n -d n8n -c "VACUUM;"
fi

CONTAINER=$(docker ps -q -f name=srv-captain--apps-db-data)
if [ -n "$CONTAINER" ]; then
  docker exec "$CONTAINER" \
    psql -U postgres -d default -c "VACUUM;"
fi

CONTAINER=$(docker ps -q -f name=srv-captain--cmsraamatu-data)
if [ -n "$CONTAINER" ]; then
  docker exec "$CONTAINER" \
    psql -U pguser -d default -c "VACUUM;"
fi

CONTAINER=$(docker ps -q -f name=srv-captain--life-effect-db)
if [ -n "$CONTAINER" ]; then
  docker exec "$CONTAINER" \
    psql -U posuse -d default -c "VACUUM;"
fi

CONTAINER=$(docker ps -q -f name=srv-captain--leadiq-be-db-data)
if [ -n "$CONTAINER" ]; then
  docker exec "$CONTAINER" \
    psql -U hcAuRRv -d default -c "VACUUM;"
fi

CONTAINER=$(docker ps -q -f name=srv-captain--api-raamat-db-data)
if [ -n "$CONTAINER" ]; then
  docker exec "$CONTAINER" \
    psql -U pguser -d default -c "VACUUM;"
fi
```

2. `chmod +x /etc/cron.daily/vacuum-api-db`