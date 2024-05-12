FROM intersystemsdc/iris-ml-community

USER root   

#ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get -y update \
#    && apt-get -y install apt-utils nano \
#    && apt-get install -y build-essential unzip pkg-config wget \
#    && apt-get install -y unixodbc-dev python3-pip

#RUN pip3 install pyodbc
#COPY odbc.ini /opt/irisapp/odbc.ini
#RUN odbcinst -i -d -f /opt/irisapp/odbc.ini


WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

COPY datasets datasets
COPY migration.sql migration.sql
COPY src src
COPY module.xml module.xml
COPY Installer.cls Installer.cls
COPY iris.script /tmp/iris.script

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
