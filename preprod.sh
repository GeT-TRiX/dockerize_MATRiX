#!/bin/bash 
cd MA_Trix_App
git checkout preprod
git pull
cd ..
sudo docker build -t matrixdev .
cd MA_Trix_App
git checkout master
