# ws-dnmp

#### 介绍
dnmp初学，主要搭建基础的lnmp环境

#### 软件架构
软件架构说明
安装了php,mysql,nginx,redis,swoole,elasticsearch等服务，如果想安装其他服务，可自行添加。


#### 安装教程

1. docker-compose up -d启动所有服务
2. 安装composer
    在主机创建一个目录，用以保存composer的配置和缓存文件：
    mkdir ~/ws-dnmp/composer
    打开主机的 ~/.bashrc 或者 ~/.zshrc 文件，加上：
    composer () { 
        tty=
        tty -s && tty=--tty
        docker run \
            $tty \
            --interactive \
            --rm \
            --user $(id -u):$(id -g) \
            --volume ~/dnmp/composer:/tmp \
            --volume /etc/passwd:/etc/passwd:ro \
            --volume /etc/group:/etc/group:ro \
            --volume $(pwd):/app \
            composer "$@"
    }
    
    让文件起效：
    source ~/.bashrc
    在主机的任何目录下就能用composer了
3. chmod -R 777 esdata

#### 参与贡献

1. https://docs.docker.com/samples/library/elasticsearch
