#docker build -t jansora/base:v6 .
#docker build -t ccr.ccs.tencentyun.com/jansora/base:v6 .
#
#docker push ccr.ccs.tencentyun.com/jansora/base:v6
#docker push jansora/base:v6

docker build -t jansora/java-base:v1 .
docker tag jansora/java-base:v1 registry.cn-hongkong.aliyuncs.com/jansora/java-base:v1
docker push registry.cn-hongkong.aliyuncs.com/jansora/java-base:v1
#docker build -t registry.cn-hongkong.aliyuncs.com/jansora/base:v3 .