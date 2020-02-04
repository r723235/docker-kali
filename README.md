# docker-images

### Build

```
docker build --no-cache -t rafa/kali kali-linux
```


### Run

Drop into a disposable interactive shell:
```
docker run --rm -it rafa/kali
```


Mounts current working directory inside a disposable shell:
```
docker run --rm -it -v `pwd`:/${PWD##*/} -w /${PWD##*/} rafa/kali
```
