#docker build -t jansora/app:v1 .
#docker build -t ccr.ccs.tencentyun.com/jansora/app:v1 .
#docker push ccr.ccs.tencentyun.com/jansora/app:v1
#docker push jansora/app:v1

docker build -t jansora/app:v2  .
docker build -t ccr.ccs.tencentyun.com/jansora/app:v2 .
docker push ccr.ccs.tencentyun.com/jansora/app:v2
#docker push jansora/app:v2


