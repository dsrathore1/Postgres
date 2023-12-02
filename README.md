<h1 align='center'> 🐘 PostgreSQL and Node.js CRUD App 🚀 </h1>

This repository contains the code for a simple CRUD (Create, Read, Update, Delete) application built with PostgreSQL and Node.js. The application uses Docker for running the PostgreSQL database in a container and is orchestrated using `docker-compose`. Additionally, the Node.js server is connected to the PostgreSQL database to enable CRUD operations through a RESTful API. You can manage your PostgreSQL database using PgAdmin4.

## Table of Contents 📋

- [Table of Contents 📋](#table-of-contents-)
- [Features 🌟](#features-)
- [Prerequisites 🛠️](#prerequisites-️)
- [Getting Started 🚀](#getting-started-)
- [Docker Setup 🐳](#docker-setup-)
- [Node.js Server 🚀](#nodejs-server-)
- [PgAdmin4 📊](#pgadmin4-)
- [CRUD Operations ✏️](#crud-operations-️)

## Features 🌟

- PostgreSQL database for data storage
- Dockerized setup using `docker-compose`
- Node.js server for API creation
- CRUD operations (Create, Read, Update, Delete)
- Deployment of the Node.js application
- Management of PostgreSQL with PgAdmin4 📊

## Prerequisites 🛠️

Before you begin, ensure you have the following prerequisites installed:

- [Docker](https://www.docker.com/) 🐳
- [Node.js](https://nodejs.org/) 🚀
- [PgAdmin4](https://www.pgadmin.org/) 📊

## Getting Started 🚀

1. Clone this repository:

   ```bash
   git clone https://github.com/dsrathore1/Postgres.git
   cd postgres-nodejs-crud
   ```

2. Install Node.js dependencies:

   ```bash
   npm install
   ```

## Docker Setup 🐳

The PostgreSQL database is containerized using Docker. The `docker-compose.yml` file defines the services and configurations for the database container.

```bash
docker-compose up -d
```

This command will start the PostgreSQL container in the background.

## Node.js Server 🚀

The Node.js server is responsible for handling API requests and interacting with the PostgreSQL database. The server code is located in the `server` directory.

To start the Node.js server:

```bash
npm start
```

The server will be running at [http://localhost:3001](http://localhost:3001).

## PgAdmin4 📊

PgAdmin4 is a powerful administration and management tool for the PostgreSQL database. You can access it through [http://localhost:8080](http://localhost:8080) after starting the Docker container.

Use the following credentials:
- **Username:** admin@example.com
- **Password:** admin

## CRUD Operations ✏️

The API supports the following CRUD operations:

- **Create:** `POST /api/resource`
- **Read:** `GET /api/resource`
- **Update:** `PUT /api/resource/:id`
- **Delete:** `DELETE /api/resource/:id`
