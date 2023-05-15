local URLRewriter = {
  PRIORITY = 700,
  VERSION = "1.2.0"
}

function split(s, delimiter)
  local result = {}
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
      table.insert(result, match)
  end
  return result
end

function resolveUrlParams(requestParams, url)
  for paramValue in requestParams do
    local requestParamValue = ngx.ctx.router_matches.uri_captures[paramValue]
    if type(requestParamValue) == 'string' then
      requestParamValue = requestParamValue:gsub("%%", "%%%%")
    end
    url = url:gsub("<" .. paramValue .. ">", requestParamValue)
  end
  return url
end


function removeMatchedRoutePath()

  -- 获取与当前请求匹配的路由对象
  local matched_route = kong.router.get_route()

  -- 获取当前请求的 URI
  local request_uri = ngx.var.uri

  -- 检查匹配的路径
  local matched_path

  if matched_route and matched_route.paths then
    for _, path in ipairs(matched_route.paths) do
      -- 使用 Lua 的 string.find 函数检查是否匹配
      if string.find(request_uri, path) then
        matched_path = path
        break
      end
    end
  end

  return request_uri:gsub("^"..matched_path, "")

end

function getRequestUrlParams(url)
  return string.gmatch(url, "<(.-)>")
end

function URLRewriter:access(config)
  if config.query_string ~= nil then

    local args = ngx.req.get_uri_args()
    for k, queryString in ipairs(config.query_string) do
      local splitted = split(queryString, '=')
      local key, value = splitted[1], splitted[2]
      local queryParams = getRequestUrlParams(value)
      local resolvedParams = resolveUrlParams(queryParams, value)
      args[key] = resolvedParams
    end
    ngx.req.set_uri_args(args)
  end

  local requestParams = getRequestUrlParams(config.url)


  local uri_suffix = removeMatchedRoutePath()
  local merged_uri = config.url..uri_suffix
  local url = resolveUrlParams(requestParams, merged_uri)


  --local service_path = ngx.ctx.service.path or ""
  --if service_path ~= "" then
  --  url = service_path..url
  --end


  ngx.log(ngx.INFO, "kong-rewrite-url-plugin working. source: [", ngx.var.uri, "].  target: [", url )



  ngx.var.upstream_uri = url
end

return URLRewriter
