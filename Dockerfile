FROM ubuntu
MAINTAINER Lewis Zhang "lewiszhang@gmail.com"

# jenkins
RUN apt-get install -y wget
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update
RUN apt-get install jenkins -y
RUN service jenkins stop

# git
RUN apt-get install -y git

# rbenv support
RUN apt-get install -y build-essential zlib1g-dev openssl libssl-dev libreadline-dev git-core

CMD java -jar /usr/share/jenkins/jenkins.war
EXPOSE 8080
