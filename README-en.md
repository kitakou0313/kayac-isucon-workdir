# isucon-tools
isuconで使うツール群をdockerで使えるようにまとめたtemplate

# How To Use
- Create repository based this template.
- Clone repository
- Run `make build`
    - build docker images for tools.
- Add hostname and `SSH` port number in `./hosts/hosts.txt`
    - Other scripts will access hosts defined in this file.

# Tools
- kataribe
    - https://github.com/matsuu/kataribe
    - Analyze web-server(nginx, etc...) access log.
- mysqlslowdump
    - Analyze mysql slow log
- pprof
    - Analyze golang application performance.


# Test scripts
- `deploy-test` container is accessible with ssh, and `nginx`, `mysql` is installed. Please use this to test your deploy scripts.

# ToDo
- Define CI test


## Refs
- https://qiita.com/y-vectorfield/items/587d3f3a6eec8f251f3c
- https://blog.yuuk.io/entry/web-operations-isucon