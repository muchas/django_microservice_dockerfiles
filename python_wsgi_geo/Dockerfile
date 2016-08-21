FROM kglod/python_wsgi

ENV LD_LIBRARY_PATH /usr/local/lib


WORKDIR /tmp
RUN wget http://download.osgeo.org/geos/geos-3.4.2.tar.bz2
RUN tar xjf geos-3.4.2.tar.bz2
WORKDIR /tmp/geos-3.4.2
RUN ./configure && make && make install

WORKDIR /tmp
RUN wget http://download.osgeo.org/gdal/1.11.2/gdal-1.11.2.tar.gz
RUN tar xzf gdal-1.11.2.tar.gz
WORKDIR /tmp/gdal-1.11.2
RUN ./configure && make && make install

WORKDIR /code
