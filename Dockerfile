FROM logbase/docker-spark

MAINTAINER karthikv2k@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# Python binary dependencies, developer tools
RUN apt-get update && apt-get install -y -q \
    build-essential \
    make \
    gcc \
    zlib1g-dev \
    git \
    python \
    python-dev \
    python-pip \
    python-sphinx \
    libzmq3-dev \
    sqlite3 \
    libsqlite3-dev \
    pandoc \
    libcurl4-openssl-dev

RUN pip2 install ipython[notebook]

WORKDIR /
RUN git clone https://github.com/ipython/docker-notebook.git
WORKDIR /docker-notebook/scipystack
RUN cp openblas.conf /etc/ld.so.conf.d/openblas.conf
RUN cp numpy-site.cfg /tmp/numpy-site.cfg
RUN cp scipy-site.cfg /tmp/scipy-site.cfg
RUN cp build_scipy_stack.sh /tmp/build_scipy_stack.sh
RUN chmod a+x /tmp/build_scipy_stack.sh
RUN /tmp/build_scipy_stack.sh

## Extremely basic test of install
RUN python -c "import matplotlib, scipy, numpy, pandas, sklearn, seaborn, yt, patsy, sympy, IPython, statsmodels"

EXPOSE 8888

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["bash", "/run.sh"]
