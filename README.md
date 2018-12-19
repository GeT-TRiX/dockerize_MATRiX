# dockerize_MATRiX
![alt text](https://avatars0.githubusercontent.com/u/5429470?s=200&v=4 )
![alt text](img/plus-math.png)
![alt text](https://avatars2.githubusercontent.com/u/274806?s=200&v=4 )


## Installation

You can use MATRiX locally by installing Docker on your machine.
1. [Docker for Ubuntu/Debian](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
2. [Docker for Windows/Mac](https://www.docker.com/)

First you need to clone the repositories
```
git clone https://github.com/GeT-TRiX/dockerize_MATRiX
git clone https://github.com/GeT-TRiX/MA_Trix_App
mv MA_Trix_App dockerize_MATRiX/
```
You need to respect the following arborescence
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
