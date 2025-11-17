@echo off
echo Starting Docker Compose...
docker compose up -d

echo Waiting for services to start...
timeout /t 10

echo Testing the application...
echo.

echo Adding TestUser...
curl localhost:8080/add?name=TestUser
echo.

echo Adding Alice...
curl localhost:8080/add?name=Alice
echo.

echo Adding Bob...
curl localhost:8080/add?name=Bob
echo.

echo Checking all users...
curl localhost:8080/users
echo.

echo.
echo Test completed! Press any key to stop the application...
pause

echo Stopping Docker Compose...
docker compose down