FROM ibmjava:jre-alpine

RUN apk --no-cache --update upgrade
RUN apk --no-cache add curl
RUN curl -Lo /tmp/cmd.run.zip http://cdn.sencha.com/cmd/6.5.0/no-jre/SenchaCmd-6.5.0-linux-i386.sh.zip && \
    unzip -p /tmp/cmd.run.zip > /tmp/cmd-install.run && \
    chmod +x /tmp/cmd-install.run && \
    INSTALL4J_ADD_VM_PARAMS="-Djava.awt.headless=true" /tmp/cmd-install.run -q -dir /usr/local/bin/sencha && \
    rm /tmp/cmd-install.run /tmp/cmd.run.zip

ENV PATH /usr/local/bin/sencha/:$PATH
