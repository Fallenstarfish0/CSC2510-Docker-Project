# Docker Project Testing Commands

## Step 6: Test Locally

### 1. Start the application
```bash
# Navigate to the project directory
cd docker_project/CSC2510-Docker-Project

# Start the application (this will build and run both the Go app and PostgreSQL database)
docker compose up
```

### 2. In another terminal, test adding a user
```bash
# Add a test user
curl localhost:8080/add?name=TestUser

# Expected response: User 'TestUser' added!
```

### 3. Check users
```bash
# Get all users
curl localhost:8080/users

# Expected response: [{"id":1,"name":"TestUser"}]
```

### 4. Add more users for testing
```bash
# Add more users
curl localhost:8080/add?name=Alice
curl localhost:8080/add?name=Bob
curl localhost:8080/add?name=Charlie

# Check all users again
curl localhost:8080/users

# Expected response: 
# [
#   {"id":1,"name":"TestUser"},
#   {"id":2,"name":"Alice"},
#   {"id":3,"name":"Bob"},
#   {"id":4,"name":"Charlie"}
# ]
```

### 5. Stop the application
```bash
# Stop and remove containers
docker compose down

# Optional: Remove volumes (this will delete the database data)
docker compose down -v
```

## Alternative Testing with Browser

You can also test using a web browser:

1. **Add users**: Visit `http://localhost:8080/add?name=YourName`
2. **View users**: Visit `http://localhost:8080/users`

## Troubleshooting

If you encounter issues:

1. **Check if containers are running**:
   ```bash
   docker ps
   ```

2. **View logs**:
   ```bash
   docker compose logs
   ```

3. **Check specific service logs**:
   ```bash
   docker compose logs app
   docker compose logs db
   ```

4. **Rebuild if needed**:
   ```bash
   docker compose up --build
   ```

## What Should Happen

1. **Docker Compose Up**: 
   - PostgreSQL container starts first
   - Health check ensures database is ready
   - Go application container starts and connects to database
   - Application creates the `users` table if it doesn't exist
   - Server starts listening on port 8080

2. **Adding Users**:
   - Each curl request to `/add?name=X` inserts a new user into the database
   - Returns confirmation message

3. **Viewing Users**:
   - curl request to `/users` returns JSON array of all users
   - Each user has an `id` (auto-incremented) and `name`

4. **Docker Compose Down**:
   - Stops and removes containers
   - Preserves data in named volume (unless `-v` flag is used)