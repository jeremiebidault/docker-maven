ARG SELENIUM_RELEASE

FROM aarto/selenium:${SELENIUM_RELEASE}

ARG MAVEN_VERSION \
    MAVEN_RELEASE

RUN apt-get -y update && \
    apt-get -y install curl sudo git jq gnupg2

RUN echo ${MAVEN_VERSION}
RUN echo ${MAVEN_RELEASE}
RUN wget -q https://dlcdn.apache.org/maven/maven-${MAVEN_VERSION}/${MAVEN_RELEASE}/binaries/apache-maven-${MAVEN_RELEASE}-bin.tar.gz
RUN mkdir -p /usr/local/lib/maven
RUN tar -xvf apache-maven-${MAVEN_RELEASE}-bin.tar.gz -C /usr/local/lib/maven
RUN rm -rf apache-maven-${MAVEN_RELEASE}-bin.tar.gz
RUN rm -rf /var/lib/apt/lists/*

ENV PATH=/usr/local/lib/maven/apache-maven-${MAVEN_RELEASE}/bin:${PATH} \
    JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
