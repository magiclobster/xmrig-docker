# xmrig-docker

Docker Container for building and running xmrig. If you change dev donation please consider donating some bytes ;)

1. git clone https://github.com/magiclobster/xmrig-docker/
2. cd xmrig-docker
3. edit config.json
4. docker-compose up -d --build

dont forget to enable hugepages before starting container for more hashpower

e. g. echo 128 > /proc/sys/vm/nr_hugepages
