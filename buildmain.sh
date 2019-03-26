#!/bin/bash 
kill $(lsof -t -i:8080)
sudo docker system prune -f
sudo systemctl restart nginx
sudo systemctl restart docker
sudo docker build -t openanalytics/shinyproxy-template .
nohup java -jar shinyproxy-2.1.0.jar & 
