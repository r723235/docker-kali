# docker-kali

Inspired by [ropnop's blog](https://blog.ropnop.com/docker-for-pentesters/) and built from the [kalilinux/kali-rolling](https://www.kali.org/docs/containers/official-kalilinux-docker-images/) base image, this Dockerfile includes several frequently used Kali tools. It is meant to provide a disposable, yet powerful, Kali environment.

### Build

```
docker build -t rafa/kali:latest .
```

Image size is approximately 4.8 GB.

### Run

Drop into a disposable interactive shell:
```
docker run --rm -it rafa/kali
```


Mounts current working directory inside a disposable shell:
```
docker run --rm -it -v `pwd`:/${PWD##*/} -w /${PWD##*/} rafa/kali
```

---

Make sure to start the postgres database:
```
service postgresql start
```
or using the alias:
```
db
```
