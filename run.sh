/etc/bootstrap.sh
mkdir -p /ipython
cd /ipython
IPYTHON_OPTS="notebook --ip=0.0.0.0 --no-browser --port=8888" pyspark