FROM tomcat:8.0

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -yqq update && \
    apt-get -yqq remove console-setup ifupdown geoip-database && \
    apt-get -yqq --no-install-recommends install puppet curl tar && \
    apt-get clean && rm -rf /var/lib/apt /var/cache/apt/archives/* /tmp/* /var/tmp/*

# you don't need modules for this manifest:   
# Add puppet modules:
# ADD ./modules /tmp/modules

# Add manifest to apply
ADD ./tomcat.pp /tmp/manifest.pp

# Apply manifest
# RUN puppet apply --modulepath=/tmp/modules /tmp/manifest.pp
# you don't need modules for this manifest:
RUN puppet apply /tmp/manifest.pp

# tomcat:8.0 includes a CMD which start catalina.sh run, we replace this CMD to print access log on screen and we can filter it with fluentd

CMD /usr/local/tomcat/bin/startup.sh && touch /usr/local/tomcat/logs/localhost_access_log.txt && tail -f /usr/local/tomcat/logs/localhost_access_log.txt