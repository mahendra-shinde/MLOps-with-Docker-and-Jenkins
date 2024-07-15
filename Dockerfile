FROM jupyter/scipy-notebook

RUN pip install joblib

USER root
RUN apt-get update -y && apt-get install -y jq

WORKDIR /home/mlops
RUN mkdir model raw_data processed_data results

ENV RAW_DATA_DIR=/home/mlops/raw_data
ENV PROCESSED_DATA_DIR=/home/mlops/processed_data
ENV MODEL_DIR=/home/mlops/model
ENV RESULTS_DIR=/home/mlops/results
ENV RAW_DATA_FILE=adult.csv

VOLUME /home/mlops/results

COPY adult.csv ./raw_data/adult.csv
COPY preprocessing.py ./preprocessing.py
COPY train.py ./train.py
COPY test.py ./test.py
