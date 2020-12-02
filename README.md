# ChirpStack and ThingsBoard integration

Deploy thingsboard and chirpstack in docker.

## Usage from docker compose

Clone git repo
```sh
git clone https://github.com/ivanmorenoj/chirpstack-thingsboard.git

cd thingsboard-docker
```

Init ThingsBoard and chirpstack with docker-compose
```sh
docker-compose up -d 
```

See logs
```sh
docker-compose logs
```

## Deploy ThingsBoard  and chirpstack with docker swarm
Create volumes \
Note: For persistent data inter containers, use one plugin or nfs

```sh
docker volume create postgres-data
docker volume create cd-redis-data
docker volume create tb-data
```

Create a secret for postgres root password
```sh
echo -n "Ingress postgres sql root password: "; read -s pass; echo $pass | docker secret create psql-passw -
```

Then deploy in the cluster
```sh
docker stack deploy -c swarm-deploy.yml tbcs
```

## Default username / password for Thingsboard

After executing this command you can open http://{yor-host-ip}:30011 in your browser. \
You should see ThingsBoard login page. Use the following default credentials:

- **Systen Administrator:** sysadmin@thingsboard.org / sysadmin
- **Tenant Administrator:** tenant@thingsboard.org / tenant
- **Customer User:** customer@thingsboard.org / customer

You can always change passwords for each account in account profile page.

## Default username / password for chirpstack 

Open ChirpStack http://{host-ip}:30010

- **Admin:** admin / admin

## Deploy with domain

Use an external proxy like nginx to manage web traffic

# Kubernetes

See [k8s](./k8s) directory
