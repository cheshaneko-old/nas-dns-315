# nas-dns-315
Build kernel modules for D-link nas dns-315 with [docker](https://www.docker.com/)

First build image with command

```bash
docker build -t nas-dns-315 .
```
Then create directory where compiled kernel modules will be stored

```bash
mkdir modules
```

Enable needed modules in .config file

And start build

```bash
docker run --rm -v $(pwd)/modules:/builded-modules -v $(pwd)/.config:/DNS-315_GPL_v1.00/GPL/linux-kernel/.config nas-dns-315
```
