# Utilise l'image officielle de PHP, version 8.1 avec FPM (FastCGI Process Manager).
# Cette version est optimisée pour exécuter des applications PHP comme Laravel avec un serveur web (ex : Nginx).
FROM php:8.1-fpm

# Exécute une mise à jour des paquets disponibles dans le conteneur
# puis installe les extensions PHP nécessaires à Laravel :
# - pdo : interface générique d'accès aux bases de données
# - pdo_mysql : extension pour utiliser PDO avec MySQL
RUN apt-get update && docker-php-ext-install pdo pdo_mysql
