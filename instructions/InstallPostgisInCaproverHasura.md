# Install Postgis for the existing Hasura + PostgreSQL in Caprove

Make sure to update versions! This is for my old Postgres 12.

1. **Dump your database** (if you haven't already):

    First get your DB container: (eg. `srv-captain--api-db.1.ks3l0tycululmxz0ye7xv7d7s`):

    ```bash
   docker ps
   ```

    Then dump your data:
   ```bash
   docker exec -t <DB_CONTAINER> pg_dumpall -U postgres > all_databases.sql
   ```

   Or even better entire DB with data and constraints:

   ```bash
   pg_dump -U postgres --format=custom --file=full_dump.pgcustom
   ```

2. **Clean your data volume** so that initialization happens fresh:

   * Via CapRover Dashboard → **App Configs → Persistent Volumes**: rename the volume.
   * Or via CLI:

     ```bash
     docker volume rm <your-volume-name>
     ```

3. In Hasura console settings export the metadata JSON

4. **Update the image** in CapRover:

   * Go to **Apps → your‑postgres‑app → App Configs → Deploy from image name (find the right image name depending on your Postgres version and architecture as this is for Postgres 12 on ARM64)

     ```
     imresamu/postgis-arm64:12-3.5
     ```

5. **Restore your backup** once the container is running:

   ```bash
   cat all_databases.sql | docker exec -i <DB_CONTAINER> psql -U postgres
   ```

   Or if you exported also all the constraints: 

   ```bash
   pg_restore -U postgres -d your_database full_dump.pgcustom
   ```

6. **Enable PostGIS extensions**:

    Don't forget below to change also `<DB_NAME>`!

   ```bash
   docker exec -it <DB_CONTAINER> psql -U postgres
   \c <DB_NAME>
   CREATE EXTENSION IF NOT EXISTS postgis;
   CREATE EXTENSION IF NOT EXISTS postgis_topology;
   \dx
   \q
   ```

7. In Hasura console, import the exported metadata JSON
   
8. **Verify in Hasura**:

Open Hasura Console and see if you can create a new field with `geography` type