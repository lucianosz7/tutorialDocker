FROM docker.io/library/ubuntu:18.04
LABEL Name = tutorial docker

ENV UBUNTO_FRONTEND=noninteractive

#DEPENDÊNCIAS
ADD package.json package-lock.json ./tmp/
RUN apt-get update
RUN apt-get install -y git wget curl unzip ruby autogen autoconf libtool
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install -y nodejs
RUN npm install -g karma 
RUN npm install -g @angular/cli

WORKDIR tutorialDocker
EXPOSE 80
CMD ng serve