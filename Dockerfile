FROM node:23-bookworm

WORKDIR /www/app

#RUN sed -i 's|http://deb.debian.org|http://ftp.us.debian.org|' /etc/apt/sources.list
#RUN apt-get update && apt-get install -y \
    #build-essential python3 python3-dev python3-pip gcc g++ make --fix-missing

RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    python3-dev \
    python3-pip \
    gcc \
    g++ \
    make
    
COPY package*.json ./

RUN npm install

COPY . .

COPY ./scripts /usr/local/bin/

RUN chmod +x -R /usr/local/bin/

EXPOSE 80

ENTRYPOINT ["/bin/bash", "/usr/local/bin/start.sh"]

#ENTRYPOINT ["start.sh", "$NODE_ENV"]

#CMD ["ls", "-la"]