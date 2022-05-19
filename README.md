# ko-nlp-docker
for korean nlp with HuggingFace, Konlpy, Jupyter lab

# Hugging Face🤗

**구성 [Pytorch, HuggingFace, Konlpy(Mecab), Jupyter Lab]**

한글 NLP 개발하면서 제가 자주 쓰는 GPU 환경 셋팅입니다.

## Docker pull

```
docker pull dev7halo/ko-nlp
```

## Docker Run
Jupyter port 8888, container name nlp, use gpu, mount folder from /home/halo/NLP to /root/.jupyter/NLP
```
sudo docker run -it -p 8888:8888 --name jupyter --gpus all -v /home/halo/NLP:/root/.jupyter/NLP 6960dfd63b94 jupyter lab
```


## Reference
* https://github.com/huggingface/transformers
* https://hub.docker.com/r/dev7halo/ko-nlp
* https://bitbucket.org/eunjeon/mecab-ko-dic/src/master/
* https://konlpy.org/ko/latest/index.html
