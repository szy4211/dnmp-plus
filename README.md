# DNMP PLUS

---

**相对 [guanguans](https://github.com/guanguans) 的 [dnmp-plus](https://github.com/guanguans/dnmp-plus) 做出如下变更：

* 新增 MongoDB 副本集
* 移除 PHP5.6版本
* 调整目录结构

---

## 目录结构

``` bash
├── .github                         Github 配置目录
├── conf                            配置文件目录
│   ├── nginx                       Nginx 配置
│   |   ├── conf.d                  Nginx 用户站点配置目录
│   |   ├── nginx.conf              Nginx 默认配置文件
│   ├── mysql                       Mysql 配置
│   │   ├── my.cnf                  MySQL 用户配置文件
│   ├── redis                       Redis 配置
│   │   ├── redis.conf              Redis 配置文件
│   ├── mongo                       Mongo 配置
│   ├── mongo-rs                    Mongo 副本集 配置
│   ├── php                         PHP 配置
│   │   ├── php.ini                 PHP 配置文件
│   │   ├── php-fpm.conf            PHP-FPM 配置文件
├── bin                             命令目录
│   ├── mongo-rs                    Mongo 副本集 命令
│   ├── php                         PHP 命令
│   │   ├── extensions              PHP 扩展源码包
│   │   ├── Dockerfile              PHP 镜像构建文件
├── www                             站点代码目录
├── data                            数据目录
├── log                             日志目录
├── env.smaple                      环境配置示例文件
└── travis-build.sh                 Travis CI 构建脚本
```

---

## 详细介绍请参考 [guanguans](https://github.com/guanguans) 的 [dnmp-plus](https://github.com/guanguans/dnmp-plus) 

## License

[MIT](LICENSE)
