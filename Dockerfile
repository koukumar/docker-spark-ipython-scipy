FROM logbase/spark-ipython

MAINTAINER karthikv2k@gmail.com

ENV DEBIAN_FRONTEND noninteractive

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

CMD ["bash", "/run.sh"]
