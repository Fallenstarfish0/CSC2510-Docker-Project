# Install Docker First

Docker is not installed on this system.

## Steps:
1. Download Docker Desktop: https://www.docker.com/products/docker-desktop/
2. Install Docker Desktop
3. Restart computer
4. Start Docker Desktop application
5. Run: `docker compose up -d`
6. Test: `curl localhost:8080/add?name=TestUser`
7. Check: `curl localhost:8080/users`
8. Stop: `docker compose down`