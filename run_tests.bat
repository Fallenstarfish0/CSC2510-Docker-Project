@echo off
echo Starting Docker application...
docker compose up -d

echo Waiting 15 seconds for services...
timeout /t 15 /nobreak

echo Testing add user...
curl "localhost:8080/add?name=TestUser"
echo.

echo Testing get users...
curl "localhost:8080/users"
echo.

echo Stopping application...
docker compose down