# Utilise l'image officielle de Nginx comme base.
# Cela signifie que ce conteneur démarrera avec un serveur web Nginx déjà installé.
FROM nginx

# Copie un fichier de configuration personnalisé Nginx depuis le dossier du projet
# vers le dossier de configuration utilisé par Nginx dans le conteneur.
# Ici, on remplace la configuration par défaut par celle que vous avez définie dans `docker/conf/vhost.conf`.
ADD docker/conf/vhost.conf /etc/nginx/conf.d/default.conf

# Définit le répertoire de travail dans le conteneur à /var/www/html
# Cela signifie que toute commande ou action ultérieure (ex : COPY, RUN...) se fera à partir de ce chemin.
WORKDIR /var/www/html
