# Microservices Demo Reference Application

## Clone the latest Microservices Reference Application

git clone https://github.com/gawde-abhijeet/microservices-refapp.git

## Setup the Docker Container per application services

### get into the microservices-refapp folder
cd microservices-refapp/

#### a) Deploy customized Front-End Application 

docker-compose -f docker-deploy/docker-compose-front-end.yml up -d

#### b) Deploy customized Orders Application Service

chmod u+x source-app/orders/scripts/build.sh
./source-app/orders/scripts/build.sh
docker-compose -f docker-deploy/docker-compose-orders.yml up -d

#### c) Deploy rest other application services

docker-compose -f docker-deploy/docker-compose-rest-all.yml up -d

