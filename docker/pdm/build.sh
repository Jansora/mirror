#docker build -t jansora/base:v6 .
#docker build -t ccr.ccs.tencentyun.com/jansora/base:v6 .
#
#docker build -t jansora/base:v6 .
docker build -t ccr.ccs.tencentyun.com/jansora/pdm:v1 .
#docker build -t ccr.ccs.tencentyun.com/jansora/base:v6 .

docker push ccr.ccs.tencentyun.com/jansora/pdm:v1
#docker push jansora/base:v6


