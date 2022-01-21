ARG SELENIUM_RELEASE

FROM aarto/selenium:${SELENIUM_RELEASE}

ARG MAVEN_VERSION \
    MAVEN_RELEASE \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        sudo \
        git \
        curl \
        jq && \
    # maven
    wget -q https://dlcdn.apache.org/maven/maven-${MAVEN_VERSION}/${MAVEN_RELEASE}/binaries/apache-maven-${MAVEN_RELEASE}-bin.tar.gz && \
    mkdir -p /usr/local/lib/maven && \
    tar -xvf apache-maven-${MAVEN_RELEASE}-bin.tar.gz -C /usr/local/lib/maven && \
    rm -rf apache-maven-${MAVEN_RELEASE}-bin.tar.gz && \
    # cleanup
    rm -rf /var/lib/apt/lists/*

ENV PATH=/usr/local/lib/maven/apache-maven-${MAVEN_RELEASE}/bin:${PATH} \
    JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
