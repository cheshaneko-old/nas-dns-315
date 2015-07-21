# nas-dns-315

docker build -t nas-dns-315 .

docker run --rm -v $(pwd)/modules:/builded-modules -v $(pwd)/.config:/DNS-315_GPL_v1.00/GPL/linux-kernel/.config nas-dns-315
