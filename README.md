#spark-ipython-scipy

##What is this image?
This image contains spark in a single node configuration (from sequenceiq/docker-spark), ipython notebook, and scipy stack that contains libs like matplotlib, scipy, numpy, pandas, sklearn, seaborn, yt, patsy, sympy, and statsmodels.

##How to use this image?
```
docker run -d --name ipython-spark -p 8888:8888 logbase/spark-ipython-scipy
```
To mount a host drive for ipython storage:
```
docker run -d --name ipython-spark -p 8888:8888 -v <path>:/ipython logbase/spark-ipython-scipy
```

To access shell of the container for loading files to hdfs:
```
docker exec -it ipython-spark /bin/bash
```
Inside the container, use hdfs/hadoop cmd to load files to hdfs.
