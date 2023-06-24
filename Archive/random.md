## Maven + SonarQube 
mvn clean sonar:sonar \
  -Dsonar.projectKey=JavaWebApp \
  -Dsonar.host.url=http://44.203.4.255:9000 \
  -Dsonar.login=<sonarqube prject token>

## Actual maven + sonar
mvn sonar:sonar \
  -Dsonar.projectKey=Maven-JavaWebApp \
  -Dsonar.host.url=http://172.31.88.13:9000 \
  -Dsonar.login=

## Before Running the `deploy` Command make sure to update the Nexus pom.xml and settings.xml with Nexus IP addedd, Username and Password. Make sure the plugings are defined as well
mvn clean package sonar:sonar \
  -Dsonar.projectKey=JavaWebApp-Project3 \
  -Dsonar.host.url=http://44.203.4.255:9000 \
  -Dsonar.login=<sonarqube prject token>

## Clean, Build, Test and Deploy(to Nexus)
mvn clean package sonar:sonar deploy \
  -Dsonar.projectKey=JavaWebApp-Project3 \
  -Dsonar.host.url=http://44.203.4.255:9000 \
  -Dsonar.login=<sonarqube prject token>

## Run in Maven Terminal to change to java 11
sudo alternatives --config java