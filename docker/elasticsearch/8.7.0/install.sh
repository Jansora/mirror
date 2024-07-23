docker pull registry.cn-hongkong.aliyuncs.com/jansora/elasticsearch:8.7.0

docker build -t registry.cn-hongkong.aliyuncs.com/jansora/elasticsearch:8.7.0_with_plugins .

docker push registry.cn-hongkong.aliyuncs.com/jansora/elasticsearch:8.7.0_with_plugins