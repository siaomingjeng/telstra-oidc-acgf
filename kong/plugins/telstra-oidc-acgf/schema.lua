local typedefs = require "kong.db.schema.typedefs"

local function validate_params(conf)
  -- check redirect_uri
  local value = conf.redirect_uri
  if value == ngx.null or value == nil or value == "" then
    return true
  end
  if value:sub(1,1) == "/" then
    return true
  end
  if value:lower():sub(1,4) == "http" then
    return true
  end
  return false, "URL input error: this value can only be empty or start with / or http or HTTP."
end


return {
  name = "telstra-oidc-acgf",
  fields = {
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        custom_validator = validate_params,
        fields = {
          { client_id = { type = "string", required = true }, },
          { client_secret = { type = "string", required = true }, },
          { discovery = { type = "string", required = true, default = "https://.well-known/openid-configuration" }, },
          { introspection_endpoint = { type = "string", required = false }, },
          { timeout = { type = "number", required = false }, },
          { introspection_endpoint_auth_method = { type = "string", required = false }, },
          { bearer_only = { type = "string", required = true, default = "no" }, },
          { realm = { type = "string", required = true, default = "kong" }, },
          { redirect_uri = { type = "string" }, },
          { scope = { type = "string", required = true, default = "openid" }, },
          { response_type = { type = "string", required = true, default = "code" }, },
          { ssl_verify = { type = "string", required = true, default = "no" }, },
          { token_endpoint_auth_method = { type = "string", required = true, default = "client_secret_post" }, },
          { session_secret = { type = "string", required = false }, },
          { recovery_page_path = { type = "string" }, },
          { logout_path = { type = "string", required = false, default = '/logout' }, },
          { redirect_after_logout_uri = { type = "string", required = false, default = '/' }, },
          { filters = { type = "string" } },
        }
      }
    }
  }
}
