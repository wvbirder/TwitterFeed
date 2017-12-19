FROM openjdk

MAINTAINER Dennis Foley version: 0.1

# Set default WORKDIR
WORKDIR /source

COPY . /source

RUN apt-get update -y

RUN echo Y | apt-get install maven

RUN mvn -version

# For Linux
#RUN /c/Users/oracle/u01/TwitterFeed/build.sh

#For Docker Toolbox (Windows)
RUN [ "sh", "-c", "mvn clean assembly:assembly" ]

EXPOSE 8080

CMD sh target/bin/start

