FROM alpine:latest

MAINTAINER Jose Cortez <js.cortezbon@gmail.com>

RUN apk update && apk add --no-cache bash openssh sudo shadow openjdk8 curl tar procps

COPY alpine-key.pub /root/.ssh/authorized_keys

RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin\ yes/' /etc/ssh/sshd_config
RUN echo 'root:admin123' | chpasswd \
        && /usr/bin/ssh-keygen -A \
        && chown root:root -R /root/.ssh \
        && chmod 600 /root/.ssh/authorized_keys

#--------- install openjdk---------------
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
        PATH=$JAVA_HOME/bin:$PATH

#--------- install Maven---------------
ARG MAVEN_VERSION=3.6.2
ARG BASE_URL=https://www-us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
        && echo "Downlaoding maven" \
        && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
        && echo "Unziping maven" \
        && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
        && echo "Cleaning and setting links" \
        && rm -f /tmp/apache-maven.tar.gz \
        && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn \
        && mkdir -p /var/java-app

ENV M2_HOME=/usr/share/maven \
        MAVEN_HOME=/usr/share/maven \
        PATH=${M2_HOME}/bin:${PATH} \
        MAVEN_CONFIG=/root/.m2

VOLUME /app

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]