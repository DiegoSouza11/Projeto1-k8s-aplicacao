#!/bin/bash

echo "Buildando imagem php e subindo para o dockerhub..."

docker build . -t diegosantos144/php:1.0 backend/.
docker push diegosantos144/php:1.0

echo "Buildando imagem mysql e subindo para o dockerhub..."

docker build . -t diegosantos144/meubanco:1.0 database/.
docker push diegosantos144/meubanco:1.0

echo "Criando os serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deploymentes..."

kubectl apply -f ./deployment.yml