# ollama4j Web UI

A modern Vaadin-based web UI for interacting with [Ollama](https://ollama.com), built using Java, Spring Boot, and [ollama4j](https://github.com/ollama4j/ollama4j).

## Features

- Simple and intuitive user interface.
- Direct integration with the Ollama API via ollama4j.
- Supports large request payloads (up to 50 MB).
- Easily configurable and deployable as a Docker container.

## Requirements

- Java 21
- Docker (optional, recommended for production deployments)

## Building and Running the Application

### Build the Project
```bash
mvn clean install
```

### Run in Development Mode
```bash
mvn clean spring-boot:run
```

### Build for Production
```bash
mvn -Drevision=0.0.1 clean package -Pproduction
```

### Docker Deployment

#### Build Docker Image
```bash
docker build -t gkrost/ollama4j-web-ui:0.0.1 .
```

#### Run Docker Container
```bash
docker run -it -p 9090:8080 -e OLLAMA_HOST_ADDR='http://192.168.29.223:11434' gkrost/ollama4j-web-ui:0.0.1
```

## Configuration

You can configure the application using environment variables:

| Environment Variable | Default Value                 | Description                         |
|----------------------|-------------------------------|-------------------------------------|
| `SERVER_PORT`        | `9090`                        | Port on which the server runs       |
| `OLLAMA_HOST_ADDR`   | `http://localhost:11434`      | URL for connecting to Ollama server |

## Development Notes

- The default browser automatically opens when running in development mode.
- Allowed Vaadin packages are configured to speed up development.

## Contributions

Contributions, feedback, and pull requests are always welcome!

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
