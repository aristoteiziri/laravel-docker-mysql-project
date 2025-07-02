# Utilise l'image officielle de Nginx comme base.
# Cela signifie que ce conteneur démarrera avec un serveur web Nginx déjà installé.
#FROM nginx

# Copie un fichier de configuration personnalisé Nginx depuis le dossier du projet
# vers le dossier de configuration utilisé par Nginx dans le conteneur.
# Ici, on remplace la configuration par défaut par celle que vous avez définie dans `docker/conf/vhost.conf`.
#ADD docker/conf/vhost.conf /etc/nginx/conf.d/default.conf




FROM nginx

# 👇 On remplace l'ancien chemin par le bon fichier de config sécurisé
# Copie le fichier de configuration Nginx depuis le dossier du projet
# vers le dossier de configuration utilisé par Nginx dans le conteneur.
# Ici, on remplace la configuration par défaut par celle que vous avez définie dans `docker/nginx/default.conf`.
# Ce fichier contient les règles de configuration pour le serveur web Ngin
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Copie le fichier .htpasswd dans le conteneur Nginx
# Ce fichier contient les informations d'authentification pour protéger l'accès à l'application.
# Il est utilisé pour la protection par mot de passe HTTP basique.
# Le fichier .htpasswd doit être créé au préalable avec les utilisateurs et mots de passe nécessaires
# (par exemple, en utilisant la commande `htpasswd`).
COPY docker/nginx/.htpasswd /etc/nginx/.htpasswd


# Définit le répertoire de travail dans le conteneur à /var/www/html
# Cela signifie que toute commande ou action ultérieure (ex : COPY, RUN...) se fera à partir de ce chemin.
WORKDIR /var/www/html
