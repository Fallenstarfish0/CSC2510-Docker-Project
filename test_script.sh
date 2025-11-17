#!/bin/bash

echo "Starting Docker Compose..."
docker compose up -d

echo "Waiting for services to start..."
sleep 10

echo "Testing the application..."
echo

echo "Adding TestUser..."
curl localhost:8080/add?name=TestUser
echo

echo "Adding Alice..."
curl localhost:8080/add?name=Alice
echo

echo "Adding Bob..."
curl localhost:8080/add?name=Bob
echo

echo "Checking all users..."
curl localhost:8080/users
echo

echo
echo "Test completed! Press Enter to stop the application..."
read

echo "Stopping Docker Compose..."
docker compose down