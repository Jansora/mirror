#docker build -t jansora/base:v6 .
#docker build -t ccr.ccs.tencentyun.com/jansora/base:v6 .
#
#docker push ccr.ccs.tencentyun.com/jansora/base:v6
#docker push jansora/base:v6

docker build -t jansora/base:v3 .
docker tag jansora/base:v3 registry.cn-hongkong.aliyuncs.com/jansora/base:v3
docker push registry.cn-hongkong.aliyuncs.com/jansora/base:v3
#docker build -t registry.cn-hongkong.aliyuncs.com/jansora/base:v3 .