FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

RUN apt-get update
RUN apt-get install -y g++ openjdk-8-jdk python3-dev 
RUN apt install -y zip unzip git git-lfs wget curl make
RUN pip install jupyterlab matplotlib transformers pandas sklearn konlpy kiwipiepy
ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk"

# Mecab
RUN wget https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz && \
	tar xvfz mecab-0.996-ko-0.9.2.tar.gz && \
	cd mecab-0.996-ko-0.9.2 && \
	./configure && \
	make && \
	make check && \
	make install && \
	ldconfig && \
	mecab --version 
	
# Mecab-ko-dic
RUN wget https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.1.1-20180720.tar.gz && \
	tar xvfz mecab-ko-dic-2.1.1-20180720.tar.gz && \
	cd mecab-ko-dic-2.1.1-20180720 && \
	./configure && \
	make && \
	make install

RUN curl -s https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh && \
	pip install mecab-python
	
# kaggle api
# RUN mkdir /root/.kaggle
# RUN pip install kaggle

# Install Jupyter
RUN mkdir -p /root/.jupyter/NLP
WORKDIR /root/.jupyter
RUN jupyter notebook --generate-config

# 주피터 서버 설정
# RUN echo "c.NotebookApp.password = u'sha1:70b72fef724c:2b1518d4d7db2512f7832e4ba5041bedad68726d'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.notebook_dir = '/home/workspace'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py

# sudo docker run -it -p 8888:8888 --name nlp --gpus all -v /home/halo/NLP:/root/.jupyter/NLP IMAGE_ID

