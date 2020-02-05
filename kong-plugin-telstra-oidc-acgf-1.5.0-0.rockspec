package = "kong-plugin-telstra-oidc-acgf"
version = "1.5.0-0"
source = {
    url = "git://github.com/siaomingjeng/kong-telstra-oidc-acgf",
    tag = "v1.5.0"
}
description = {
    summary = "A Kong plugin for implementing the OpenID Connect Authorization Code Grant Flow (ACGF) functionality",
    detailed = [[
        kong-plugin-telstra-oidc-acgf is a Kong plugin for implementing the OpenID Connect Authorization Code Grant Flow and add in the Client Crendentials Grat Flow in the near future.
        This plugin is developed based the open source code of https://github.com/nokia/kong-oidc, updating to the latest Kong CE.
    ]],
    homepage = "https://github.com/siaomingjeng/kong-telstra-oidc-acgf",
    maintainer = "Dr. Raymond Zheng <raymond.zheng@health.telstra.com>"
}
dependencies = {
    "lua >= 5.1",
    "lua-resty-openidc >= 1.7.2"
}
build = {
    type = "builtin",
    modules = {
        ["kong.plugins.telstra-oidc-acgf.filter"]  = "kong/plugins/telstra-oidc-acgf/filter.lua",
        ["kong.plugins.telstra-oidc-acgf.handler"] = "kong/plugins/telstra-oidc-acgf/handler.lua",
        ["kong.plugins.telstra-oidc-acgf.schema"]  = "kong/plugins/telstra-oidc-acgf/schema.lua",
        ["kong.plugins.telstra-oidc-acgf.session"] = "kong/plugins/telstra-oidc-acgf/session.lua",
        ["kong.plugins.telstra-oidc-acgf.utils"]   = "kong/plugins/telstra-oidc-acgf/utils.lua"
    }
}
