# dockerize_MATRiX
![alt text](https://avatars0.githubusercontent.com/u/5429470?s=200&v=4 )
![alt text](img/plus-math.png)
![alt text](https://avatars2.githubusercontent.com/u/274806?s=200&v=4 )

## Getting started

First make sure that you have java installed on your machine 

```
java -version
```

that will display the following message:

```
openjdk version "1.8.0_72"
OpenJDK Runtime Environment (Zulu 8.13.0.5-linux64) (build 1.8.0_72-b15)
OpenJDK 64-Bit Server VM (Zulu 8.13.0.5-linux64) (build 25.72-b15, mixed mode)
```

if its not the case follow the tutorial [here](https://thishosting.rocks/install-java-ubuntu/)

You can use MATRiX locally by installing Docker on your machine.
1. [Docker for Ubuntu/Debian](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
2. [Docker for Windows/Mac](https://www.docker.com/)

Link the docker daeomon to shinyproxy.
By default ShinyProxy will do so on port 2375 of the docker host. In order to allow for connections on port 2375, the startup options need to be edited.

```
sudo mkdir /etc/systemd/system/docker.service.d/
touch /etc/systemd/system/docker.service.d/override.conf
sudo nano /etc/systemd/system/docker.service.d/override.conf
```
add the following information in the new file

```
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -D -H tcp://127.0.0.1:2375
```

To validate the new configuration

```
sudo systemctl daemon-reload
sudo systemctl restart docker
```

for more information check the [shinyproxy guide](https://www.shinyproxy.io/getting-started/)

## Installation


First you need to clone the repositories
```
git clone https://github.com/GeT-TRiX/dockerize_MATRiX
git clone https://github.com/GeT-TRiX/MA_Trix_App
mv MA_Trix_App dockerize_MATRiX/
```
You need to respect the following arborescence

```
.
+-- application.yml
+-- MA_Trix_App
|   +-- server.R
|   +-- ui.R
|   +-- ...
+-- shinyproxy-2.0.5.jar
+-- Rprofile.site
+-- Dockerfile
```

```
cd dockerize_MATRiX
sudo docker build -t openanalytics/shinyproxy-template .
java -jar shinyproxy-2.0.5.jar
connect to http://localhost:8080/
id:tesla
password:password
and click on the last link (MATRiX)
```

## Contact

Here are our mail [Franck Soubès] (franck.soubes@inra.fr) or [Yannick Lippi] (yannick.lippi@inra.fr) for any questions, suggestions or if you need help to use MATRiX, dont hesitate to contact us.
