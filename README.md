# ko-nlp-docker

한글 NLP 할때 환경설정 귀찮아서 만든 Dockerfile

**특히 Mecab...**

OS는 pytorch의 CUDA 버전

# Latest

**[Pytorch, HuggingFace, Konlpy(Mecab), Jupyter Lab]**


# goofys
**For moutn S3**

**[Pytorch, HuggingFace, Konlpy(Mecab), Jupyter Lab, goofys]**

## Docker pull

```
docker pull dev7halo/ko-nlp
```

## Docker Run

### Latest
```
$ sudo docker run -it -p 8888:8888 --name jupyter --gpus all -v /home/halo/NLP:/root/.jupyter/NLP IMAGE_ID
```
### goofys
```
$ sudo docker run -it --privileged -p 8888:8888 --name nlp --gpus all -v /home/halo/NLP:/root/.jupyter/NLP IMAGE_ID

# in container 
$ aws configure
$ goofys -f S3_BUCKET YOURDIR
```


## Reference
* https://github.com/huggingface/transformers
* https://hub.docker.com/r/dev7halo/ko-nlp
* https://bitbucket.org/eunjeon/mecab-ko-dic/src/master/
* https://konlpy.org/ko/latest/index.html
* https://github.com/kahing/goofys
