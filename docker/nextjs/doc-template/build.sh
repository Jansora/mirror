docker build -t jansora/doc:v1 .
docker build -t ccr.ccs.tencentyun.com/jansora/doc:v1 .

docker push ccr.ccs.tencentyun.com/jansora/doc:v1
docker push jansora/doc:v1


