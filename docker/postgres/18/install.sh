export PG_TAG=18.0
docker build -t  ccr.ccs.tencentyun.com/jansora/postgres:18.0_with_plugins  .
docker push  ccr.ccs.tencentyun.com/jansora/postgres:18.0_with_plugins