# postgresql-docker-demo

Simple PostgreSQL 13 setup on Docker with sample data.

## Requirements

- [Docker](https://docs.docker.com/engine/install/)

### Instructions

1. Clone the repository

   ```sh
    git clone https://github.com/jpuris/postgresql-docker-demo.git
    cd postgresql-docker-demo
   ```

2. Starting the server

    ```sh
    docker compose up -d
    ```

3. Loading data

    ```txt
    docker exec -it postgresql-docker-demo psql -U postgres -f /data/demo_ddl.sql
    ```

(Optional) Checking the server logs

```sh
docker logs postgresql-docker-demo --follow
```

### Connecting to the server

Use your favorite DB client.

```txt
host:       127.0.0.1
port:       5432
username:   postgres
password:   postgres
```

### ERD

![erd](/img/demo_erd.png)

### Cleanup

```sh
docker compose down
```

## Attribution

Data sets were retrieved from <https://www.w3schools.com/SQL/> WebSQL application.

## License

MIT
