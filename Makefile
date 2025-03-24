# Bauen der Anwendung (mit Tests)
build:
	mvn clean install

# Starten der Anwendung im Entwicklungsmodus
run-dev:
	mvn clean spring-boot:run

# Erstellen des Produktionspakets (JAR) mit Versionsnummer 0.0.1
prod:
	mvn -Drevision=0.0.1 clean package -Pproduction

# Docker Image bauen
docker-image:
	docker build -t gkrost/ollama4j-web-ui:0.0.1 .

# Docker Image starten
docker-run:
	docker run -it -p 9090:8080 -e OLLAMA_HOST_ADDR='http://192.168.29.223:11434' gkrost/ollama4j-web-ui:0.0.1