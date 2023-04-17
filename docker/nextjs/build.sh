docker build -t jansora/nextjs:v1 .
docker build -t ccr.ccs.tencentyun.com/jansora/nextjs:v1 .

docker push ccr.ccs.tencentyun.com/jansora/nextjs:v1
docker push jansora/nextjs:v1


