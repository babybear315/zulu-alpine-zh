FROM azul/zulu-openjdk-alpine:8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.13/main/" > /etc/apk/repositories && \
    apk --update add font-adobe-100dpi tzdata && \
    rm -rf /var/cache/apk/* && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

ENV JAVA_HOME=/usr/lib/jvm/zulu8-ca

RUN mkdir /usr/share/fonts/win
COPY ./font/*.ttf /usr/share/fonts/win/
