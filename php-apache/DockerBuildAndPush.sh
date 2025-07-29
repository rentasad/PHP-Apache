#!/bin/bash

# Definiere das Repository und den Docker Hub Benutzernamen
REPOSITORY_NAME="php8-apache"
DOCKER_HUB_USER="gustinimst"
VERSION_FILE="version.txt"

# Funktion, um die aktuelle Version anzuzeigen
get_current_version() {
    if [ -f "$VERSION_FILE" ]; then
        CURRENT_VERSION=$(cat "$VERSION_FILE")
        echo "Die zuletzt verwendete Version ist: $CURRENT_VERSION"
    else
        CURRENT_VERSION="1.0"  # Standardversion, falls keine Version vorhanden ist
        echo "Keine Version gefunden, Standardversion: $CURRENT_VERSION"
    fi
}

# Funktion, um eine neue Version festzulegen
set_new_version() {
    get_current_version
    read -p "Möchtest du eine neue Version vergeben? (Aktuelle Version: $CURRENT_VERSION) [Gib die neue Version ein oder drücke Enter, um die aktuelle zu verwenden]: " NEW_VERSION

    if [ -n "$NEW_VERSION" ]; then
        CURRENT_VERSION=$NEW_VERSION
        echo "$NEW_VERSION" > "$VERSION_FILE"
        echo "Neue Version festgelegt: $NEW_VERSION"
    fi
}

# Funktion, um das Docker-Image zu erstellen
build_docker_image() {
    local version=$1
    IMAGE_NAME="${DOCKER_HUB_USER}/${REPOSITORY_NAME}:${version}"
    echo "Baue das Docker-Image: $IMAGE_NAME ..."
    docker build -t "$IMAGE_NAME" .
}

# Funktion, um das Docker-Image zu pushen
push_docker_image() {
    local version=$1
    IMAGE_NAME="${DOCKER_HUB_USER}/${REPOSITORY_NAME}:${version}"
    echo "Pushe das Docker-Image zu Docker Hub: $IMAGE_NAME ..."
    docker push "$IMAGE_NAME"
}

# Hauptlogik des Skripts
echo "Was möchtest du tun?"
echo "1. Erstellen"
echo "2. Erstellen und Pushen"
echo "3. Nur pushen"
read -p "Wähle eine Option (1, 2 oder 3): " CHOICE

set_new_version

case $CHOICE in
    1)
        build_docker_image "$CURRENT_VERSION"
        echo "Image wurde erstellt: $CURRENT_VERSION"
        ;;
    2)
        build_docker_image "$CURRENT_VERSION"
        push_docker_image "$CURRENT_VERSION"
        echo "Image wurde erstellt und gepusht: $CURRENT_VERSION"
        ;;
    3)
        push_docker_image "$CURRENT_VERSION"
        echo "Image wurde gepusht: $CURRENT_VERSION"
        ;;
    *)
        echo "Ungültige Auswahl!"
        ;;
esac
