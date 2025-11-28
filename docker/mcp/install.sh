docker build -t ccr.ccs.tencentyun.com/jansora/mcp:0.0.1 .
docker push  ccr.ccs.tencentyun.com/jansora/mcp:0.0.1
skopeo copy docker://ccr.ccs.tencentyun.com/jansora/mcp:0.0.1 docker://ghcr.io/jansora/mcp:0.0.1