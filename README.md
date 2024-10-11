
# LINUXtips-Giropops-Passwords-Distroless

This repository contains a Dockerfile that sets up a Flask application with a Python environment and integration with Redis. It is a password creation application. Below, you will find instructions on how to clone the repository, build the Docker image, and run the necessary containers.

## Prerequisites

- Docker installed on your system.
- Internet access to download the necessary images.

## How to Use

### 1. Clone the Repository

Clone the repository using the following command:

```bash
git clone https://github.com/rafamellonh/LINUXtips-Giropops-Senhas-Distroless.git
cd LINUXtips-Giropops-Senhas-Distroless
```

### 2. Build the Docker Image

Run the following command to build the Docker image:

```bash
docker --debug image build -t linuxtips-giropops-passwords-distroless:1.0 .
```

### 3. Create the Redis Container

Before running the Flask application, you need to create a container for Redis. Change the IP in the `-e REDIS_HOST` variable to the IP corresponding to your local network. Run:

```bash
docker container run -d --name redis -p 6379:6379 -e REDIS_HOST=172.16.0.10 redis
```

### 4. Create the Container from the Image

Now you can create a container from the image you just built. Run:

```bash
docker container run -d --name passwords-distroless -p 5000:5000 --env REDIS_HOST=172.16.0.10 linuxtips-giropops-passwords-distroless:1.0
```

### 5. Access the Application

Once the application container is running, you can access it in your browser using the address of your container:

```
http://IP:5000
```

### Notes

- Ensure that Redis is running before starting the Flask application.
- Redis should be accessible via the IP you configured in the `REDIS_HOST` environment variable.

## Contribution

If you would like to contribute to this project, feel free to open an issue or submit a pull request!

## License

This project is licensed under the [MIT License](LICENSE).