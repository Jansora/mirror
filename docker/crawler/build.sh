docker build -t ghcr.io/jansora/crawler:v1 .
docker build -t jansora/crawler:v1 .
docker build -t ccr.ccs.tencentyun.com/jansora/crawler:v1 .

docker push ghcr.io/jansora/crawler:v1
docker push jansora/crawler:v1
docker push ccr.ccs.tencentyun.com/jansora/crawler:v1
